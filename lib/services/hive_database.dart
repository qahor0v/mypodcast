import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  // bookmarks
  static Box<String> box = Hive.box<String>("podcast_id");

  static Listenable get podcastListenable => box.listenable();

  static Future<void> saveId(String id) async {
    return await box.put(id, id);
  }

  static Future<String> getId(String id) async {
    return box.get(id).toString();
  }

  static Future<void> deleteId(String id) async {
    await box.delete(id);
  }

  static Iterable<String> getAllId() {
    return box.values;
  }
}
