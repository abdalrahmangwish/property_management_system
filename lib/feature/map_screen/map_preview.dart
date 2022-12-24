import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPreview extends StatefulWidget {
  final LatLng latLng;
  final int id;

  const MapPreview({
    Key? key,
    required this.latLng,
    required this.id,
  }) : super(key: key);

  @override
  _MapPreview createState() => _MapPreview();
}

class _MapPreview extends State<MapPreview> {
  GoogleMapController? mapController;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    markers[MarkerId(widget.id.toString())] = Marker(
        markerId: MarkerId(widget.id.toString()),
        alpha: 0.8,
        onTap: () {},
        position: widget.latLng,
        icon: BitmapDescriptor.defaultMarker);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: GoogleMap(
          markers: Set<Marker>.of(markers.values),
          onMapCreated: onMapCreated,
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
            new Factory<OneSequenceGestureRecognizer>(
              () => new EagerGestureRecognizer(),
            ),
          ].toSet(),
          mapToolbarEnabled: false,
          zoomGesturesEnabled: false,
          zoomControlsEnabled: false,
          scrollGesturesEnabled: false,
          myLocationButtonEnabled: true,
          initialCameraPosition:
              CameraPosition(target: widget.latLng, zoom: 12),
        ),
      ),
    );
  }

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}

/*
*        MapPreview(
                    id: bloc.propertyDetailsModel!.id ?? -1,
                    latLng: LatLng(bloc.propertyDetailsModel!.lat ?? 0,
                        bloc.propertyDetailsModel!.lan ?? 0),
                  ),*/
