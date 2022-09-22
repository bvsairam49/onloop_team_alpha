import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:popover/popover.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

import '../misc/app_text_theme.dart';
import '../misc/screen_size_helper.dart';

class AppNavigationBarItem extends PersistentBottomNavBarItem {
  final String title;
  final Widget activeImage;
  final Widget inactiveImage;
  final Widget middleButtonImage;
  final Function(BuildContext) onPressed;

  AppNavigationBarItem(
      {@required this.title,
      this.activeImage,
      this.inactiveImage,
      this.middleButtonImage,
      this.onPressed})
      : super(icon: const Icon(Icons.check)) {
    assert(this.title != null);
  }
}

class AppNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final int previousIndex;
  final Color activeTitleColor;
  final Color inactiveTitleColor;
  final Color backgroundColor;
  final List<AppNavigationBarItem> items;
  final ValueChanged<int> onItemSelected;
  final double navBarHeight;
  final SharedPreferences prefs;
  final Function onPressed;
  BuildContext buildContext;

  // ignore: use_key_in_widget_constructors
  AppNavigationBar({
    Key key,
    this.selectedIndex,
    this.previousIndex,
    @required this.activeTitleColor,
    @required this.inactiveTitleColor,
    this.backgroundColor,
    this.navBarHeight = 60.0,
    this.prefs,
    this.onPressed,
    @required this.items,
    this.onItemSelected,
  }) {
    assert(activeTitleColor != null);
    assert(inactiveTitleColor != null);
  }

  Widget _buildItem(AppNavigationBarItem item, bool isSelected, double height) {
    return SizedBox(
      width: 150.0,
      height: height,
      child: Container(
        alignment: Alignment.center,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (item.activeImage != null && item.inactiveImage != null)
              isSelected ? item.activeImage : item.inactiveImage,
            Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(item.title ?? '',
                      style: AppTextTheme.poppins(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? activeTitleColor
                              : inactiveTitleColor))),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    final midIndex = (items.length / 2).floor();
    return PortalEntry(
      portal: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
              onTap: () {
                if (items[midIndex].onPressed != null) {
                  items[midIndex].onPressed(context);
                } else {
                  onItemSelected(midIndex);
                }
              },
              child: items[midIndex].middleButtonImage),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: navBarHeight,
        decoration: const BoxDecoration(
            border:
                Border(top: BorderSide(width: 2, color: Color(0xFFECEDF2)))),
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: items.map((item) {
                var index = items.indexOf(item);
                return Flexible(
                  child: GestureDetector(
                    onTap: () {
                      if (items[index].onPressed != null) {
                        items[index].onPressed(context);
                      }
                      onItemSelected(index);
                    },
                    child:
                        _buildItem(item, selectedIndex == index, navBarHeight),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
