import 'package:flutter/material.dart';
import 'package:flutter_delivery/theme/app_theme.dart';
import 'package:flutter_delivery/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Stack(
                    children: [
                      _HeaderMap(),
                      _HeaderButtons(),
                    ],
                  ),
                  const _DeliveryData(),
                  const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Divider()),
                  _DeliveryTrackingInfo(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: double.infinity,
                  color: themePrimaryColor,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Orden Recibida",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeliveryTrackingInfo extends StatelessWidget {
  _DeliveryTrackingInfo();

  void _launchGoogleMaps() async {
    double lat = -25.41349337837772;
    double lng = -57.29801486507635;

    final Uri googleMapsUrl =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$lng");

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else {
      throw 'No se pudo abrir Google Maps. Intente nuevamente más tarde.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "En camino",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "|",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Text(
                    "10 Min.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: themePrimaryColor,
                    ),
                  ),
                ],
              ),
              const Text(
                "Calle 13 de Setiembre c/ Rca El Salvador",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: _launchGoogleMaps,
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/maps.png"),
            ),
          ),
        ],
      ),
    );
  }
}

class _DeliveryData extends StatelessWidget {
  const _DeliveryData();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Favio Amarilla Miño",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "GH1S 7902",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              CustomIconButton(
                icon: FontAwesomeIcons.message,
                iconColor: Colors.white,
                iconSize: 15,
                color: themePrimaryColor,
                radius: 50,
                onPressed: () {},
              ),
              const SizedBox(width: 5),
              CustomIconButton(
                icon: FontAwesomeIcons.phone,
                iconColor: Colors.white,
                iconSize: 15,
                color: themePrimaryColor,
                radius: 50,
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _HeaderMap extends StatefulWidget {
  const _HeaderMap();

  @override
  State<_HeaderMap> createState() => _HeaderMapState();
}

class _HeaderMapState extends State<_HeaderMap> {
  static const LatLng destination = LatLng(-25.413613, -57.297989);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: GoogleMap(
        onMapCreated: (GoogleMapController controller) {},
        initialCameraPosition: const CameraPosition(
          target: LatLng(-25.413613, -57.297989),
          zoom: 16,
        ),
        markers: {
          const Marker(
            markerId: MarkerId("destination"),
            position: destination,
          ),
        },
      ),
    );
  }
}

class _HeaderButtons extends StatelessWidget {
  const _HeaderButtons();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: Icons.arrow_back,
            color: Colors.white70,
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
