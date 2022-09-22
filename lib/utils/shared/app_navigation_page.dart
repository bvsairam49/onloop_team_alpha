import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:get_it/get_it.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_alpha/screens/home_screen.dart';
import 'package:team_alpha/screens/profile_screen.dart';

import '../../model/app_state.dart';
import '../../screens/capture_page.dart';
import '../common_widgets/app_navigation_bar.dart';
import 'app_navigation_services.dart';

GlobalKey<AppNavigationPageState> appNavigationPageStateKey = GlobalKey();
// Reference date for comparison to see which user signed up after
// 1st Nov 2021.
final DateTime newUserSignUpDate = DateTime(2021, 11, 1);

class AppNavigationPage extends StatefulWidget {
  static const homeTabIndex = 0;
  static const profileTabIndex = 1;

  AppNavigationPage() : super(key: appNavigationPageStateKey);

  @override
  AppNavigationPageState createState() => AppNavigationPageState();

  static PageRoute pageRoute() {
    return MaterialPageRoute(
      builder: (context) => AppNavigationPage(),
      settings: const RouteSettings(name: '/homescreen'),
    );
  }
}

class AppNavigationPageState extends State<AppNavigationPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  PersistentTabController _persistentTabController;
  int _navBarFutureIndex;
  bool _showLearnBadge;
  SharedPreferences _prefs;
  DateTime _newContentDate;
  AnimationController _opacityController;
  Animation<double> _fadeInAnimation;
  final double _homePageOpacity = 1.0;
  AppNavigationBar appNavigationBar;
  bool dialogPresent = false;
  bool showMakeFirstCapture = false;
  // LoadingDialogV2 _loadingDialog;
  // final ApiService _apiService = GetIt.instance<ApiService>();

  @override
  void initState() {
    super.initState();
    _showLearnBadge = false;
    _persistentTabController = PersistentTabController(initialIndex: 0);

    // _loadingDialog = LoadingDialogV2();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final appState = GetIt.instance<AppState>();
      _prefs = await SharedPreferences.getInstance();
      // _user = appState.user ?? GetIt.instance<AppState>().user;
      appState.persistentTabController = _persistentTabController;

      // Check prefs completed_goal_guided_tour and if false,
      // fetch visible goals to verify on the first app load.
      bool completedGoalGuidedTour =
          _prefs.getBool('completed_goal_guided_tour') ?? false;
      if (!completedGoalGuidedTour) {
        // final myselfColleague = await _user.myselfColleague();
      }
    });
    _opacityController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this, // the TickerProviderStateMixin
    );
    _fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _opacityController, curve: Curves.easeIn),
    );
  }

  // Override this method so that we are notified when there is a change in the
  // App Lifecycle State (https://api.flutter.dev/flutter/dart-ui/AppLifecycleState-class.html)
  // Note that `WidgetsBinding.instance.addObserver(this);` must be called in
  // the initState & the class must adopt the WidgetsBindingObserver protocol
  // before this method will work.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (mounted && state == AppLifecycleState.resumed) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    AppState appState = GetIt.instance<AppState>();
    if (_navBarFutureIndex != null) {
      _persistentTabController.index = _navBarFutureIndex;
      _navBarFutureIndex = null;
    } else {
      _persistentTabController.index = appState.navBarSelectedIndex;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: const Color(0xFFFFFFFF),
        child: SafeArea(
          top: false,
          child: _navBarBuilder(appState, context),
        ),
      ),
    );
  }

  Builder _navBarBuilder(AppState appState, BuildContext context) {
    appNavigationBar = AppNavigationBar(
      activeTitleColor: const Color(0xFF1B95DA),
      inactiveTitleColor: const Color(0xFF7C9AB5),
      items: _navBarItems(appState),
      onItemSelected: (index) {
        setState(() {
          appState.navBarSelectedIndex = index;
        });
      },
      selectedIndex: _persistentTabController.index,
      prefs: _prefs,
    );
    return Builder(
      builder: (context) {
        return Portal(
          child: PersistentTabView.custom(
            context,
            controller: _persistentTabController,
            screens: _tabScreens(Scaffold.of(context)),
            itemCount: appNavigationBar.items.length,
            confineInSafeArea: true,
            backgroundColor: Colors.white,
            // navBarHeight: 60,
            customWidget: appNavigationBar,
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            onWillPop: (context) {
              return Future.value(false);
            },
          ),
        );
      },
    );
  }

  List<Widget> _tabScreens(ScaffoldState scaffold) {
    return [
      Stack(children: [
        Container(
          color: Colors.black,
          child: AnimatedOpacity(
              opacity: _homePageOpacity,
              duration: const Duration(milliseconds: 500),
              child: HomeScreen()),
        ),
        // if (_homePageOpacity < 1)
        //   BackdropFilter(
        //       filter: ImageFilter.blur(sigmaX: 0.01, sigmaY: 0.01),
        //       child: Container(
        //         color: Colors.black.withOpacity(0),
        //       ))
      ]),
      Container(),
      const ProfileScreen(),
    ];
  }

  List<AppNavigationBarItem> _navBarItems(appState) {
    const navIconHeight = 35.0;
    return [
      AppNavigationBarItem(
          title: 'Home',
          activeImage: Image.asset('assets/navigation_bar/home_selected.png',
              height: navIconHeight),
          inactiveImage: Image.asset('assets/navigation_bar/home.png',
              height: navIconHeight),
          onPressed: (context) {
            // This is needed because persistentTabController listener only notify listeners
            // when another tab is selected so when the same tab is tapped again, we
            // manually notify listeners.
            appState?.persistentTabController?.notifyListeners();
          }),
      AppNavigationBarItem(
          title: 'Capture',
          activeImage: Container(
            height: navIconHeight,
            width: navIconHeight,
            color: Colors.transparent,
          ),
          middleButtonImage: Image.asset(
              'assets/navigation_bar/capture_button.png',
              fit: BoxFit.fitHeight,
              height: 80),
          inactiveImage: Container(
            height: navIconHeight,
            width: navIconHeight,
            color: Colors.transparent,
          ),
          onPressed: (context) async {
            Navigator.push(
              context,
              (MaterialPageRoute(builder: (context) {
                return CapturePage();
              })),
            );

            // GetIt.instance<AnalyticsService>().logButtonPress('add_feedback');
            // HapticFeedback.mediumImpact();
            // final captureCount = _user.captureCount ?? 0;
            // final skipCaptureGuidedTourCount =
            //     _prefs.getInt('skip_capture_guided_tour') ?? 0;
            // if (_user.persona == Persona.ambitiousIndividual &&
            //     !_prefs.getBool('completed_goal_guided_tour')) {
            //   // Navigate to Goal guided tour.
            //   await Navigator.of(context, rootNavigator: true).push(
            //       CaptureGuidedTourIntroPage.pageRoute(
            //           const CaptureGuidedTourIntroPage(
            //               flowType: FlowType.goalType)));
            //   _prefs.setBool('completed_goal_guided_tour', true);
            // } else if (captureCount == 0 && skipCaptureGuidedTourCount < 2) {
            //   await Navigator.of(context, rootNavigator: true).push(
            //       CaptureGuidedTourIntroPage.pageRoute(
            //           const CaptureGuidedTourIntroPage()));
            // } else {
            //   await Navigator.of(context, rootNavigator: true).push(
            //       CapturePageWrapper.pageRoute(const CapturePageWrapper()));
            // }
            // // Adding a delay of 250 milliseconds so that page is popped first before
            // // trying to setState.
            // Future.delayed(const Duration(milliseconds: 250)).then((_) async {
            //   setState(() {});
            // });
          }),
      // AppNavigationBarItem(
      //     title: 'Learn',
      //     activeImage: Container(
      //       height: navIconHeight,
      //       padding:
      //           const EdgeInsets.only(top: 4, bottom: 2.5, left: 2, right: 1),
      //       child: Image.asset('assets/navigation_bar/learn_selected.png'),
      //     ),
      //     inactiveImage: AnimatedBadgeStack(
      //       isBadgeVisible: _showLearnBadge,
      //       right: kIsWeb ? 0 : -2,
      //       top: kIsWeb ? 4 : 2,
      //       child: Image.asset('assets/navigation_bar/learn.png',
      //           height: navIconHeight),
      //     ),
      //     onPressed: (context) {
      //       // _markLearnTabAsRead();
      //     }),
      AppNavigationBarItem(
          title: 'Myself',
          activeImage: Image.asset('assets/navigation_bar/profile_selected.png',
              height: navIconHeight),
          inactiveImage: Image.asset('assets/navigation_bar/profile.png',
              height: navIconHeight),
          onPressed: (context) {
            // Navigator.push(
            //   context,
            //   (MaterialPageRoute(builder: (context) {
            //     return const ProfileScreen();
            //   })),
            // );
            appState?.persistentTabController?.notifyListeners();
          }),
    ];
  }

  void switchTabsIfNecessary() {
    AppState appState = GetIt.instance<AppState>();
    if (appState.navBarFutureIndex != null) {
      if (appState.navBarFutureIndex != _persistentTabController.index) {
        setState(() {
          _navBarFutureIndex = appState.navBarFutureIndex;
          appState.navBarSelectedIndex = _navBarFutureIndex;
        });
      }
      appState.navBarFutureIndex = null;
    }
  }

  void navigateToTab(int tabIndex) {
    final appState = GetIt.instance<AppState>();
    appState.navBarSelectedIndex = tabIndex;
    setState(() {});
  }

  void _markLearnTabAsRead() {
    setState(() {
      _showLearnBadge = false;
    });
    if (_newContentDate != null) {
      _prefs.setString(
          'last_learn_content_read_date', _newContentDate.toString());
    }
  }

  // Sets dialogPresent flag to false.
  void setDialogsCleared() {
    dialogPresent = false;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }
}
