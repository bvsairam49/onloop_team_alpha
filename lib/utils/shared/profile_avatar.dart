import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A customizable profile avatar widget with support to show emoji's stacked
/// on top of the profile image.
///
/// Avatar image can be provided either from the network,
/// asset, etc. as long as it is an ImageProvider.
///
/// The emoji & border color is determined by the [emoji] parameter.
/// Also, emoji is 40% of the avatar radius.
@immutable
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    this.image,
    Key key,
    this.enableEmoji = true,
    this.enableDelete = false,
    this.radius = 0,
    this.name = '',
    this.showInitials = false,
    this.backgroundColor,
    this.borderColor,
  })  : assert(radius > 0, 'Radius must be greater than 0.'),
        super(key: key);

  /// Whether to enable or disable the emoji.
  final bool enableEmoji;

  /// Whether to enable or disable the delete icon.
  final bool enableDelete;

  /// The avatar image.
  final ImageProvider image;

  /// The wellness emoji.

  /// The radius of the of the avatar.
  final double radius;

  // The name of user
  final String name;

  // Whether to show initials or not
  final bool showInitials;

  /// The background color
  final Color backgroundColor;

  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1.5),
            borderRadius: BorderRadius.circular(radius * 50000),
          ),
          padding: const EdgeInsets.all(1),
          child: image == null && showInitials
              ? CircleAvatar(
                  radius: radius,
                  backgroundColor: backgroundColor ?? Colors.white,
                  child: Text(
                    name.isNotEmpty ? name.substring(0, 1) : 'O',
                    style: GoogleFonts.poppins(
                      fontSize: radius,
                      color: const Color(0xff7C9AB5),
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: radius,
                  backgroundImage: image,
                  backgroundColor: Colors.white),
        ),
      ],
    );
  }
}
