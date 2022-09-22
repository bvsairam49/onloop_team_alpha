import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../misc/app_text_theme.dart';

class OnLoopAppBar extends AppBar {
  final String titleString;
  final Future<String> titleStringFuture;
  final Widget titleWidget;
  @override
  final Widget leading;
  @override
  final List<Widget> actions;
  final bool showBottomLine;
  @override
  final Color backgroundColor;
  final bool showBottomSeparator;

  OnLoopAppBar({
    Key key,
    this.titleString,
    this.titleStringFuture,
    this.titleWidget,
    this.leading,
    this.actions,
    this.showBottomLine = true,
    this.backgroundColor = Colors.white,
    this.showBottomSeparator = true,
  }) : super(
            key: key,
            // If titleString is provided, use that, else use titleStringFuture.
            title: titleString != null
                ? Text(titleString,
                    style: AppTextTheme.poppins(
                        fontSize: 19,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF4F697C)))
                : (titleStringFuture != null
                    ? FutureBuilder<String>(
                        future: titleStringFuture,
                        builder: (context, snapshot) {
                          String futureTitle = 'Unknown Title';
                          if (snapshot.hasData) {
                            futureTitle = snapshot.data;
                          }

                          return Text(futureTitle,
                              style: AppTextTheme.poppins(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF4F697C)));
                        })
                    : titleWidget),
            iconTheme: const IconThemeData(color: Color(0xFF506070)),
            backgroundColor: backgroundColor ?? Colors.white,
            centerTitle: true,
            leading: leading,
            elevation: 0,
            bottomOpacity: showBottomLine ? 1.0 : 0.0,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            bottom: showBottomSeparator
                ? PreferredSize(
                    child:
                        Container(height: 1.0, color: const Color(0xFFE9F3F8)),
                    preferredSize: const Size.fromHeight(1.0))
                : const SizedBox(),
            automaticallyImplyLeading: false) {
    assert(!(titleString != null && titleStringFuture != null),
        'titleString or titleStringFuture or titleWidget cannot both be set.');
    assert(
        titleString != null || titleStringFuture != null || titleWidget != null,
        'Either titleString or titleStringFuture or titleWidget must be set');
  }

  static Widget deleteButton({Function onPressed}) {
    return _appBarButton(
        imagePath: 'assets/app_bar/delete.png',
        onPressed: onPressed,
        imageHeight: 25);
  }

  static Widget hamburgerMenuCloseButton({Function onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _appBarButton(
            imagePath: 'assets/app_bar/close.png',
            onPressed: onPressed,
            isWhiteBackground: true,
            imageHeight: 48)
      ],
    );
  }

  static Widget closeButton({Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        children: [
          _appBarButton(
              imagePath: 'assets/app_bar/close.png', onPressed: onPressed),
        ],
      ),
    );
  }

  static Widget closeButtonWithOpacity(
      {Function onPressed, double opacity = 0.15}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        children: [
          _appBarButton(
              imagePath: 'assets/app_bar/close.png',
              onPressed: onPressed,
              isOpacityRequired: true,
              opacity: opacity)
        ],
      ),
    );
  }

  static Widget backButton({Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          _appBarButton(
            imagePath: 'assets/app_bar/back.png',
            imageHeight: 30,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  static Widget savedButton({Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        children: [
          _appBarButton(
              imagePath: 'assets/app_bar/saved.png',
              imageHeight: 30,
              onPressed: onPressed),
        ],
      ),
    );
  }

  static Widget skipButton({Function onPressed}) {
    return SizedBox(
      height: 39,
      width: 80,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 15),
        child: FlatButton(
            padding: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            color: const Color(0xffFFFFFF),
            child: Text(
              'Skip',
              style: AppTextTheme.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff5c798e)),
            ),
            onPressed: onPressed),
      ),
    );
  }

  static Widget nextButton({Function onPressed}) {
    return SizedBox(
      height: 39,
      width: 80,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 15),
        child: FlatButton(
            padding: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            color: const Color(0xFF3292D7),
            child: Text(
              'Next',
              style: AppTextTheme.openSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFFFFFF)),
            ),
            onPressed: onPressed),
      ),
    );
  }

  static Widget settingsButton({Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Row(
        children: [
          _appBarButton(
              imageHeight: 30,
              imagePath: 'assets/app_bar/settings.png',
              onPressed: onPressed),
        ],
      ),
    );
  }

  static Widget createTeamButton({Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          _appBarButton(
              imagePath: 'assets/app_bar/create_team.png',
              onPressed: onPressed),
        ],
      ),
    );
  }

  static Widget editButton({Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        children: [
          _appBarButton(
              imagePath: 'assets/app_bar/edit.png',
              imageHeight: 30,
              onPressed: onPressed),
        ],
      ),
    );
  }

  static Widget infoButton({Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        children: [
          _appBarButton(
              imagePath: 'assets/app_bar/info.png',
              imageHeight: 30,
              onPressed: onPressed),
        ],
      ),
    );
  }

  static Widget backButtonIfAvailable(
      {BuildContext context, Function onPressed}) {
    return Navigator.canPop(context)
        ? OnLoopAppBar.backButton(onPressed: onPressed)
        : null;
  }

  static Widget _appBarButton(
      {@required String imagePath,
      @required Function onPressed,
      bool isWhiteBackground = false,
      double buttonHeight = 40,
      double imageHeight = 40,
      double opacity = 1,
      bool isOpacityRequired = false}) {
    return SizedBox(
      height: buttonHeight,
      width: buttonHeight,
      child: FlatButton(
          padding: const EdgeInsets.all(0),
          color: isWhiteBackground
              ? const Color(0xFFFFFFFF).withOpacity(opacity)
              : const Color(0xFFF6FAFD).withOpacity(opacity),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(
                  color: isOpacityRequired
                      ? Colors.transparent
                      : const Color(0xFFE9F3F8))),
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitHeight,
            height: imageHeight,
            color: isOpacityRequired ? Colors.white : null,
          ),
          onPressed: onPressed),
    );
  }
}
