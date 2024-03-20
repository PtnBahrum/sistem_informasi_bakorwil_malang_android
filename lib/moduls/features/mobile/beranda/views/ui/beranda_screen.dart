import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistem_informasi_bakorwil_malang/configs/assets/svg/main_svg.dart';
import 'package:sistem_informasi_bakorwil_malang/configs/route/main_route.dart';
import 'package:sistem_informasi_bakorwil_malang/configs/theme/main_color.dart';
import '../../../../../../shared/widgets/drawer.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import '../components/custom_menu_botton.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  List<CarouselItem> itemList = [
    CarouselItem(
      image: const NetworkImage(
        'https://bakorwilmalang.jatimprov.go.id/images/slider/0ebe586a8fb6cfe1a6693f6486816881.jpg',
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title: 'Ibu Gubernur Jawa Timur Memberangkatkan Peserta Jalan Sehat',
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 14.sp,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      leftSubtitle: '11 Nov 2023',
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const NetworkImage(
        'https://bakorwilmalang.jatimprov.go.id/images/slider/3761c984de8f4666e50af92146651b6d.jpeg',
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title:
          'Silaturahmi TP-PKK, DWP, GOW dan PERWOSI sewilayah kerja Bakorwil III Malang',
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 14.sp,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      leftSubtitle: '22 Feb 2024',
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const NetworkImage(
        'https://bakorwilmalang.jatimprov.go.id/images/slider/d3530464dc4a842a379e0f0f8d6799b1.jpg',
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title: 'Puncak HUT ke-74 DWP Bakorwil III Malang',
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 14.sp,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      leftSubtitle: '19 Dec 2023',
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const NetworkImage(
        'https://bakorwilmalang.jatimprov.go.id/images/slider/95dbfeacad89edc5cdd3fa10eb39e2d3.jpeg',
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title: 'Juara II Kompetisi Think Bureaucracy 2023',
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 14.sp,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      leftSubtitle: '25 Nov 2023',
      onImageTap: (i) {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F6),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  CustomCarouselSlider(
                    items: itemList,
                    height: 180,
                    subHeight: 50,
                    width: MediaQuery.of(context).size.width,
                    autoplay: true,
                    indicatorShape: BoxShape.circle,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: Colors.grey.shade300), // Warna border
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomMenuButton(
                            onPressed: () {
                              Get.toNamed(MainRoute.kegiatan);
                            },
                            text: 'Kegiatan',
                            svgPath: MainSvg.kegiatan,
                          ),
                        ),
                        Expanded(
                          child: CustomMenuButton(
                            onPressed: () {},
                            text: 'Pengumuman',
                            svgPath: MainSvg.pengumuman,
                          ),
                        ),
                        Expanded(
                          child: CustomMenuButton(
                            onPressed: () {},
                            text: 'PPID',
                            svgPath: MainSvg.ppid,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomMenuButton(
                            onPressed: () {},
                            text: 'Visi & Misi',
                            svgPath: MainSvg.visi,
                          ),
                        ),
                        Expanded(
                          child: CustomMenuButton(
                            onPressed: () {},
                            text: 'Organisasi',
                            svgPath: MainSvg.organisasi,
                          ),
                        ),
                        Expanded(
                          child: CustomMenuButton(
                            onPressed: () {},
                            text: 'SKIP & RB',
                            svgPath: MainSvg.skip,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  border:
                      Border.all(color: Colors.grey.shade300), // Warna border
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Berita',
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: MainColor.primary_300,
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 2),
                              child: Text(
                                'Selengkapnya',
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                  color: MainColor.neutral_400,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
