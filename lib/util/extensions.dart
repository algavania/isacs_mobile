import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';

import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';

extension CustomThemeExtension on BuildContext {

  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  void showSnackBar({
    required String message,
    bool isSuccess = true,
    bool isTop = false,
  }) {
    final context = this;
    final backgroundColor =
        isSuccess ? ColorValues.success10 : ColorValues.danger10;
    final borderColor =
        isSuccess ? ColorValues.success20 : ColorValues.danger20;
    final color =
        isSuccess ? ColorValues.success50 : ColorValues.danger50;
    var flushbar = Flushbar<void>();
    flushbar = Flushbar(
      flushbarPosition: isTop ? FlushbarPosition.TOP : FlushbarPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.symmetric(
        vertical: Styles.defaultPadding,
        horizontal: Styles.bigSpacing,
      ),
      padding: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(Styles.defaultBorder),
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      messageText: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Styles.smallerBorder),
              color: color,
              border: Border.all(color: borderColor),
            ),
            child: const Center(
              child: Icon(
                IconsaxPlusBold.info_circle,
                color: ColorValues.white,
                size: 16,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
              child:
                  Text(message, style: Theme.of(context).textTheme.bodySmall),
            ),
          ),
          GestureDetector(
            onTap: () => flushbar.dismiss(),
            child: const Icon(
              Icons.close_rounded,
              size: 16,
              color: ColorValues.text50,
            ),
          ),
          const SizedBox(width: Styles.defaultSpacing,),
        ],
      ),
    )

    ..show(context);
  }
}

extension CustomConverter on String {
  String replaceToNewLine() {
    return replaceAll(r'\n', '\n');
  }

  Color hexToColor() {
    final hexValue = int.parse('FF$this', radix: 16);
    return Color(hexValue);
  }

  TimeOfDay toTimeOfDay() {
    final time = split(':');
    return TimeOfDay(
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
    );
  }
}

/// Extension on [DateTime] to format it to a string with a specified locale.
extension FormattedDateTime on DateTime {
  /// Returns a formatted string representation of the [DateTime] object.

  String toFormattedDate() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}

extension LayoutExtension on num {
  Widget get vertical => SizedBox(height: toDouble());

  Widget get horizontal => SizedBox(width: toDouble());
}
