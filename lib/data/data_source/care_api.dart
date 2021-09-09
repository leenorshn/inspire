import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class CareApi {
  Future<List<Care>> getCare() async {
    var data = await rootBundle.loadString('care.json');
    List careData = json.decode(data);

    return careData.map((e) => Care.fromJson(e)).toList();
  }
}

class Care {
  late String title;
  late String content;
  String? image;
  late int color;

  Care.fromJson(Map<String, dynamic> json) {
    //id = json['id'];
    title = json['title'] ?? DateTime.now();

    content = json['content'] ?? DateTime.now();

    image = json['image'] ?? "";
    color = int.parse(json["color"]);
  }
}
