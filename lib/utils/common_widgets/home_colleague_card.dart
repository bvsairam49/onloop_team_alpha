import 'package:flutter/material.dart';
import 'package:team_alpha/utils/shared/profile_avatar.dart';

import '../../model/top_tags.dart';
import '../shared/shared_button.dart';
import 'colleage_header.dart';

class HomeColleagueCard extends StatefulWidget {
  HomeColleagueCard({Key key}) : super(key: key);
  // final Colleague colleague;

  @override
  State<HomeColleagueCard> createState() => _HomeColleagueCardState();
}

class _HomeColleagueCardState extends State<HomeColleagueCard> {
  final List<TopTag> _topTags = [
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
        count: 1)
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () async {
          // White space in the colleague card.
          // KeyboardHiderHelper.hideKeyboard(context);
          // await _navigateToColleagueDetails(widget.colleague);
        },
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: const Color(0xFFE9F3F8), width: 1),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(119, 131, 145, 0.04),
                    blurRadius: 2.0,
                  ),
                  BoxShadow(
                      color: Color.fromRGBO(50, 50, 71, 0.04),
                      blurRadius: 8.0,
                      offset: Offset(0, 3))
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 14.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 9.0),
                          child: Row(
                            children: const [
                              Expanded(
                                child: ColleagueHeader(
                                  // colleague: colleague,
                                  colleagueName: 'Sairam',
                                  prismSummaryUnlocked: false,
                                  detailsTitle: 'hellp',
                                  detailsSubtitle: 'hello',
                                  highlightSubtitle: false,
                                  navigateToColleagueDetails: null,
                                  // navigateToColleagueDetails: ,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ColleagueHeaderCard(
                      //   prismSummaryUnlocked: _prismSummaryUnlocked,
                      //   detailsTitle: detailsTitle,
                      //   detailsSubtitle: detailsSubtitle,
                      //   highlightSubtitle: highlightSubtitle,
                      //   colleague: widget.colleague,
                      //   navigateToColleagueDetails: _navigateToColleagueDetails,
                      //   animation: _colleagueCardPrismAnimation,
                      // ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          // _prismCardContent(
                          //     _eligibleCaptureCount, widget.colleague)
                          _colleagueTopTags(
                              _topTags, 'assets/positive_feedback.png'),
                          const SizedBox(height: 10),
                          _colleagueTopTags(
                              _topTags, 'assets/negative_feedback.png')
                        ],
                      ))
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget _colleagueTopTags(List<TopTag> topTags, sentimentImage) {
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
        Image.asset(sentimentImage, fit: BoxFit.fitHeight, height: 25),
        const SizedBox(width: 12.0),
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
