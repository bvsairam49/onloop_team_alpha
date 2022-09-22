import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:team_alpha/model/top_tags.dart';
// import 'package:quiver/strings.dart';
// import 'package:timeago/timeago.dart' as timeago;

import '../misc/app_text_theme.dart';
import '../misc/screen_size_helper.dart';
import '../shared/shared_button.dart';

class CaptureDetailCard extends StatefulWidget {
  // final FeedbackItem feedbackItem;
  final bool showShareButton;
  // final Colleague colleagueData;
  final List<TopTag> topTag;

  CaptureDetailCard({
    // @required this.feedbackItem,
    @required this.showShareButton,
    @required this.topTag,
    // this.colleagueData
  });

  @override
  CaptureDetailCardState createState() => CaptureDetailCardState();
}

class CaptureDetailCardState extends State<CaptureDetailCard> {
  final ScreenSizeHelper _screenSizeHelper = GetIt.instance<ScreenSizeHelper>();
  @override
  Widget build(BuildContext context) {
    String imageAssetName = 'assets/positive_feedback.png';
    String feedbackTypeName = 'Unknown';
    String feedbackSharerName = 'Unknown';
    // if (widget.feedbackItem.sharedBy != null) {
    //   feedbackSharerName = widget.feedbackItem.sharerName();
    // }

    // if (widget.feedbackItem.sentiment != null) {
    //   imageAssetName = widget.feedbackItem.sentiment.imagePath;
    //   feedbackTypeName = widget.feedbackItem.sentiment.name;
    // }
    final DateFormat formatter = DateFormat('MMM dd, yyyy');
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 8.0)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Column(children: [
            // img + description row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // img column
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 56,
                      width: 56,
                      child: Image(
                        image: AssetImage(imageAssetName),
                      ),
                    ),
                  ],
                ),
                // description column
                SizedBox(width: 8.0),
                SizedBox(
                  width: _screenSizeHelper.displayWidth(context) - (155.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Column(
                      children: [
                        // improve + share row

                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'widget.feedbackItem.feedbackText',
                                  style: AppTextTheme.openSans(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF506070)),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // timestamp and tags row
            Row(children: [
              SizedBox(
                width: _screenSizeHelper.displayWidth(context) - (60.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    _colleagueTopTags(widget.topTag),
                    const SizedBox(height: 5.0),
                    Row(
                      children: [
                        Text(
                          'Captured by ' + feedbackSharerName,
                          style: AppTextTheme.openSans(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF778391)),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                  ],
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Shared on ' + formatter.format(DateTime.now()),
                  style: AppTextTheme.openSans(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF778391)),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ]),
        ]),
      ),
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
        // SizedBox(),
        SizedBox(
          width: _screenSizeHelper.displayWidth(context) - (60.0),
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
