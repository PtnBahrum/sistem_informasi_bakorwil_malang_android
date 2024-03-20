import 'package:get/get.dart';
import 'package:googleapis/calendar/v3.dart' as GoogleAPI;
import '../repositories/kalender_repository.dart';

class KalenderController extends GetxController {
  static KalenderController get to => Get.find();
  late final KalenderRepository repository;

  final RxList<GoogleAPI.Event> events = <GoogleAPI.Event>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEventsData();
  }

  Future<void> fetchEventsData() async {
    try {
      isLoading.value = true;
      final List<GoogleAPI.Event> fetchedEvents =
          await repository.getPublicGoogleEventsData();
      events.assignAll(fetchedEvents);
    } catch (error) {
      print('Error fetching events: $error');
    } finally {
      isLoading.value = false;
    }
  }

  List<GoogleAPI.Event> getEventsOnDate(DateTime date) {
    return events.where((event) {
      if (event.start?.date != null) {
        return event.start?.date == date.toString();
      } else {
        return event.start?.dateTime?.year == date.year &&
            event.start?.dateTime?.month == date.month &&
            event.start?.dateTime?.day == date.day;
      }
    }).toList();
  }
}
