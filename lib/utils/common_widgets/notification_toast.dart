import 'package:flutter/material.dart';

import '../misc/app_text_theme.dart';

// Widget takes in image, title to display a toast
// that is used when the user has the app opened on the foreground
// and receives a curated learn content for his/her self-capture.
class NotificationToast {
  static Widget toastWidget({String logoPath, String title, Function onTap}) {
    return GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Color(0xFF374757),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                      blurRadius: 8.0,
                      offset: Offset(0, 2)),
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.08),
                      blurRadius: 16.0,
                      offset: Offset(0, 4))
                ]),
            child: Row(
              children: [
                SizedBox(width: 10.0),
                Opacity(
                  opacity: 1.0,
                  child: Image.asset(
                    logoPath,
                    fit: BoxFit.fitHeight,
                    height: 32,
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        style: AppTextTheme.poppins(
                            fontSize: 11.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFFFFFF)),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.00),
              ],
            ),
          ),
        ),
        onTap: onTap);
  }
}
