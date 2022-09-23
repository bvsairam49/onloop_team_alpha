import 'dart:collection';

bool isLoggedIn = false;
bool isNewCapture = false;
String userEmail;
String userPersona;
String profileAvator;
List<dynamic> userObject;
List<dynamic> colleagueList;
int totalColleagueSize;

Map<int, dynamic> allCaptures;
Map<int, dynamic> allTags;

List<dynamic> userPositiveTags;
List<dynamic> userImproveTags;

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
