import 'package:flutter/material.dart';
import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';
import 'package:isacs_mobile/util/extensions.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    required this.title,
    required this.child,
    super.key,
    this.subtitle,
    this.onSubtitleTap,
  });

  final String title;
  final Widget child;
  final String? subtitle;
  final void Function()? onSubtitleTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Styles.defaultSpacing,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: Styles.defaultSpacing,
          children: [
            Expanded(
              child: Text(
                title,
                style: context.textTheme.titleMedium,
              ),
            ),
            if (subtitle != null)
              GestureDetector(
                onTap: onSubtitleTap,
                child: Text(
                  subtitle!,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: ColorValues.primary50,
                  ),
                ),
              ),
          ],
        ),
        child,
      ],
    );
  }
}
