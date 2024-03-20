import 'package:googleapis/calendar/v3.dart' as GoogleAPI;

class Event {
  final String id;
  final String title;
  final DateTime date;

  Event({required this.id, required this.title, required this.date});

  factory Event.fromGoogleAPIEvent(GoogleAPI.Event event) {
    return Event(
      id: event.id ?? '',
      title: event.summary ?? '',
      date: event.start?.dateTime?.toLocal() ?? DateTime.now(),
    );
  }
}
