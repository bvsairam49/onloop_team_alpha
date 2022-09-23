import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:team_alpha/Screens/profile_screen.dart';
import 'package:team_alpha/screens/globals.dart';

import '../model/app_state.dart';
import '../utils/common_widgets/app_navigation_bar.dart';
import '../utils/common_widgets/capture_metrics_widget.dart';
import '../utils/common_widgets/home_colleague_list_view.dart';
import '../utils/misc/app_text_theme.dart';
import '../utils/misc/screen_size_helper.dart';
import '../utils/shared/animated_badge_stack.dart';
import '../utils/shared/app_navigation_page.dart';
import '../utils/shared/home_app_bar.dart';
import 'package:get_it/get_it.dart';
import 'globals.dart' as globals;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PersistentTabController _persistentTabController;
  AppNavigationBar appNavigationBar;
  bool _showLearnBadge;
  ScreenSizeHelper _screenSizeHelper;
  double _appBarHeight;
  String userName;
  Map<String, int> _userMetrics;
  @override
  void initState() {
    _persistentTabController = PersistentTabController(initialIndex: 0);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await appNavigationPageStateKey.currentState.navigateToTab(0);
    });
    if (userPersona.toLowerCase() == 'sairam') {
      _userMetrics = sairamMetrics;
    } else {
      _userMetrics = vineetMetrics;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _appBarHeight = MediaQuery.of(context).padding.top + kToolbarHeight;
    final getIt = GetIt.instance;
    final screenSizeHelper = ScreenSizeHelper(context);
    if (!getIt.isRegistered<ScreenSizeHelper>()) {
      GetIt.instance.registerSingleton<ScreenSizeHelper>(screenSizeHelper);
    }
    _screenSizeHelper = GetIt.instance<ScreenSizeHelper>();
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFD),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: HomeAppBar(
        titleWidget: Image.asset('assets/app_bar/onloop_logo.png', height: 28),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3292D7),
              Color(0xFF0CA9CC),
              Color(0xFF0CB3B8),
            ],
            // Gradient starts at (left edge, 66% height of viewport), ends at top right of viewport.
            begin: Alignment(-1.0, -0.33),
            end: Alignment.topRight,
          ),
        ),
        width: _screenSizeHelper.displayWidth(context),
        child: Padding(
          padding: EdgeInsets.only(top: _appBarHeight),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    _homePageContent(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// cards.
  Widget _homePageContent() {
    return Column(
      children: <Widget>[
        _privateByDefaultBanner(),
        const SizedBox(height: 10.0),
        _greetingBanner(),
        const SizedBox(height: 10.0),
        HomeScreenMetrics(
          isCurrentUserIsManager: true,
          totalCaptures: _userMetrics['total_capture'],
          captureMadeOnMySelf: _userMetrics['total_capture'],
          colleaguesCaptures: _userMetrics['colleague_captured_on'],
          colleaguesInOrg: _userMetrics['colleagues_in_org'],
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.only(left: 16.0, top: 15.0, right: 16.0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0)),
              color: Color(0xFFF6FAFD)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HomeColleaguesListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _privateByDefaultBanner() {
    return Container(
        padding: const EdgeInsets.all(8.0),
        color: const Color.fromRGBO(233, 236, 255, 0.24),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/home_page/greeting_shield.png', height: 18.0),
          const SizedBox(width: 10),
          Text('Private by default',
              style: AppTextTheme.poppins(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ))
        ]));
  }

  Widget _greetingBanner() {
    String greeting;
    // final user = GetIt.instance<AppState>().user;

    var hour = DateTime.now().hour;
    if (4 <= hour && hour < 12) {
      greeting = 'Morning';
    } else if (12 <= hour && hour < 17) {
      greeting = 'Afternoon';
    } else {
      greeting = 'Evening';
    }

    // final nameToDisplay = NamesHelper.getFirstName(user.name);
    return Text('Good $greeting, ' + userPersona,
        textAlign: TextAlign.center,
        style: AppTextTheme.poppins(
            fontSize: 19.0, fontWeight: FontWeight.w600, color: Colors.white));
  }
}
