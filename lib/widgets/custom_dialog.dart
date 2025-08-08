import 'package:flutter/material.dart';
import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';
import 'package:isacs_mobile/l10n/l10n.dart';
import 'package:isacs_mobile/widgets/custom_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    required this.title,
    required this.child,
    super.key,
    this.description,
    this.descriptionWidget,
    this.proceedAction,
    this.proceedText,
  });

  final String title;
  final String? description;
  final Widget? descriptionWidget;
  final Widget child;
  final VoidCallback? proceedAction;
  final String? proceedText;

  @override
  Widget build(BuildContext context) {
    final Widget proceedButton = CustomButton(
      onPressed: () {
        proceedAction?.call();
      },
      buttonText: proceedText ?? context.l10n.yes,
    );

    final Widget cancelButton = CustomButton(
      onPressed: () => Navigator.of(context).pop(),
      buttonText: context.l10n.cancel,
      isWhiteButton: true,
    );

    final alert = Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          surfaceTintColor: ColorValues.white,
          backgroundColor: ColorValues.white,
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Styles.defaultSpacing,
            children: [
              if (description != null)
                  Text(
                    description ?? '',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.justify,
                  ),
              if (descriptionWidget != null) descriptionWidget!,
              child,
              const SizedBox(height: Styles.defaultSpacing),
              Row(
                children: [
                  if (proceedAction != null) Expanded(child: cancelButton),
                  if (proceedAction != null)
                    const SizedBox(
                      width: Styles.defaultSpacing,
                    ),
                  Expanded(child: proceedButton),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    return alert;
  }
}
