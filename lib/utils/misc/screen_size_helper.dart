import 'package:flutter/material.dart';

class ScreenSizeHelper {
  MediaQueryData _cachedMediaQueryData;

  ScreenSizeHelper(BuildContext context) {
    // TODO: We shouldn't cache the mediaQuery data on web as the user can
    // resize the window.
    _cachedMediaQueryData = MediaQuery.of(context);
  }

  Size displaySize() {
    return _cachedMediaQueryData.size;
  }

  double displayHeight() {
    return displaySize().height;
  }

  double displayWidth([BuildContext context]) {
    if (context != null) {
      return MediaQuery.of(context).size.width;
    } else {
      return displaySize().width;
    }
  }

  double screenSizeFactor() {
    if (displayWidth() < 376) {
      return 0.8;
    }

    return 1.0;
  }

  bool isSmallScreen() {
    return displayHeight() < 740;
  }

  bool isSmallWidth() {
    return displayWidth() < 375;
  }
}
