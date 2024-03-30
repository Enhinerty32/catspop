import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapButton extends StatelessWidget {
  final LatLng houseLocation = LatLng(40.748817, -73.985428); // Coordenadas de un lugar aleatorio


// Modificar build.gradle y tambien otra modificacion ahi exlora la documentafion necesesitas api de google cloud y asi 
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Lugar donde vive',
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HouseLocationMap(houseLocation: houseLocation),
            ),
          );
        },
        icon: Icon(size: 30, Icons.location_on_outlined),
      ),
    );
  }
}

class HouseLocationMap extends StatelessWidget {
  final LatLng houseLocation;

  HouseLocationMap({required this.houseLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicación de la casa'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: houseLocation,
          zoom: 14.4746,
        ),
        markers: {
          Marker(
            markerId: MarkerId('house'),
            position: houseLocation,
            infoWindow: InfoWindow(title: 'Casa'),
          ),
        },
      ),
    );
  }
}