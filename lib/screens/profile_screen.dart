import 'dart:core';

import 'package:flutter/material.dart';
import 'package:team_alpha/model/top_tags.dart';
import 'package:team_alpha/screens/globals.dart';
import 'package:team_alpha/screens/super_power_screen.dart';
import '../utils/common_widgets/capture_detail_card.dart';
import '../utils/common_widgets/capture_metrics_widget.dart';
import '../utils/common_widgets/onloop_app_bar.dart';
import '../utils/common_widgets/profile_metric_widget.dart';
import '../utils/misc/app_text_theme.dart';
import '../utils/shared/profile_avatar.dart';
import '../utils/shared/shared_button.dart';
import 'globals.dart' as globals;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key, this.isSelfUser = true}) : super(key: key);
  final bool isSelfUser;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;
  double height = 200;
  final Duration _captureTypeSelectionAnimationDuration =
      const Duration(milliseconds: 500);

  final List<TopTag> _topTags = globals.topTags[globals.currentUserid];

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
      animationDuration: const Duration(milliseconds: 1000),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: (widget.isSelfUser)
          ? Container(
              height: 12,
              color: const Color(0xFFFFFFFF),
            )
          : const SizedBox.shrink(),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: Container(),
        preferredSize: const Size.fromHeight(10),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _profilePictureView(),
            SizedBox(height: 48, child: _selectFeedbackAppBar()),
            Expanded(child: _pageBuilder()),
          ],
        ),

        // NestedScrollView(
        //     controller: _scrollController,
        //     headerSliverBuilder: (context, innerBoxIsScrolled) {
        //       return [

        //         // SliverAppBar(
        //         //     elevation: 0,
        //         //     backgroundColor: Colors.white,
        //         //     pinned: true,
        //         //     expandedHeight: height - 35,
        //         //     flexibleSpace: Stack(
        //         //       children: [
        //         //         //_minimizedProfileHeader(ref),
        //         //         SingleChildScrollView(
        //         //           child: _profilePictureView(),
        //         //         )
        //         //       ],
        //         //     ))

        //         // SliverPersistentHeader(
        //         //   delegate: _SliverAppBarDelegate(
        //         //     _selectFeedbackAppBar(),
        //         //   ),
        //         //   pinned: true,
        //         // )
        //       ];
        //     },
        //     body: Container(
        //         color: const Color(0xffF6FAFD),
        //         child: Column(
        //           children: const [
        //             SizedBox()
        //             // if (!_isSelf &&
        //             //     _captureTagFilter.sentiment !=
        //             //         CaptureTagSentiment.neutral &&
        //             //     widget.colleague?.userRef != null &&
        //             //     widget.colleague?.connectedStatus ==
        //             //         ConnectedStatus.connected)
        //             //   _captureRequestButton(),
        //             // Expanded(child: _pageBuilder(_captureTagFilter)),
        //             // if (!_isSelf) _addFeedbackButton(),
        //           ],
        //         ))),
      ),
    );
  }

  void _updateState(int index) {
    setState(() {
      switch (index) {
        case 1:
          break;

        default:
          break;
      }
    });
  }

  TabBar _selectFeedbackAppBar() {
    return TabBar(
      padding: EdgeInsets.zero,
      indicatorColor: const Color(0xFF4F697C),
      controller: _tabController,
      onTap: _updateState,
      tabs: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 5.0,
          ),
          child: AnimatedCrossFade(
            firstChild: Image.asset(
              'assets/profile/celebrate_active.png',
            ),
            secondChild: Image.asset(
              'assets/profile/celebrate_disabled.png',
            ),
            duration: _captureTypeSelectionAnimationDuration,
            crossFadeState: CrossFadeState.showFirst,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 5.0,
          ),
          child: AnimatedCrossFade(
            firstChild: Image.asset(
              'assets/profile/improve_active.png',
            ),
            secondChild: Image.asset(
              'assets/profile/improve_disabled.png',
            ),
            duration: _captureTypeSelectionAnimationDuration,
            crossFadeState: CrossFadeState.showSecond,
          ),
        ),
      ],
    );
  }

  Widget _profilePictureView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (!widget.isSelfUser)
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 1, 0),
                child: OnLoopAppBar.backButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            : const SizedBox(width: 70),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileAvatar(
              radius: 24,
              enableEmoji: false,
              showInitials: false,
              name: userPersona,
              image: NetworkImage(
                profileAvator,
              ),
              borderColor: const Color(0xFFF6FAFD),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(userPersona, //_colleague?.name,
                  style: AppTextTheme.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4F697C),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Text(
                  'Myself',
                  style: AppTextTheme.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF5C798E),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ], //ninisd
        ),
        const SizedBox(
          width: 60,
        )
      ],
    );
  }

  // Builds the content of the page after recieving a snapshot of the colleague.
  Widget _pageBuilder() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        CelebrateTabView(title: 'Captures', topTags: _topTags),
        CelebrateTabView(
          title: 'Improves',
          topTags: _topTags,
        )
        // CelebrateTabView(
        //   captureType: CaptureTagSentiment.positive,
        //   colleague: _colleague,
        //   capturetagfilter: _captureTagFilter,
        // ),
        // CelebrateTabView(
        //   captureType: CaptureTagSentiment.negative,
        //   colleague: _colleague,
        //   capturetagfilter: _captureTagFilter,
        // ),
        // CelebrateTabView(
        //   captureType: CaptureTagSentiment.neutral,
        //   colleague: _colleague,
        //   capturetagfilter: _captureTagFilter,
        // ),
      ],
    );
  }
}

class CelebrateTabView extends StatelessWidget {
  const CelebrateTabView({Key key, this.title, this.topTags}) : super(key: key);

  final String title;
  final List<TopTag> topTags;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6FAFD),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextTheme.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF4F697C),
            ),
          ),
          const SizedBox(height: 10.0),
          const ProfileScreenMetrics(
            isCurrentUserIsManager: true,
            totalCaptures: 3,
            captureMadeOnMySelf: 9,
            colleaguesInOrg: 100,
          ),
          const SizedBox(height: 10.0),
          _getSuperPowersTagsView(
              context, 'Superpowers', const Color(0xFF4F697C)),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(119, 131, 145, 0.04),
                    blurRadius: 2.0,
                    offset: Offset(0, 0)),
                BoxShadow(
                    color: Color.fromRGBO(50, 50, 71, 0.044),
                    blurRadius: 8.0,
                    offset: Offset(0, 3))
              ],
            ),
            child: _topTagsFutureBuilder(topTags),
          ),
          const SizedBox(height: 15.0),
          Text(
            'Capture history',
            style: AppTextTheme.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF4F697C),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CaptureDetailCard(
            showShareButton: false,
            topTag: topTags,
          )
        ],
      ),
    );
  }

  Widget _getSuperPowersTagsView(
      BuildContext context, String title, Color titleTextColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,
              style: AppTextTheme.poppins(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w600,
                  color: titleTextColor)),
        ),
        GestureDetector(
          onTap: () async {
            Navigator.of(context, rootNavigator: true)
                .push(SuperPowerScreen.pageRoute(SuperPowerScreen(
              title: 'Superpowers',
              topTagList: topTags,
            )));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('View All',
                  style: AppTextTheme.poppins(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1B95DA))),
            ],
          ),
        ),
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
}
