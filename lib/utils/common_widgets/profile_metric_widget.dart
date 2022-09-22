import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../misc/app_text_theme.dart';
import '../misc/screen_size_helper.dart';

// Widget to display key metrics on the home screen.
// If the user is a thoughtful manager, the metrics displayed are:
//  1. total captures made by the user,
//  2. total users in their organization (as of 2.1.0), and
//  3. the user's people under development.
// If the user is an ambitious individual, the metrics displayed are:
//  1. total self captures,
//  2. total users in their organization (as of 2.1.0), and
//  3. the user's people under development.
class ProfileScreenMetrics extends StatefulWidget {
  final bool isCurrentUserIsManager;
  final int totalCaptures;
  final int captureMadeOnMySelf;
  final int colleaguesCaptures;
  final int colleaguesInOrg;
  final bool isLoading;

  const ProfileScreenMetrics(
      {Key key,
      this.isCurrentUserIsManager = false,
      this.totalCaptures = 0,
      this.captureMadeOnMySelf = 0,
      this.colleaguesCaptures = 0,
      this.colleaguesInOrg = 0,
      this.isLoading = false})
      : super(key: key);

  @override
  HomeScreenMetricsState createState() => HomeScreenMetricsState();
}

class HomeScreenMetricsState extends State<ProfileScreenMetrics>
    with SingleTickerProviderStateMixin {
  bool _isSmallWidth;
  AnimationController _animationController;
  Animation _slideOffset;
  Animation _metricsOpacity;

  @override
  void initState() {
    super.initState();
    // The animation controller for the slide and fade effects.
    _animationController =
        AnimationController(duration: Duration(milliseconds: 750), vsync: this);
    // The offset of the whitespace to slide in when the metrics are loaded.
    _slideOffset = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.5, curve: Curves.ease)));
    // The opacity for the HomeScreenMetrics widget to fade in.
    _metricsOpacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1, curve: Curves.ease)));
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _isSmallWidth ??= ScreenSizeHelper(context).isSmallWidth();

    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          if (widget.isLoading) {
            return Container();
          } else if (_animationController.value < 0.5) {
            if (_animationController.isAnimating == false) {
              _animationController.forward();
            }
            return SizedBox(
                height: (_isSmallWidth ? 58 : 70) * _slideOffset.value);
          } else {
            return Opacity(
                opacity: _metricsOpacity.value,
                child: _homeScreenMetricsCard());
          }
        });
  }

  // Widget for the main card that is displayed.
  Widget _homeScreenMetricsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: SizedBox(
        height: _isSmallWidth ? 58 : 70,
        child: Row(
          children: [
            widget.isCurrentUserIsManager
                ? _homeScreenMetricsColumn(
                    widget.totalCaptures, 'Total \nCelebrates')
                : _homeScreenMetricsColumn(
                    widget.captureMadeOnMySelf, 'Celebrates \nmade by myself'),
            _homeScreenMetricsColumn(
                widget.colleaguesCaptures, 'Celebrates \nmade by myself'),
            _homeScreenMetricsColumn(
                widget.colleaguesInOrg, 'Celebrates \nreceived')
          ],
        ),
      ),
    );
  }

  // Widget that displays formatted text and numbers for each metric.
  Widget _homeScreenMetricsColumn(int metric, String description) {
    final metricString = metric != null ? '$metric' : '0';
    final descriptionString = description ?? 'Unknown';
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(metricString,
                    style: AppTextTheme.poppins(
                        fontSize: _isSmallWidth ? 15.0 : 19.0,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF5C798E)),
                    textAlign: TextAlign.center),
                Text(descriptionString,
                    style: AppTextTheme.poppins(
                        fontSize: _isSmallWidth ? 9.0 : 11.0,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF5C798E),
                        height: 1.15),
                    textAlign: TextAlign.center),
              ],
            )));
  }
}
