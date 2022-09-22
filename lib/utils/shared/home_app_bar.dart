import 'package:flutter/material.dart';

class HomeAppBar extends AppBar {
  final Widget titleWidget;
  final Widget leading;
  final List<Widget> actions;
  final Widget flexibleSpaceWidget;

  HomeAppBar({
    this.titleWidget,
    this.leading,
    this.actions,
    this.flexibleSpaceWidget,
  }) : super(
            title: titleWidget,
            leading: leading,
            actions: actions,
            backgroundColor: Colors.transparent,
            flexibleSpace: flexibleSpaceWidget,
            elevation: 0,
            brightness: Brightness.dark,
            automaticallyImplyLeading: false,
            centerTitle: true);

  static Widget hamburgerButton({Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        children: [
          _homeAppBarButton(
              imagePath: 'assets/app_bar/hamburger.png',
              onPressed: onPressed,
              imageHeight: 32.0)
        ],
      ),
    );
  }

  static Widget inboxButton({Function onPressed}) {
    return _homeAppBarButton(
        imagePath: 'assets/app_bar/inbox.png',
        onPressed: onPressed,
        imageHeight: 32.0);
  }

  // This widget is a template for the action buttons on the HomeAppBar. Referenced from onloop_app_bar.dart
  static Widget _homeAppBarButton(
      {@required String imagePath,
      @required Function onPressed,
      double buttonHeight = 40,
      double imageHeight = 40}) {
    return SizedBox(
      height: buttonHeight,
      width: buttonHeight,
      child: FlatButton(
          padding: const EdgeInsets.all(0),
          color: Colors.transparent,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitHeight,
            height: imageHeight,
          ),
          onPressed: onPressed),
    );
  }
}
