import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get_it/get_it.dart';
import 'package:team_alpha/model/top_tags.dart';
import 'package:team_alpha/utils/common_widgets/sliding_option_selector.dart';

import '../utils/common_widgets/notification_toast.dart';
import '../utils/common_widgets/onloop_app_bar.dart';
import '../utils/misc/app_text_theme.dart';
import '../utils/misc/screen_size_helper.dart';
import '../utils/shared/profile_avatar.dart';
import '../utils/shared/shared_button.dart';
import 'globals.dart' as globals;

class SuperPowerScreen extends StatefulWidget {
  SuperPowerScreen({Key key, this.title, this.topTagList}) : super(key: key);
  final List<TopTag> topTagList;
  final String title;

  @override
  State<SuperPowerScreen> createState() => _SuperPowerScreenState();

  static PageRoute pageRoute(SuperPowerScreen page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}

class _SuperPowerScreenState extends State<SuperPowerScreen> {
  final ScreenSizeHelper _screenSizeHelper = GetIt.instance<ScreenSizeHelper>();
  CaptureTagSentiment _captureTagSentiment;
  @override
  void initState() {
    // TODO: implement initState
    _captureTagSentiment = CaptureTagSentiment.weekly;
    super.initState();
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
                        'Top superpowers at present',
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
          superPowerWeeklyInsights()
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
          nextActionsInsights()
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
                'New superpower unlocked!',
                style: AppTextTheme.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF4F697C),
                ),
              ),
              Text(
                'Your Captures added new tags. Keep Capturing to discover more superpowers.',
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

  Widget nextActionsInsights() {
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
                const ProfileAvatar(
                  radius: 24,
                  enableEmoji: false,
                  showInitials: false,
                  name: 'Sairam',
                  image: NetworkImage(
                    'https://i.picsum.photos/id/923/200/200.jpg?hmac=3VHvOqFmO1AmGdpW-XcIVVb5CSOm5AwgyYRt9jYWAvo',
                  ),
                  borderColor: Color(0xFFF6FAFD),
                ),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: Text(
                    'Michael Calcada’s top blindspot is your top superpower. Help them get better at',
                    style: AppTextTheme.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF4F697C),
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            _topTagsFutureBuilder(
                [widget.topTagList.first, widget.topTagList.last]),
          ],
        ),
      ),
    );
  }

  Widget _captureButton(String text) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        SharedButtons.actionFlatRectButton(
          disablePadding: true,
          title: text,
          height: 36,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          buttonImgPath: 'assets/goals/goals_overview_send_icon.png',
          buttonImgHeight: 10,
          onPressed: () async {
            showToastWidget(
              NotificationToast.toastWidget(
                logoPath: 'assets/Trophy.png',
                title: 'Your wins were shared with your manager',
              ),
              context: context,
              animation: StyledToastAnimation.slideFromTop,
              reverseAnimation: StyledToastAnimation.slideToTopFade,
              position: const StyledToastPosition(align: Alignment.topCenter),
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
        ),
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
        tagtoShow = ["self starter", "dot connector"];
      } else if (_captureTagSentiment == CaptureTagSentiment.monthly) {
        tagtoShow = ["dot connector", "ultra learner"];
      } else if (_captureTagSentiment == CaptureTagSentiment.threeMonths) {
        tagtoShow = ["dot connector", "self assured"];
      } else if (_captureTagSentiment == CaptureTagSentiment.sixMonths) {
        tagtoShow = ["self assured"];
      } else {
        tagtoShow = ["self assured", "fierce optimisim"];
      }
    } else {
      if (_captureTagSentiment == CaptureTagSentiment.weekly) {
        tagtoShow = ["dot connector", "fierce optimisim"];
      } else if (_captureTagSentiment == CaptureTagSentiment.monthly) {
        tagtoShow = ["dot connector"];
      } else if (_captureTagSentiment == CaptureTagSentiment.threeMonths) {
        tagtoShow = ["dot connector", "ultra learner"];
      } else if (_captureTagSentiment == CaptureTagSentiment.sixMonths) {
        tagtoShow = ["dot connector", "ultra learner"];
      } else {
        tagtoShow = ["dot connector", "self assured"];
      }
    }
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
