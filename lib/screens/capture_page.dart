import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../model/app_state.dart';
import '../model/top_tags.dart';
import '../utils/shared/app_navigation_page.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../utils/shared/shared_button.dart';

Widget _topTagsFutureBuilder(List<TopTag> topTags) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: _colleagueTopTags(topTags),
  );
}

Widget _colleagueTopTags(List<TopTag> topTags) {
  final topTagCells = topTags.map((topTag) {
    final captureTag = topTag.captureTag;
    return SharedButtons.captureTagButtonV3(
      tag: captureTag,
      disableInkSplash: true,
      onPressed: () async {
        // Tags on colleague card.
        // KeyboardHiderHelper.hideKeyboard(context);
        // await _navigateToColleagueDetails(colleague);
      },
    );
  }).toList();

  int noOfEmptyCellsRequired = 3 - topTagCells.length;

  for (int counter = 0; counter < noOfEmptyCellsRequired; counter++) {
    final emptyCell = SharedButtons.emptyCaptureTagButton();
    topTagCells.add(emptyCell);
  }

  return Row(
    children: [
      Expanded(
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: topTagCells,
        ),
      )
    ],
  );
}

class CapturePage extends StatefulWidget {
  CapturePage({Key key, this.topTags}) : super(key: key);
  final List<TopTag> topTags;
  @override
  State<CapturePage> createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> {
  // final idController = TextEditingController();
  // final passwordController = TextEditingController();

  // void _printLatestValue() {
  //   print('Second text field: ${idController.text}');
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   // Start listening to changes.
  //   idController.addListener(_printLatestValue);
  // }

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is removed from the
  //   // widget tree.
  //   idController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  final List<TopTag> topTags = [
    TopTag(
        captureTag: CaptureTag(
            id: '1',
            name: 'improve',
            isCustom: false,
            color: CaptureTagColor.blue,
            tagDescription: 'hello',
            categoryDescription: 'd',
            disciplineName: 'a',
            type: '1'),
        count: 1),
    TopTag(
        captureTag: CaptureTag(
            id: '2',
            name: 'hellp',
            isCustom: false,
            color: CaptureTagColor.orange,
            tagDescription: 'hello',
            categoryDescription: 'd',
            disciplineName: 'a',
            type: '1'),
        count: 1),
    TopTag(
        captureTag: CaptureTag(
            id: '3',
            name: 'mizan',
            isCustom: false,
            color: CaptureTagColor.green,
            tagDescription: 'delight',
            categoryDescription: 'd',
            disciplineName: 'a',
            type: '1'),
        count: 1),
    TopTag(
        captureTag: CaptureTag(
            id: '4',
            name: 'mizan',
            isCustom: false,
            color: CaptureTagColor.green,
            tagDescription: 'delight',
            categoryDescription: 'd',
            disciplineName: 'a',
            type: '1'),
        count: 1),
    TopTag(
        captureTag: CaptureTag(
            id: '5',
            name: 'Vineet',
            isCustom: false,
            color: CaptureTagColor.yellow,
            tagDescription: 'delight',
            categoryDescription: 'd',
            disciplineName: 'a',
            type: '1'),
        count: 1),
    TopTag(
        captureTag: CaptureTag(
            id: '6',
            name: 'Hilda',
            isCustom: false,
            color: CaptureTagColor.blue,
            tagDescription: 'delight',
            categoryDescription: 'd',
            disciplineName: 'a',
            type: '1'),
        count: 1),
    TopTag(
        captureTag: CaptureTag(
            id: '7',
            name: 'Hilda',
            isCustom: false,
            color: CaptureTagColor.blue,
            tagDescription: 'delight',
            categoryDescription: 'd',
            disciplineName: 'a',
            type: '1'),
        count: 1),
    TopTag(
        captureTag: CaptureTag(
            id: '8',
            name: 'Hilda',
            isCustom: false,
            color: CaptureTagColor.blue,
            tagDescription: 'delight',
            categoryDescription: 'd',
            disciplineName: 'a',
            type: '1'),
        count: 1)
  ];
//---------------------Emotion button---------------//

  int _selectedEmotion = 0; //0 if none selected, 1 if celebrate, 2 if improve

  var imageOneUrlSetZero = 'assets/profile/celebratechoice.png';
  var imageTwoUrlSetZero = 'assets/profile/improvechoice.png';

  var imageOneUrlSetOne = 'assets/profile/celebratechosen.png';
  var imageTwoUrlSetOne = 'assets/profile/improvechoice.png';

  var imageOneUrlSetTwo = 'assets/profile/celebratechoice.png';
  var imageTwoUrlSetTwo = 'assets/profile/improvechosen.png';
//---------------------Share button---------------//
  int _selectedShare = 0;

  var shareButtonOneSetZero = 'assets/profile/saveprivately.png';
  var shareButtonTwoSetZero = 'assets/profile/sharepublicly.png';

  var shareButtonOneSetOne = 'assets/profile/saveprivatelyselected.png';
  var shareButtonTwoSetOne = 'assets/profile/sharepublicly.png';

  var shareButtonOneSetTwo = 'assets/profile/saveprivately.png';
  var shareButtonTwoSetTwo = 'assets/profile/sharepubliclyselected.png';

  //---------------------Submit button---------------//
  int _submitEnabled = 0;

  var submitEnabled = 'assets/profile/CTAenabled.png';
  var submitDisabled = 'assets/profile/CTAdisabled.png';

  //---------------------State functions to manage button---------------//

  void submitButtonState() {
    if (_selectedShare == 0) {
      setState(() {
        _submitEnabled = 0;
      });
    } else if (_selectedShare != 0) {
      setState(() {
        _submitEnabled = 1;
      });
    }
  }

  void selectionChanger(int buttonPressed) {
    if (buttonPressed == 1) {
      setState(() {
        _selectedShare = 1;
        submitButtonState();
      });
    } else if (buttonPressed == 2) {
      setState(() {
        _selectedShare = 2;
        submitButtonState();
      });
    }
  }

  void emotionChanger(int buttonPressed) {
    if (buttonPressed == 1) {
      setState(() {
        _selectedEmotion = 1;
      });
    } else if (buttonPressed == 2) {
      setState(() {
        _selectedEmotion = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: ClipRRect(
              child: Image.asset(
                'assets/profile/captureflowheader.png',
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                emotionChanger(1);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      50.0, 5.0, 0, 10),
                                  child: Image.asset(
                                      _selectedEmotion == 2
                                          ? imageOneUrlSetTwo
                                          : _selectedEmotion == 1
                                              ? imageOneUrlSetOne
                                              : imageOneUrlSetZero,
                                      width: 90.0,
                                      height: 90.0),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                emotionChanger(2);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      30.0, 5.0, 0, 10),
                                  child: Image.asset(
                                    _selectedEmotion == 2
                                        ? imageTwoUrlSetTwo
                                        : _selectedEmotion == 1
                                            ? imageTwoUrlSetOne
                                            : imageTwoUrlSetZero,
                                    width: 90.0,
                                    height: 90.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 00.0, 5),
                      child: Image.asset(
                        'assets/profile/questionone.png',
                        width: 300.0,
                        height: 20.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DropdownSearch<String>(
                        items: [
                          "Brazil",
                          "Italia (Disabled)",
                          "Tunisia",
                          'Canada'
                        ],
                        dropdownSearchDecoration: const InputDecoration(
                          hintText: "Search or Select a colleague",
                        ),
                        onChanged: print,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 5.0, 00.0, 5),
                      child: Image.asset(
                        'assets/profile/questiontwo.png',
                        width: 300.0,
                        height: 20.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: ("What was the situation?" +
                              "\n" +
                              '------------------------' +
                              "\n" +
                              "What behavior did you notice?" +
                              "\n"
                                  "------------------------" +
                              "\n"
                                  "How did it impact you? "),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(120.0, 5.0, 00.0, 5),
                      child: Image.asset(
                        'assets/profile/questionthree.png',
                        width: 300.0,
                        height: 20.0,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(12, 5.0, 00.0, 12),
                        child: _topTagsFutureBuilder(topTags)),
                  ]), //implement tags here
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40.0, 5.0, 00.0, 5),
                    child: Image.asset(
                      'assets/profile/questionfour.png',
                      width: 300.0,
                      height: 16.0,
                    ),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          selectionChanger(1);
                        },
                        child: ClipRRect(
                          //borderRadius: BorderRadius.circular(20.0),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5),
                            child: Image.asset(
                                _selectedShare == 2
                                    ? shareButtonOneSetTwo
                                    : _selectedShare == 1
                                        ? shareButtonOneSetOne
                                        : shareButtonOneSetZero,
                                width: 375.0,
                                height: 56.0),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          selectionChanger(2);
                        },
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(20.0),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5),
                            child: Image.asset(
                                _selectedShare == 2
                                    ? shareButtonTwoSetTwo
                                    : _selectedShare == 1
                                        ? shareButtonTwoSetOne
                                        : shareButtonTwoSetZero,
                                width: 375.0,
                                height: 56.0),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ClipRRect(
              //borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0.0, 0, 0),
                child: Image.asset(
                    _submitEnabled == 0 ? submitDisabled : submitEnabled,
                    height: 120.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
