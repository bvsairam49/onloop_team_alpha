import 'dart:collection';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';

import '../model/top_tags.dart';

bool isLoggedIn = false;
bool isNewCapture = false;
String userEmail;
String userPersona;
String profileAvator;
List<dynamic> userObject;
List<dynamic> colleagueList;
int totalColleagueSize;
int currentUserid;

Map<int, dynamic> allCaptures;
Map<int, dynamic> allTags;
Map<int, List<TopTag>> topTags = {};

List<TopTag> allAvailableTags = [];
List<TopTag> topTagsNow = [];

List<dynamic> userPositiveTags;
List<dynamic> userImproveTags;

List<String> getAllColleagues() {
  List<String> response = [];
  colleagueList.forEach((element) {
    response.add(element['name'].toString());
  });
  return response;
}

void setTopTags(int id, String captures) {
  List data = jsonDecode(captures);
  data.forEach((element) {
    TopTag t = TopTag(
        captureTag: CaptureTag(
            id: '1',
            name: element['text'],
            isCustom: false,
            color: CaptureTagColor.blue,
            tagDescription: element['text'],
            categoryDescription: 'd',
            disciplineName: 'a',
            type: '1'),
        count: 1);

    topTagsNow.add(t);
  });
  topTags[id] = topTagsNow;
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

List<dynamic> sairamColleagueCaptureList = [
  {
    'capture': 'He is doing pretty good job',
    'last_capture': 'Today',
    'tags_list': ['Ultra learner', 'Self assured'],
    'name': 'Hilda',
    'profile_avator': 'https://i.ibb.co/LPThqbM/hilda.png'
  },
  {
    'capture': 'He is doing pretty good job',
    'last_capture': 'Yesterday',
    'tags_list': ['Ultra learner', 'Self assured'],
    'name': 'Jin',
    'profile_avator': 'https://i.ibb.co/RTkVRsX/jin.png'
  },
  {
    'capture': 'He is doing pretty good job',
    'last_capture': '2 days',
    'tags_list': ['Ultra learner', 'Self assured'],
    'name': 'Sairam',
    'profile_avator': 'https://i.ibb.co/wrSQJYp/sairam.jpg'
  }
];

List<dynamic> vineetColleagueCaptureList = [
  {
    'capture': 'He is doing pretty good job',
    'last_capture': 'Yesterday',
    'tags_list': ['Ultra learner', 'Self assured'],
    'name': 'Sairam',
    'profile_avator': 'https://i.ibb.co/wrSQJYp/sairam.jpg'
  },
  {
    'capture': 'He is doing pretty good job',
    'last_capture': '2 days',
    'tags_list': ['Ultra learner', 'Self assured'],
    'name': 'Vineet',
    'profile_avator': 'https://i.ibb.co/6Y936fD/vineet.png'
  },
  {
    'capture': 'He is doing pretty good job',
    'last_capture': 'Today',
    'tags_list': ['Ultra learner', 'Self assured'],
    'name': 'Mizan',
    'profile_avator': 'https://i.ibb.co/fdxSZb9/mizan.png'
  },
];

Map<String, int> sairamMetrics = {
  'total_capture': 10,
  'colleague_captured_on': 9,
  'colleagues_in_org': 18,
};
Map<String, int> vineetMetrics = {
  'total_capture': 100,
  'colleague_captured_on': 19,
  'colleagues_in_org': 10,
};

List<dynamic> vineetCaptureHistoryList = [
  {
    'capture': 'He is doing pretty good job',
    'last_capture': 'Yesterday',
    'capture_by': 'Jin',
    'shared_on': 'Sep 22, 2022',
    'tags_list': ['Ultra learner', 'Self assured'],
    'name': 'Sairam',
    'profile_avator': 'https://i.ibb.co/wrSQJYp/sairam.jpg'
  },
  {
    'capture': 'He is doing pretty good job',
    'last_capture': '2 days',
    'capture_by': 'Hilda',
    'shared_on': 'Sep 20, 2022',
    'tags_list': ['Ultra learner', 'Self assured'],
    'name': 'Vineet',
    'profile_avator': 'https://i.ibb.co/6Y936fD/vineet.png'
  },
  {
    'capture': 'He is doing pretty good job',
    'last_capture': 'Today',
    'capture_by': 'Mizan',
    'shared_on': 'Sep 23, 2022',
    'tags_list': ['Ultra learner', 'Self assured'],
    'name': 'Mizan',
    'profile_avator': 'https://i.ibb.co/fdxSZb9/mizan.png'
  },
];
List<dynamic> sairamCaptureHistoryList = [
  {
    'capture': 'He is doing pretty good job',
    'last_capture': 'Yesterday',
    'capture_by': 'Mizan',
    'shared_on': 'Sep 22, 2022',
    'tags_list': ['Ultra learner', 'Self assured'],
    'name': 'Sairam',
    'profile_avator': 'https://i.ibb.co/wrSQJYp/sairam.jpg'
  },
  {
    'capture': 'He is doing pretty good job',
    'last_capture': '2 days',
    'capture_by': 'Vineet',
    'shared_on': 'Sep 20, 2022',
    'tags_list': ['Ultra learner', 'Self assured'],
    'name': 'Vineet',
    'profile_avator': 'https://i.ibb.co/6Y936fD/vineet.png'
  },
  {
    'capture': 'He is doing pretty good job',
    'last_capture': 'Today',
    'capture_by': 'Hilda',
    'shared_on': 'Sep 23, 2022',
    'tags_list': ['Ultra learner', 'Self assured'],
    'name': 'Mizan',
    'profile_avator': 'https://i.ibb.co/fdxSZb9/mizan.png'
  },
];
