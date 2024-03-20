import 'package:get/get.dart';
import 'package:googleapis/calendar/v3.dart' as GoogleAPI;
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' show IOClient, IOStreamedResponse;
import 'package:http/http.dart' as http;
import 'dart:convert';

class KalenderRepository extends GetxService {
  Future<List<GoogleAPI.Event>> getPublicGoogleEventsData() async {
    try {
      // Buat HTTP klien tanpa otentikasi
      final client = http.Client();

      // Request data dari kalender publik
      final response = await client.get(Uri.parse(
          'https://www.googleapis.com/calendar/v3/calendars/rorgan.jatim@gmail.com/events'));

      // Cek status response
      if (response.statusCode == 200) {
        // Decode data JSON
        final jsonData = json.decode(response.body);

        // Ambil daftar acara dari JSON
        final List<dynamic> items = jsonData['items'];

        // Konversi JSON menjadi objek Event
        final List<GoogleAPI.Event> events = items
            .map<GoogleAPI.Event>((json) => GoogleAPI.Event.fromJson(json))
            .toList();

        return events;
      } else {
        // Handle error jika tidak berhasil mendapatkan data
        throw Exception('Failed to load events');
      }
    } catch (error) {
      // Tangani kesalahan
      print('Error fetching Google events: $error');
      rethrow; // Rethrow to let the controller handle it
    }
  }
}

class GoogleAPIClient extends IOClient {
  final Map<String, String> _headers;

  GoogleAPIClient(this._headers) : super();

  @override
  Future<IOStreamedResponse> send(http.BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<http.Response> head(Uri url, {Map<String, String>? headers}) =>
      super.head(url,
          headers: (headers != null ? (headers..addAll(_headers)) : headers));
}
