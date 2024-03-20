import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../configs/theme/main_color.dart';
import '../../../../../../shared/widgets/drawer.dart';

class PetaScreen extends StatefulWidget {
  const PetaScreen({super.key});

  @override
  State<PetaScreen> createState() => _PetaScreenState();
}

class _PetaScreenState extends State<PetaScreen> {
  late GoogleMapController mapController;

  final LatLng _bakorwil = const LatLng(-7.963369921724902, 112.6240794803816);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void openGoogleMaps(double latitude, double longitude) async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bakorwil III',
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: MainColor.neutral_900,
              ),
            ),
            Text(
              'Malang',
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: MainColor.neutral_900,
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: EdgeInsets.only(
            left: 8.sp,
            top: 8.sp,
            bottom: 8.sp,
          ),
          child: Image.asset('assets/images/ic_bakorwil.png'),
        ),
      ),
      endDrawer: DrawerWidget(),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _bakorwil,
              zoom: 18,
            ),
            markers: {
              Marker(
                markerId: MarkerId('bakorwil_malang'),
                position: _bakorwil,
                infoWindow: InfoWindow(
                  title: 'Bakorwil III Malang',
                  snippet: 'Tap for details',
                  onTap: () {
                    openGoogleMaps(_bakorwil.latitude, _bakorwil.longitude);
                  },
                ),
              )
            },
          ),
          Positioned(
            top: 16.0,
            right: 16.0,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    openGoogleMaps(_bakorwil.latitude, _bakorwil.longitude);
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.06,
                    child: Center(
                      child: Icon(Icons.map),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
