import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis/calendar/v3.dart' as GoogleAPI;
import '../../../../../../configs/theme/main_color.dart';
import '../../../../../../shared/widgets/drawer.dart';
import '../../controllers/kalender_controller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../components/bullet_point_text.dart';

class KalenderScreen extends StatelessWidget {
  const KalenderScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final KalenderController controller = Get.put(KalenderController());

    // Mendapatkan tahun dan bulan saat ini
    DateTime now = DateTime.now();
    DateTime initialDate = DateTime(now.year, now.month, 1);

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
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SfCalendar(
                  view: CalendarView.month,
                  initialDisplayDate: initialDate,
                  viewHeaderStyle: ViewHeaderStyle(
                    backgroundColor: Colors.transparent,
                    dayTextStyle: GoogleFonts.poppins(
                      color: MainColor.neutral_900,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    dateTextStyle: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: MainColor.neutral_400,
                    ),
                  ),
                  headerStyle: CalendarHeaderStyle(
                    textAlign: TextAlign.center,
                    textStyle: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: MainColor.neutral_900,
                    ),
                  ),
                  dataSource: GoogleDataSource(events: controller.events),
                  monthViewSettings: const MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment,
                  ),
                  showNavigationArrow: true,
                  headerHeight: 80,
                  onTap: (CalendarTapDetails details) {
                    if (details.targetElement == CalendarElement.calendarCell) {
                      final DateTime date = details.date!;
                      final List<GoogleAPI.Event> events =
                          controller.getEventsOnDate(date);
                      if (events.isNotEmpty) {
                        Get.to(EventListScreen(events: events, date: date));
                      }
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Keterangan :',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BulletPoint(
                        text:
                            '(KAJ)  : Bagian Kelembagaan dan Analisa Jabatan'),
                    BulletPoint(text: '(RB)   : Bagian Reformasi Birokasi'),
                    BulletPoint(text: '(TL)   : Bagian Tatalaksana'),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              )
            ],
          );
        }
      }),
    );
  }
}

class GoogleDataSource extends CalendarDataSource {
  final List<GoogleAPI.Event>? events;

  GoogleDataSource({required this.events});

  @override
  DateTime getStartTime(int index) {
    final GoogleAPI.Event event = events![index];
    return event.start!.dateTime!.toLocal();
  }

  @override
  bool isAllDay(int index) {
    return events![index].start?.date != null;
  }

  @override
  DateTime getEndTime(int index) {
    final GoogleAPI.Event event = events![index];
    return event.end!.dateTime!.toLocal();
  }

  @override
  String getLocation(int index) {
    return events![index].location ?? '';
  }

  @override
  String getNotes(int index) {
    return events![index].description ?? '';
  }

  @override
  String getSubject(int index) {
    final GoogleAPI.Event event = events![index];
    return event.summary ?? 'No Title';
  }
}

class EventListScreen extends StatelessWidget {
  final List<GoogleAPI.Event> events;
  final DateTime date;

  const EventListScreen({Key? key, required this.events, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events on ${date.day}/${date.month}/${date.year}'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final GoogleAPI.Event event = events[index];
          return ListTile(
            title: Text(event.summary ?? 'No Title'),
            subtitle: Text(event.start?.dateTime?.toLocal().toString() ?? ''),
          );
        },
      ),
    );
  }
}
