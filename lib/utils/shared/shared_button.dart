import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/top_tags.dart';
import '../misc/app_text_theme.dart';

class SharedButtons {
  static Widget lightBlueActionIconButton({
    @required String buttonTitle,
    @required IconData iconData,
    @required Function onTapped,
    Color backgoundColor,
    Color iconBackgroundColor,
    double iconSize,
    double height = 28,
  }) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        decoration: BoxDecoration(
            color: backgoundColor ?? const Color(0xFFECEDF2),
            borderRadius: BorderRadius.circular(height)),
        child: Padding(
          padding: const EdgeInsets.all(1.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Container(
                  width: height - 3,
                  height: height - 3,
                  decoration: BoxDecoration(
                      color: iconBackgroundColor ?? const Color(0xFF778391),
                      borderRadius: BorderRadius.circular(11)),
                  child: Padding(
                    // Align icon to the cneter
                    padding: const EdgeInsets.only(top: 0.5, left: 0.5),
                    child: Icon(
                      iconData,
                      color: Colors.white,
                      size: iconSize ?? height - 5,
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 2.0, right: 8.0),
                  child: Text(buttonTitle,
                      textAlign: TextAlign.center,
                      style: AppTextTheme.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: iconBackgroundColor) ??
                          const Color(0xFF778391)))
            ],
          ),
        ),
      ),
    );
  }

  static Widget greyActionIconWithoutTitleButton({
    @required IconData iconData,
    @required Function onTapped,
    Color iconBackgroundColor,
    double iconSize,
    double height = 23,
  }) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
          // 4.0 is the space for padding
          height: height + 7.0,
          decoration: BoxDecoration(
              color: const Color(0xFFECEDF2),
              border: Border.all(color: const Color(0xFFE9F3F8), width: 1.5),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            child: Container(
              width: height,
              height: height,
              decoration: BoxDecoration(
                  color: iconBackgroundColor ?? const Color(0xFF778391),
                  borderRadius: BorderRadius.circular(11)),
              child: Icon(
                iconData,
                color: Colors.white,
                size: iconSize ?? height - 5,
              ),
            ),
          )),
    );
  }

  static Widget greyActionImageButton(
      {String buttonTitle,
      @required Widget image,
      @required Function onTapped,
      double height = 23,
      double width}) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: const Color(0xFFECEDF2),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (buttonTitle != null)
              Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                  child: Text(buttonTitle,
                      textAlign: TextAlign.center,
                      style: AppTextTheme.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF778391)))),
            image
          ],
        ),
      ),
    );
  }

  static Widget darkGreyPillButton({
    @required String buttonTitle,
    @required Function onTapped,
    double iconSize,
    double height = 23,
    double width,
  }) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: const Color(0xFF778391),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 1.0),
                child: Text(buttonTitle,
                    textAlign: TextAlign.center,
                    style: AppTextTheme.openSans(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFFFFFF)))),
          ],
        ),
      ),
    );
  }

  static const double captureTagButtonV3DefaultFontSize = 11.0;
  static const double captureTagButtonV3MinHeight = 21.0;
  static const double captureTagButtonV3MinWidth = 50.0;

  static Widget captureTagButtonV3(
      {@required CaptureTag tag,
      @required Function onPressed,
      Function onLongPressed,
      IconData trailingIcon,
      Widget trailing,
      double fontSize = captureTagButtonV3DefaultFontSize,
      double height = captureTagButtonV3MinHeight,
      EdgeInsets padding,
      bool isSelected = false,
      double selectedBorderWidth = 2.0,
      bool disableInkSplash = false,
      TextStyle customStyle}) {
    assert(tag != null && onPressed != null);
    assert(trailingIcon == null || trailing == null,
        '''trailingIcon and trailing are mutually exclusive. 
        Both cannot be non-null''');

    final borderRadius = height / 3;

    return SizedBox(
      height: height,
      child: ButtonTheme(
        minWidth: captureTagButtonV3MinWidth,
        child: FlatButton(
          padding: const EdgeInsets.all(0),
          splashColor: disableInkSplash ? Colors.transparent : null,
          highlightColor: disableInkSplash ? Colors.transparent : null,
          key: ObjectKey(tag.name),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: isSelected
                      ? captureTagDarkColor[tag.color] ??
                          const Color(0xFF4F697C)
                      : captureTagBorderColor[tag.color] ??
                          const Color(0xFF4F697C),
                  width: isSelected ? selectedBorderWidth : 1.0),
              borderRadius: BorderRadius.circular(borderRadius)),
          child: Container(
              height: height,
              constraints: const BoxConstraints(minWidth: 50),
              decoration: BoxDecoration(
                  color: captureTagLightColor[tag.color] ?? Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius)),
              child: Padding(
                padding: padding ??
                    EdgeInsets.only(
                      left: 8.0,
                      right: (trailingIcon != null || trailing != null)
                          ? 4.0
                          : 8.0,
                    ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(tag.name,
                        style: AppTextTheme.poppins(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600,
                            color: captureTagDarkColor[tag.color] ??
                                const Color(0xFF4F697C))),
                    if (trailingIcon != null)
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 4.0, top: 2.0, right: 4.0),
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: kIsWeb ? 6.0 : 1.5),
                            child: Icon(
                              trailingIcon,
                              color: captureTagDarkColor[tag.color] ??
                                  const Color(0xFF4F697C),
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    if (trailing != null) trailing
                  ],
                ),
              )),
          onPressed: onPressed,
          onLongPress: onLongPressed,
        ),
      ),
    );
  }

  static const double categoryTagButtonV3DefaultFontSize = 12.0;
  static const double categoryTagButtonV3MinHeight = 26.0;
  static const double categoryTagButtonV3MinWidth = 50.0;

  static Widget categoryTagButtonV3(
      {@required CaptureTag tag,
      @required Function onPressed,
      Function onLongPressed,
      IconData trailingIcon,
      Widget trailing,
      double fontSize = categoryTagButtonV3DefaultFontSize,
      double height = categoryTagButtonV3MinHeight,
      EdgeInsets padding,
      bool isSelected = false,
      double selectedBorderWidth = 3.0,
      bool disableInkSplash = false,
      TextStyle customStyle}) {
    assert(tag != null && onPressed != null);
    assert(trailingIcon == null || trailing == null,
        '''trailingIcon and trailing are mutually exclusive. 
        Both cannot be non-null''');

    Color textColor = Colors.white;
    if (tag != null &&
        (tag.color == CaptureTagColor.grey ||
            tag.color == CaptureTagColor.white)) {
      textColor = captureTagDarkColor[tag.color];
    }

    final borderRadius = height / 3;

    return SizedBox(
      height: height,
      child: ButtonTheme(
        minWidth: categoryTagButtonV3MinWidth,
        child: FlatButton(
          padding: const EdgeInsets.all(0),
          splashColor: disableInkSplash ? Colors.transparent : null,
          highlightColor: disableInkSplash ? Colors.transparent : null,
          key: ObjectKey(tag.name),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color:
                      isSelected ? const Color(0xFF4F697C) : Colors.transparent,
                  width: selectedBorderWidth),
              borderRadius: BorderRadius.circular(borderRadius)),
          child: Container(
              height: height,
              constraints: const BoxConstraints(minWidth: 50),
              decoration: BoxDecoration(
                  color: captureTagColor[tag.color],
                  borderRadius: BorderRadius.circular(borderRadius)),
              child: Padding(
                padding: padding ??
                    EdgeInsets.only(
                      left: 8.0,
                      right: (trailingIcon != null || trailing != null)
                          ? 4.0
                          : 8.0,
                    ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tag.name,
                      style: AppTextTheme.poppins(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w600,
                          color: textColor),
                    ),
                    if (trailingIcon != null)
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 4.0, top: 2.0, right: 4.0),
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              color: const Color(0xFF506070),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 1.0),
                            child: Icon(
                              trailingIcon,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    if (trailing != null) trailing
                  ],
                ),
              )),
          onPressed: onPressed,
          onLongPress: onLongPressed,
        ),
      ),
    );
  }

  static Widget emptyCaptureTagButton({
    double height = 21.0,
    double width = 120.0,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 3),
          color: const Color(0xFFE9F3F8),
        ),
      ),
    );
  }

  static Widget onboardingCaptureTagButton(
      {@required CaptureTag tag,
      double fontSize = 10.5,
      double height = 20.0,
      EdgeInsets padding,
      IconData trailingIcon,
      bool isSelected = false,
      bool disableInkSplash = false,
      Function onPressed}) {
    assert(tag != null);

    Color textColor = Colors.white;

    return SizedBox(
      height: height,
      child: ButtonTheme(
        minWidth: 50,
        child: FlatButton(
          padding: const EdgeInsets.all(0),
          splashColor: disableInkSplash ? Colors.transparent : null,
          highlightColor: disableInkSplash ? Colors.transparent : null,
          key: ObjectKey(tag.name),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Container(
              constraints: const BoxConstraints(minWidth: 50),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: captureTagColorGradients[tag.color],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: padding ??
                    const EdgeInsets.only(
                        left: 4, top: 1, right: 4, bottom: 3.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tag.name,
                      style: AppTextTheme.openSans(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w700,
                          color: textColor),
                    ),
                    if (trailingIcon != null)
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: const Color(0xFF506070),
                                borderRadius: BorderRadius.circular(12)),
                            child: Icon(trailingIcon,
                                color: Colors.white, size: 14.5),
                          ))
                  ],
                ),
              )),
          onPressed: onPressed,
        ),
      ),
    );
  }

  static Widget actionRectButton({
    @required String title,
    @required Function onPressed,
    String buttonName,
    double height = 56,
    double width,
    double fontSize = 19,
    FontWeight fontWeight = FontWeight.w600,
    bool shouldEnableButton = true,
    List<Color> gradientColors,
    bool disablePadding = false,
    Color disabledColor = const Color(0xFFF6FAFD),
  }) {
    return Padding(
        padding:
            disablePadding ? const EdgeInsets.all(0) : const EdgeInsets.all(16),
        child: SizedBox(
            height: height,
            width: width,
            child: RaisedButton(
              padding: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Ink(
                  decoration: shouldEnableButton
                      ? BoxDecoration(
                          gradient: LinearGradient(
                              colors: gradientColors ??
                                  [
                                    const Color(0xFF62B5F1),
                                    const Color(0xFF2F95DE),
                                    const Color(0xFF207EC1)
                                  ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.circular(8))
                      : BoxDecoration(
                          color: disabledColor ?? const Color(0xFFF6FAFD),
                          borderRadius: BorderRadius.circular(8)),
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: AppTextTheme.poppins(
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                          color: shouldEnableButton
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFFAFCDDB),
                        ),
                      ))),
              onPressed: shouldEnableButton
                  ? () {
                      if (onPressed != null) {
                        onPressed();
                      }
                    }
                  : null,
            )));
  }

  /// Elevated bottom button with icon in it.
  /// for reference [WellnessCaptureSheet]
  static Widget actionRectGrayButtonWithIcon({
    @required String title,
    @required String imagePath,
    @required Function() onPressed,
    Key uniqueKey,
    String buttonName,
    double height = 56,
    double width,
    double fontSize = 19,
    FontWeight fontWeight = FontWeight.w600,
    bool disablePadding = false,
    Color disabledColor = const Color(0xFFF6FAFD),
  }) {
    return Padding(
      padding:
          disablePadding ? const EdgeInsets.all(0) : const EdgeInsets.all(16),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          key: uniqueKey,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              color: disabledColor ?? const Color(0xFFE9F3F8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    imagePath,
                    width: 20,
                    height: 20,
                    color: const Color(0xFF5C798E),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: AppTextTheme.poppins(
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      color: const Color(0xFF5C798E),
                    ),
                  ),
                ],
              ),
            ),
          ),
          onPressed: () {
            if (onPressed != null) {
              onPressed();
            }
          },
        ),
      ),
    );
  }

  // Flat button variant for actionRectButton that has no gradient, elevation and style.
  static Widget actionFlatRectButton({
    @required String title,
    @required Function onPressed,
    String buttonName,
    double height = 50,
    double width,
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w600,
    bool shouldEnableButton = true,
    bool disablePadding = false,
    Color buttonColor,
    Color buttonTextColor,
    String buttonImgPath,
    double buttonImgHeight,
  }) {
    return Padding(
        padding:
            disablePadding ? const EdgeInsets.all(0) : const EdgeInsets.all(16),
        child: SizedBox(
            height: height,
            width: width,
            child: RaisedButton(
              elevation: 0,
              focusElevation: 0,
              hoverElevation: 0,
              highlightElevation: 0,
              padding: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Ink(
                  decoration: shouldEnableButton
                      ? BoxDecoration(
                          color: buttonColor ?? const Color(0xFFEEFAFF),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: const Color.fromRGBO(27, 149, 218, 0.16),
                              width: 1.0))
                      : BoxDecoration(
                          color: const Color(0xFFF6FAFD),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: const Color.fromRGBO(27, 149, 218, 0.16),
                              width: 1.0)),
                  child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (buttonImgPath != null)
                            Image.asset(buttonImgPath,
                                fit: BoxFit.fitHeight,
                                height: buttonImgHeight ?? 16.0),
                          SizedBox(width: (buttonImgPath != null) ? 6.0 : 0.0),
                          Text(
                            title,
                            style: AppTextTheme.poppins(
                              fontSize: fontSize,
                              fontWeight: fontWeight,
                              color: shouldEnableButton
                                  ? (buttonTextColor ?? const Color(0xFF1B95DA))
                                  : const Color(0xFFAFCDDB),
                            ),
                          ),
                        ],
                      ))),
              onPressed: shouldEnableButton
                  ? () {
                      if (onPressed != null) {
                        onPressed();
                      }
                    }
                  : null,
            )));
  }

  static Widget actionLightBlueButton({
    @required String title,
    @required Function onPressed,
    String buttonName,
    double height = 36,
    double width = 172,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.w500,
    bool shouldEnableButton = true,
    List<Color> gradientColors,
    bool disablePadding = false,
    Color disabledColor = const Color(0xFFF6FAFD),
  }) {
    return Padding(
        padding: disablePadding
            ? const EdgeInsets.all(0)
            : const EdgeInsets.symmetric(vertical: 11),
        child: SizedBox(
            height: height,
            width: width,
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(0),
                ),
                elevation: MaterialStateProperty.all(0.0),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                side: MaterialStateProperty.all(
                  BorderSide(
                      color: const Color(0xff1B95DA).withOpacity(0.16),
                      width: 1.0),
                ),
              ),
              child: Ink(
                  decoration: shouldEnableButton
                      ? BoxDecoration(
                          gradient: LinearGradient(
                              colors: gradientColors ??
                                  [
                                    const Color(0xFFEEFAFF),
                                    const Color(0xFFDEEAF5),
                                  ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.circular(8))
                      : BoxDecoration(
                          color: disabledColor ?? const Color(0xFFF6FAFD),
                          borderRadius: BorderRadius.circular(8)),
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: AppTextTheme.poppins(
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                          color: shouldEnableButton
                              ? const Color(0xff1B95DA)
                              : const Color(0xFFAFCDDB),
                        ),
                      ))),
              onPressed: shouldEnableButton
                  ? () {
                      if (onPressed != null) {
                        onPressed();
                      }
                    }
                  : null,
            )));
  }

  // Squarish Bottom Blue/Action Button
  // To show a blue button without the white box around it, please use
  // SharedButtons.actionRectButton() instead of editing this widget
  static Widget bottomActionRectButton({
    @required String title,
    @required Function onPressed,
    String buttonName,
    double height = 50,
    double width,
    double fontSize = 20,
    bool whiteBoxVisible = true,
    bool shouldEnableButton = true,
    bool disablePadding = false,
    List<Color> gradientColors,
    Color disabledColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        boxShadow: whiteBoxVisible
            ? [
                const BoxShadow(
                    color: Color(0xFFECEDF2),
                    blurRadius: 3.0,
                    offset: Offset(0, -3))
              ]
            : null,
      ),
      child: Column(
        children: [
          actionRectButton(
              title: title,
              onPressed: onPressed,
              disabledColor: disabledColor,
              buttonName: buttonName,
              height: height,
              width: width,
              fontSize: fontSize,
              shouldEnableButton: shouldEnableButton,
              disablePadding: disablePadding,
              gradientColors: gradientColors)
        ],
      ),
    );
  }

  static Widget skipGreyButton(
      {@required String title, @required Function onPressed}) {
    const buttonHeight = 40.0;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SizedBox(
          height: buttonHeight,
          width: 125.0,
          child: FlatButton(
            padding: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            child: Container(
              height: buttonHeight,
              decoration: BoxDecoration(
                  color: const Color(0xFF778391),
                  borderRadius: BorderRadius.circular(7)),
              child: Center(
                child: Text(
                  title,
                  style: AppTextTheme.poppins(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }

  static Widget blueActionIconButton({
    @required String buttonTitle,
    @required IconData iconData,
    @required Function onTapped,
    Color iconBackgroundColor,
    double iconSize,
    double height = 28,
  }) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xff207EC1),
                  Color(0xff2F95DE),
                  Color(0xff62B5F1)
                ]),
            borderRadius: BorderRadius.circular(height),
            border: Border.all(width: 3, color: Colors.white.withOpacity(0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 4.0),
                child: Text(buttonTitle,
                    textAlign: TextAlign.center,
                    style: AppTextTheme.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white))),
            Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Container(
                width: height - 2,
                height: height - 2,
                decoration: BoxDecoration(
                    color: iconBackgroundColor ?? const Color(0xFF778391),
                    borderRadius: BorderRadius.circular(11)),
                child: Icon(
                  iconData,
                  color: Colors.white,
                  size: iconSize ?? height - 5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget blueSaveButton({bool enabled, Function onPressed}) {
    return RawMaterialButton(
      fillColor: enabled ? const Color(0xFF3292D7) : const Color(0xFFECEDF2),
      elevation: 2,
      child: Text('Login',
          style: AppTextTheme.openSans(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              color: Colors.white)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: enabled ? onPressed : null,
    );
  }

  static Widget blueShareButton(
      {String title, String trailingIconPath, Function onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 30,
        width: 70,
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color(0xFF62B5F1),
              Color(0xFF2F95DE),
              Color(0xFF207EC1),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 8.0)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(children: [
            Text(title,
                style: AppTextTheme.poppins(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            const SizedBox(width: 4),
            if (trailingIconPath.isNotEmpty)
              Image.asset(trailingIconPath, fit: BoxFit.fitHeight, height: 15),
          ]),
        ),
      ),
    );
  }

  static Widget smallerBlueButton(
      {String title, String prefixIconPath, Function onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color(0xFF62B5F1),
              Color(0xFF2F95DE),
              Color(0xFF207EC1),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 8.0)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (prefixIconPath != null && prefixIconPath.isNotEmpty)
              Image.asset(prefixIconPath, fit: BoxFit.fitHeight, height: 15),
            const SizedBox(width: 5),
            Text(title,
                style: AppTextTheme.poppins(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            const SizedBox(width: 4),
          ]),
        ),
      ),
    );
  }

  static Widget blueTextButton(
      {@required String buttonTitle,
      @required Function onTapped,
      Widget image,
      double height = 24,
      double width}) {
    return GestureDetector(
      onTap: onTapped,
      child: SizedBox(
        height: height,
        width: width,
        child: Container(
          padding: const EdgeInsets.only(left: 35),
          child: Row(
            children: [
              if (image != null) image,
              Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 3.0),
                  child: Text(buttonTitle ?? '',
                      textAlign: TextAlign.right,
                      style: AppTextTheme.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF1B95DA))))
            ],
          ),
        ),
      ),
    );
  }

  static Widget captureSettingsCardButton(
      {@required String buttonTitle,
      @required String buttonSubTitle,
      @required String imagePath,
      @required Function onTapped,
      Color titleColor = const Color(0xFF4F697C),
      Color subTitleColor = const Color(0xFF5C798E),
      double horizontalPadding = 18.0}) {
    return GestureDetector(
      onTap: onTapped,
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: 5.0, horizontal: horizontalPadding),
        child: Row(
          children: [
            SizedBox(
              height: 32.0,
              width: 32.0,
              child: Image.asset(
                imagePath,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  buttonTitle,
                  style: AppTextTheme.poppins(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: titleColor ?? '',
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  buttonSubTitle,
                  style: AppTextTheme.poppins(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w500,
                    color: subTitleColor ?? '',
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
