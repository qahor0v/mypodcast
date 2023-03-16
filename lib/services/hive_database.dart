import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  var box = Hive.box("podcast_id");

  Future saveId(String id) async {
    await box.put(id, id);
  }

  Future getId(String id) async {
    return await box.get(id).toString();
  }

  Future deleteId(String id) async {
    await box.delete(id);
  }

  Future getAllId() async {
    return await box.values;
  }
}
