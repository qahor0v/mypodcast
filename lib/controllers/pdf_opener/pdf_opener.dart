import 'dart:io';
import 'package:ebook_app/pages/pdf_viewer_page/pdf_viewer_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class PDFOpener {
  static bool isComplatedLoading = false;

  static Future<File> openMe() async {
    print("OpenMe function is WORKING");
    const url = "https://firebasestorage."
        "googleapis.com/v0/b/mypodcast-17f3e.appspot."
        "com/o/00.pdf?alt=media&token=df203917-f1fa-"
        "4a17-a071-1fc3259c8980";
    var _url = Uri.parse(url);
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
    isComplatedLoading = true;
    return file;
  }
}
