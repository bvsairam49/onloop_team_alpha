import 'package:flutter/cupertino.dart';
import 'package:team_alpha/utils/common_widgets/sliding_segment_control.dart';

import '../misc/app_text_theme.dart';

// A sliding selector of multiple options based on the values of an enum.
class SlidingOptionsSelector<T> extends StatelessWidget {
  final EdgeInsets padding;
  final Radius parentRadius;
  final Radius thumbRadius;
  final Color backgroundColor;
  final List<BoxShadow> thumbShadow;
  final T state;
  final Map<T, String> options;
  final Function(T) onValueChanged;

  const SlidingOptionsSelector({
    Key key,
    @required this.state,
    @required this.options,
    this.onValueChanged,
    this.padding,
    this.parentRadius,
    this.thumbRadius,
    this.backgroundColor,
    this.thumbShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedControlStyle = AppTextTheme.poppins(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF4F697C));
    final deselectedControlStyle = AppTextTheme.poppins(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF7C9AB5));

    final Map<T, Widget> segmentedControlTitles = options.map(
        (itemState, stateString) => MapEntry(
            itemState,
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(stateString,
                    textAlign: TextAlign.center,
                    style: itemState == state
                        ? selectedControlStyle
                        : deselectedControlStyle))));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingSegmentedControl(
          groupValue: state,
          children: segmentedControlTitles,
          backgroundColor: backgroundColor ?? const Color(0xFFE9F3F8),
          padding: padding ??
              const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
          thumbShadow: thumbShadow ?? const [],
          parentRadius: parentRadius ?? const Radius.circular(12.0),
          thumbRadius: thumbRadius ?? const Radius.circular(12.0),
          onValueChanged: (newState) {
            onValueChanged?.call(newState);
          },
        ),
      ],
    );
  }
}
