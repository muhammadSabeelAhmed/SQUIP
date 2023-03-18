import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:squip_assignment/constants/string_constants.dart';
import 'package:squip_assignment/viewModels/map_viewmodel.dart';
import 'package:squip_assignment/views/tabs/ambulance_view.dart';
import 'package:stacked/stacked.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key, Widget? widget}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  String? _currentAddress;
  Position? _currentPosition;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MapViewModel>.reactive(
        viewModelBuilder: () => MapViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(StringConstants.appName),
            ),
            body: Stack(
              children: [
                GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: viewModel.initialLocation,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: markers.values.toSet(),
                ),
                Positioned(
                  bottom: 100,
                  right: 0,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      _getCurrentPosition(viewModel);
                    },
                    label: const Text('Current Location'),
                    icon: const Icon(Icons.my_location),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        // if (viewModel.mapService.ty ==
                        //     StringConstants.ambulance) {
                        return StringConstants.map_widgets!;
                        // }
                      },
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // floatingActionButton: FloatingActionButton.extended(
            //   onPressed: () {
            //     _getCurrentPosition(viewModel);
            //   },
            //   label: const Text('Current Location'),
            //   icon: const Icon(Icons.my_location),
            // ),
          );
        });
  }

  Future<void> _getCurrentPosition(MapViewModel viewModel) async {
    final hasPermission = await viewModel.handleLocationPermission(context);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(position.latitude, position.longitude),
              tilt: 59.440717697143555,
              zoom: 19.151926040649414),
        ),
      );
      final marker = Marker(
        markerId: MarkerId('Accident Location'),
        position: LatLng(position.latitude, position.longitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: 'Sabeel Location',
          snippet: '$_currentAddress',
        ),
      );
      setState(() {
        _currentPosition = position;
        markers[marker.markerId] = marker;
      });
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
        print(_currentAddress);
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
