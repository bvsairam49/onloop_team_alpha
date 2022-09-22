import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// import 'user.dart';

/// Represents the App State
class AppState extends ChangeNotifier {
  // User _user;
  int navBarFutureIndex;
  int navBarPreviousIndex;
  int _navBarSelectedIndex = 0;
  String myDirectsMagicLink;
  String inviteOrgLink;
  // id of canonical team that is selected in team tab
  String selectedTeamId;
  // MagicLinkDetails _currentMagicLinkDetails;
  // final DatabaseService _db = DatabaseService();
  // StreamSubscription<User> _userStreamSubscription;
  PersistentTabController _persistentTabController;
  // User get user {
  //   return _user;
  // }

  int get navBarSelectedIndex {
    return _navBarSelectedIndex;
  }

  set navBarSelectedIndex(int selectedIndex) {
    if (selectedIndex != _navBarSelectedIndex) {
      if (navBarPreviousIndex != null) {
        navBarPreviousIndex = _navBarSelectedIndex;
      }
      _navBarSelectedIndex = selectedIndex;
      notifyListeners();
    }
  }

  // Fetches the user record for the given user id, and populates it in the
  // user property. This also starts a stream to listen for updates to the user
  // record and updates the user property accordingly.
  // This method should be called at least once during startup.
  //
  // Note: If there is a change in the logged-in user, then this method will overwrite
  // the old user & stream.
  // Future<void> populateUser(
  //   String userId, {
  //   FirebaseAuth.User firebaseUser,
  // }) async {
  //   _user = await _db.fetchUser(userId);

  //   if (user != null) {
  //     if (_userStreamSubscription != null) {
  //       await _userStreamSubscription.cancel();
  //       _userStreamSubscription = null;
  //     }

  //     Sentry.configureScope((scope) => scope.setUser(
  //         SentryUser(id: _user.id, email: _user.email, ipAddress: '{{auto}}')));
  //     if (!kIsWeb) {
  //       Instabug.identifyUser(_user.email);
  //     }

  //     _userStreamSubscription =
  //         _db.fetchUserSteam(user.reference).listen((userUpdate) {
  //       _user = userUpdate;
  //     });

  //     if (_user.avatarUrl == null) {
  //       await GetIt.instance<ApiService>().updateAvatar(firebaseUser.photoURL);
  //       _user.avatarUrl = firebaseUser.photoURL;
  //       notifyListeners();
  //     }
  //   }
  // }

  // Clean up all the existing ivars when the user logs out the app.
  // void cleanUp() {
  //   _user = null;
  //   Sentry.configureScope((scope) => scope.setUser(null));
  //   if (!kIsWeb) {
  //     Instabug.logOut();
  //   }
  //   _currentMagicLinkDetails = null;
  //   _navBarSelectedIndex = 0;
  // }

  // Create a user record for the given firebaseUser
  // (if one does not already exist).
  // Future<bool> createUser(FirebaseAuth.User firebaseUser) async {
  //   assert(firebaseUser != null);

  //   final apiService = GetIt.instance<ApiService>();

  //   // Call create-user endpoint.
  //   final success = await apiService.createUser(firebaseUser);
  //   if (success) {
  //     await populateUser(firebaseUser.uid);
  //     _user.updateOnboardingStatus(OnboardingStatus.privacyPolicyAccepted);
  //     GetIt.instance<AnalyticsService>().logPrivacyPolicyStatus('accept');
  //     _user.updateUserTimezoneVersion();
  //     return true;
  //   }
  //   return false;
  // }

  // Getter method for retrieving the PersistentTabController
  // used in app_navigation_bar which can be used to tell
  // which tab is currently selected or attach listeners when a
  // different tab is selected.
  PersistentTabController get persistentTabController {
    return _persistentTabController;
  }

  // Setter method to store the PersistentTabController used
  // in the app_navigation_bar.
  set persistentTabController(PersistentTabController persistentTabController) {
    _persistentTabController = persistentTabController;
  }
}
