// This class is being used for in-app navigation purposes.
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../model/app_state.dart';
import 'app_navigation_page.dart';

class AppNavigationService {
  // This function navigates the user to the home tab.
  static void navigateToHomeTab() {
    final appState = GetIt.instance<AppState>();
    appState.navBarFutureIndex = AppNavigationPage.homeTabIndex;
    appNavigationPageStateKey.currentState.switchTabsIfNecessary();
  }

  // This function navigates the user to the teams tab.

  // This function navigates the user to the capture flow.
  // If sentiment is specified, capture page will have given sentiment selected.
  // static Future<void> navigateToCaptureFlow(BuildContext context,
  //     {CaptureTagSentiment sentiment}) async {
  //   if (sentiment != null) {
  //     await Navigator.of(context, rootNavigator: true).push(
  //         CapturePageV3.pageRoute(CapturePageV3(selectedSentiment: sentiment)));
  //   } else {
  //     await Navigator.of(context, rootNavigator: true)
  //         .push(CapturePageV3.pageRoute(CapturePageV3()));
  //   }
  // }

  // This function navigates the user to the profile tab.
  static void navigateToProfileTab() {
    final appState = GetIt.instance<AppState>();
    appState.navBarFutureIndex = AppNavigationPage.profileTabIndex;
    appNavigationPageStateKey.currentState.switchTabsIfNecessary();
  }

  // Goal is shared by Manager. Navigate to edit Goal page.
  // static Future<bool> navigateToEditGoalPage(
  //     BuildContext context, Goal sharedGoal, Colleague selectedColleague,
  //     {WidgetToEdit widgetToEdit}) async {
  //   final result = await Navigator.of(context, rootNavigator: true).push(
  //     CapturePageEdit.pageRoute(
  //       CapturePageEdit(
  //           selectedColleague: selectedColleague,
  //           goal: sharedGoal,
  //           widgetToEdit: widgetToEdit),
  //     ),
  //   );

  //   return result;
  // }

  // Goal is shared from Direct. Navigate to view Goal page.
  // static Future<bool> navigateToGoalOverviewPage(BuildContext context,
  //     Colleague selectedColleague, DocumentReference sharedGoalRef,
  //     {bool showConversationTab = false}) async {
  //   final response = await Navigator.of(context, rootNavigator: true).push(
  //     GoalOverviewPage.pageRoute(
  //       GoalOverviewPage(selectedColleague, sharedGoalRef,
  //           conversationTabSelected: showConversationTab),
  //     ),
  //   );

  //   return response;
  // }

  // This function navigates the user to the Prism summary rating page.
  // static Future<void> navigateToSummaryRatingPage(
  //     DocumentReference feedbackReviewRef, BuildContext context) async {
  //   await Navigator.of(context, rootNavigator: true).push(
  //     SummaryRatingPage.pageRoute(
  //       SummaryRatingPage(feedbackReviewRef: feedbackReviewRef),
  //     ),
  //   );
  // }
}
