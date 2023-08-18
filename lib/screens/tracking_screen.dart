import 'package:flutter/material.dart';
import 'package:flutter_delivery/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
                  color: const Color.fromRGBO(254, 78, 2, 1),
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

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/tracking.png"),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "En camino",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Padding(
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
                          color: Color.fromRGBO(254, 78, 2, 1),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Calle 13 de Setiembre c/ Rca El Salvador",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                ],
              )
            ],
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
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://scontent.fasu11-1.fna.fbcdn.net/v/t39.30808-6/313991432_1566225937160926_5527145247371560145_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=zWX8q6DFymgAX-b7eE5&_nc_ht=scontent.fasu11-1.fna&oh=00_AfAWdWrCCUto5NqxBrZ7g69f6F2uUnkWOjQl6N9eNz7aiA&oe=64E3ADC4"),
              ),
              SizedBox(width: 10),
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
                color: const Color.fromRGBO(254, 78, 2, 1),
                radius: 50,
                onPressed: () {},
              ),
              const SizedBox(width: 5),
              CustomIconButton(
                icon: FontAwesomeIcons.phone,
                iconColor: Colors.white,
                iconSize: 15,
                color: const Color.fromRGBO(254, 78, 2, 1),
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

class _HeaderMap extends StatelessWidget {
  const _HeaderMap();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: GoogleMap(
        onMapCreated: (GoogleMapController controller) {},
        initialCameraPosition: const CameraPosition(
          target: LatLng(-25.413613, -57.297989),
          zoom: 17,
        ),
        markers: {
          const Marker(
            markerId: MarkerId('Ypacarai'),
            position: LatLng(-25.413613, -57.297989),
          )
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
          ),
          CustomIconButton(
            icon: Icons.favorite_border_sharp,
            color: Colors.white70,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
