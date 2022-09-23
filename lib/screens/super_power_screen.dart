import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get_it/get_it.dart';
import 'package:team_alpha/model/top_tags.dart';
import 'package:team_alpha/screens/globals.dart';
import 'package:team_alpha/utils/common_widgets/sliding_option_selector.dart';

import '../utils/common_widgets/notification_toast.dart';
import '../utils/common_widgets/onloop_app_bar.dart';
import '../utils/misc/app_text_theme.dart';
import '../utils/misc/screen_size_helper.dart';
import '../utils/shared/profile_avatar.dart';
import '../utils/shared/shared_button.dart';
import 'globals.dart' as globals;

class SuperPowerScreen extends StatefulWidget {
  SuperPowerScreen({Key key, this.title, this.topTagList, this.isSuperPower})
      : super(key: key);
  final List<TopTag> topTagList;
  final String title;
  final bool isSuperPower;

  @override
  State<SuperPowerScreen> createState() => _SuperPowerScreenState();

  static PageRoute pageRoute(SuperPowerScreen page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}

class _SuperPowerScreenState extends State<SuperPowerScreen> {
  final ScreenSizeHelper _screenSizeHelper = GetIt.instance<ScreenSizeHelper>();
  CaptureTagSentiment _captureTagSentiment;
  List<Map<String, dynamic>> _nextActions = [];

  @override
  void initState() {
    // TODO: implement initState
    _captureTagSentiment = CaptureTagSentiment.weekly;
    if (userPersona.toLowerCase() == 'sairam') {
      _nextActions =
          widget.isSuperPower ? sairamSuperPowerList : sairamBlindSpotsList;
    } else {
      _nextActions =
          widget.isSuperPower ? vineetSuperPowerList : vineetBlindSpotsList;
    }
    super.initState();
  }

  bool visibilityState = true;
  buttonPrssed() {
    debugPrint("i was called");
    setState(() {
      visibilityState = false;
    });
    debugPrint(visibilityState.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: OnLoopAppBar(
        titleString: widget.title,
        leading: OnLoopAppBar.backButton(onPressed: () {
          Navigator.of(context).pop();
        }),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.isSuperPower
                            ? 'Top superpowers'
                            : 'Top blindspots',
                        style: AppTextTheme.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF5C798E),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SlidingOptionsSelector(
                    state: _captureTagSentiment,
                    options: CaptureTagSentimentUtil.names,
                    onValueChanged: (capturePageType) {
                      setState(() {
                        _captureTagSentiment = capturePageType;
                        // widget.onTabChanged?.call(_capturePageType);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _topTagsFutureBuilder(widget.topTagList),
                ],
              ),
            ),
            weeklyInsiteWidget(),
            nextActionsWidget()
          ],
        ),
      ),
    );
  }

  Widget weeklyInsiteWidget() {
    return Container(
      color: const Color(0xFFF6FAFD),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            children: [
              Text(
                'Weekly Insights',
                style: AppTextTheme.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF5C798E),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          widget.isSuperPower
              ? superPowerWeeklyInsights()
              : blindSpotsWeeklyInsights()
        ]),
      ),
    );
  }

  Widget nextActionsWidget() {
    return Container(
      color: const Color(0xFFF6FAFD),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            children: [
              Text(
                'Next actions',
                style: AppTextTheme.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF5C798E),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: _nextActions.length,
            itemBuilder: (BuildContext context, int index) {
              return nextActionsInsights(_nextActions[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 15);
            },
          )
        ]),
      ),
    );
  }

  Widget superPowerWeeklyInsights() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE9F3F8)),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 46,
                  height: 48,
                  child: Image.asset('assets/Trophy.png')),
              Text(
                'Your blindspot is now a superpower!',
                style: AppTextTheme.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF4F697C),
                ),
              ),
              Text(
                'Congratulations on turning your blindspot into a superpower. These tags will now be removed from your blindspots tag list.',
                style: AppTextTheme.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF7C9AB5),
                ),
                textAlign: TextAlign.center,
              ),
              _topTagsFutureBuilder(
                  [widget.topTagList.first, widget.topTagList.last]),
              _captureButton('Share with my manager'),
            ],
          ),
        ),
      ),
    );
  }

  Widget blindSpotsWeeklyInsights() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE9F3F8)),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 46,
                  height: 48,
                  child: Image.asset('assets/negative_feedback.png')),
              Text(
                'Great job identifying new blindspots',
                style: AppTextTheme.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF4F697C),
                ),
              ),
              Text(
                'Based on your recent Captures you’ve discovered new blindspots. Now turn them into your superpowers by Capturing Celebrates on the same tags.',
                style: AppTextTheme.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF7C9AB5),
                ),
                textAlign: TextAlign.center,
              ),
              _topTagsFutureBuilder(
                  [widget.topTagList.first, widget.topTagList.last]),
              _captureButton('Capture a Celebrate'),
            ],
          ),
        ),
      ),
    );
  }

  Widget nextActionsInsights(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE9F3F8)),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(
                  radius: 24,
                  enableEmoji: false,
                  showInitials: false,
                  name: 'Sairam',
                  image: NetworkImage(
                    item['profile_avator'],
                  ),
                  borderColor: const Color(0xFFF6FAFD),
                ),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: Text(
                    item['capture'],
                    style: AppTextTheme.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF4F697C),
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            _topTagsFutureBuilder([
              TopTag(
                  captureTag: CaptureTag(
                      id: '1',
                      name: 'Attention To Detail',
                      isCustom: false,
                      color: CaptureTagColor.purple,
                      tagDescription: 'Attention To Detail',
                      categoryDescription: 'd',
                      disciplineName: 'a',
                      type: '1'),
                  count: 1),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _captureButton(String text) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        Visibility(
            visible: visibilityState,
            child: visibilityState == true
                ? SharedButtons.actionFlatRectButton(
                    disablePadding: true,
                    title: text,
                    height: 36,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    buttonImgPath: 'assets/Plus.png',
                    buttonImgHeight: 10,

                    //change here
                    onPressed: () async {
                      buttonPrssed();
                      showToastWidget(
                        NotificationToast.toastWidget(
                          logoPath: 'assets/Trophy.png',
                          title: 'Your wins were shared with your manager',
                        ),
                        context: context,
                        animation: StyledToastAnimation.slideFromTop,
                        reverseAnimation: StyledToastAnimation.slideToTopFade,
                        position: const StyledToastPosition(
                            align: Alignment.topCenter),
                        startOffset: const Offset(0.0, -4.0),
                        reverseEndOffset: const Offset(0.0, -4.0),
                        animDuration: const Duration(milliseconds: 500),
                        duration: const Duration(seconds: 4),
                        curve: Curves.easeIn,
                        reverseCurve: Curves.easeOut,
                        isIgnoring: false,
                      );
                      // await Navigator.of(context, rootNavigator: true).push(
                      //   CapturePageWrapper.pageRoute(
                      //     CapturePageWrapper(selectedColleague: widget.colleague),
                      //   ),
                      // );
                      // Check for eligibility again.
                      setState(() {});
                    },
                  )
                : Container()),
        const SizedBox(height: 8.0),
      ],
    );
  }

  Widget _topTagsFutureBuilder(List<TopTag> topTags) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _colleagueTopTags(topTags),
    );
  }

  Widget _colleagueTopTags(List<TopTag> topTags) {
    List tagtoShow = [];
    if (globals.isImproves) {
      if (_captureTagSentiment == CaptureTagSentiment.weekly) {
        tagtoShow = [
          "Self Starter",
          "Dot Connector",
        ];
      } else if (_captureTagSentiment == CaptureTagSentiment.monthly) {
        tagtoShow = ["Dot Connector", "Ultra Learner"];
      } else if (_captureTagSentiment == CaptureTagSentiment.threeMonths) {
        tagtoShow = ["Dot Connector", "Self Assured"];
      } else if (_captureTagSentiment == CaptureTagSentiment.sixMonths) {
        tagtoShow = ["Self Assured"];
      } else {
        tagtoShow = ["Self Assured", "Fierce Optimisim"];
      }
    } else {
      if (_captureTagSentiment == CaptureTagSentiment.weekly) {
        tagtoShow = [
          'Self Starter',
          'Dot Connector',
          "Ultra Learner",
          "Self Assured"
        ];
      } else if (_captureTagSentiment == CaptureTagSentiment.monthly) {
        tagtoShow = ["Attention To Detail", "Thinking On The Fly"];
      } else if (_captureTagSentiment == CaptureTagSentiment.threeMonths) {
        tagtoShow = [
          "Attention To Detail",
          "Thinking On The Fly",
          "Fierce Optimism"
        ];
      } else if (_captureTagSentiment == CaptureTagSentiment.sixMonths) {
        tagtoShow = [
          "Attention To Detail",
          "Thinking On The Fly",
          "Fierce Optimism",
          "Resilience To Adversity"
        ];
      } else {
        tagtoShow = [
          "Attention To Detail",
          "Thinking On The Fly",
          "Resilience To Adversity"
        ];
      }
    }
    if (topTags.length == 1 || topTags.length == 2) {
      final topTagCells = topTags.map((topTag) {
        var captureTag = topTag.captureTag;

        return SharedButtons.captureTagButtonV4(
          tag: captureTag.name,
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
        final emptyCell =
            SharedButtons.emptyCaptureTagButton(height: 1, width: 1);
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
    } else {
      final topTagCells = tagtoShow.map((topTag) {
        return SharedButtons.captureTagButtonV4(
          tag: topTag,
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
        final emptyCell =
            SharedButtons.emptyCaptureTagButton(height: 1, width: 1);
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
  }
}
