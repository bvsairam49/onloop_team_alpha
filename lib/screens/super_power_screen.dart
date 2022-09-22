import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:team_alpha/model/top_tags.dart';
import 'package:team_alpha/utils/common_widgets/sliding_option_selector.dart';

import '../utils/common_widgets/onloop_app_bar.dart';
import '../utils/misc/app_text_theme.dart';
import '../utils/misc/screen_size_helper.dart';

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
      backgroundColor: const Color(0xFFF6FAFD),
      body: Padding(
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
          ],
        ),
      ),
    );
  }
}
