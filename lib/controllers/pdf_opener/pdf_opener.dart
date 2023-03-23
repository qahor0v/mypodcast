import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class PDFOpener {
  static late String? url;

  static Future<File> openMe() async {
    var _url = Uri.parse(url!);
    final file = await loadNetwork(_url);
    return file;
  }

  static Future<File> loadNetwork(Uri url) async {
    final response = await http.get(url);
    final bytes = response.bodyBytes;
    return _storeFile(url, bytes);
  }

  static Future<File> _storeFile(Uri url, List<int> bytes) async {
    final filename = basename(url.toString());
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/$filename");
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
