import 'package:flutter/material.dart';
import 'package:isacs_mobile/l10n/l10n.dart';

class Validator {
  Validator({required this.context});

  final BuildContext context;

  String? emptyValidator(String? text) {
    if (text == null) return context.l10n.emptyValidatorMessage;
    if (text.trim().isEmpty) return context.l10n.emptyValidatorMessage;
    return null;
  }

  String? telegramValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return context.l10n.emptyValidatorMessage;
    }
    // Check if the text starts with '@' and not contains spaces
    if (!text.startsWith('@') || text.contains(' ')) {
      return context.l10n.telegramUsernameValidation;
    }
    return null;
  }
}
