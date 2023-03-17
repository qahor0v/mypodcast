import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  static Box box = Hive.box("podcast_id");

  static Future<void> saveId(String id) async {
    return await box.put(id, id);
  }

  static Future<String> getId(String id) async {
    return await box.get(id).toString();
  }

  static Future<void> deleteId(String id) async {
    await box.delete(id);
  }

  static Iterable getAllId()  {
    return  box.values;
  }
}
