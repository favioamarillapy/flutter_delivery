import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_delivery/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late String cityName = 'Getting location...';

  @override
  void initState() {
    super.initState();

    _getLocation();
  }

  Future<void> _getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else {
      if (!serviceEnabled) {
        return Future.error('Please enable location service');
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      setState(() {
        cityName = placemarks.first.locality ?? 'Desconocido';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: FontAwesomeIcons.bars,
            color: Colors.white70,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          Column(
            children: [
              const Text(
                "Location",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.map,
                    color: Colors.blueGrey,
                  ),
                  Text(
                    cityName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              )
            ],
          ),
          CustomIconButton(
            icon: FontAwesomeIcons.bell,
            color: Colors.white70,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
