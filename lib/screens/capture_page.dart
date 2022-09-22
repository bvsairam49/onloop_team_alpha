import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../model/app_state.dart';
import '../utils/shared/app_navigation_page.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CapturePage extends StatefulWidget {
  CapturePage({Key key}) : super(key: key);

  @override
  State<CapturePage> createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> {
  int _selectedEmotion = 0; //0 if none selected, 1 if celebrate, 2 if improve

  var imageOneUrlSetZero = 'assets/profile/celebratechoice.png';
  var imageTwoUrlSetZero = 'assets/profile/improvechoice.png';

  var imageOneUrlSetOne = 'assets/profile/celebratechosen.png';
  var imageTwoUrlSetOne = 'assets/profile/improvechoice.png';

  var imageOneUrlSetTwo = 'assets/profile/celebratechoice.png';
  var imageTwoUrlSetTwo = 'assets/profile/improvechosen.png';

  int _selectedShare = 0;

  var shareButtonOneSetZero = 'assets/profile/saveprivately.png';
  var shareButtonTwoSetZero = 'assets/profile/sharepublicly.png';

  var shareButtonOneSetOne = 'assets/profile/saveprivatelyselected.png';
  var shareButtonTwoSetOne = 'assets/profile/sharepublicly.png';

  var shareButtonOneSetTwo = 'assets/profile/saveprivately.png';
  var shareButtonTwoSetTwo = 'assets/profile/sharepubliclyselected.png';

  void selectionChanger(int buttonPressed) {
    if (buttonPressed == 1) {
      setState(() {
        _selectedShare = 1;
      });
    } else if (buttonPressed == 2) {
      setState(() {
        _selectedShare = 2;
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/profile/captureflowheader.png',
            ),
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
                          debugPrint("button 1");
                          emotionChanger(1);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(50.0, 5.0, 0, 10),
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
                          debugPrint("button 2");
                          emotionChanger(2);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(30.0, 5.0, 0, 10),
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
                  items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
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
              const Padding(
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
                  padding: const EdgeInsets.fromLTRB(40.0, 5.0, 00.0, 5),
                  child: Container()),
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
                    borderRadius: BorderRadius.circular(20.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0, 5),
                      child: Image.asset(
                          _selectedShare == 2
                              ? shareButtonOneSetTwo
                              : _selectedShare == 1
                                  ? shareButtonOneSetOne
                                  : shareButtonOneSetZero,
                          width: 400.0,
                          height: 50.0),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    selectionChanger(2);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0, 5),
                      child: Image.asset(
                          _selectedShare == 2
                              ? shareButtonTwoSetTwo
                              : _selectedShare == 1
                                  ? shareButtonTwoSetOne
                                  : shareButtonTwoSetZero,
                          width: 400.0,
                          height: 50.0),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
