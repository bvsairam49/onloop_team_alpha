import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../model/top_tags.dart';

bool isLoggedIn = false;
String userEmail;
List<dynamic> userObject;
List<dynamic> colleagueList;
int totalColleagueSize;

Map<int, dynamic> allCaptures;
Map<int, dynamic> allTags;

List<TopTag> allAvailableTags = [];

List<dynamic> userPositiveTags;
List<dynamic> userImproveTags;

List<String> getAllColleagues() {
  List<String> response = [];
  colleagueList.forEach((element) {
    response.add(element['name'].toString());
  });
  debugPrint(response.toString());
  return response;
}

List<String> getAllTags() {
  List<String> response = [];
  allTags.forEach((key, value) {
    response.add(value);
  });
  return response;
}

void setAllAvailableTags(String input) {
  List data = jsonDecode(input);
  data.forEach((element) {
    TopTag t = TopTag(
        captureTag: CaptureTag(
            id: '1',
            name: element,
            isCustom: false,
            color: CaptureTagColor.blue,
            tagDescription: element,
            categoryDescription: 'd',
            disciplineName: 'a',
            type: '1'),
        count: 1);
    allAvailableTags.add(t);
  });
}
