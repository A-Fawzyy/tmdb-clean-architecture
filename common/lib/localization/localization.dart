

import 'package:flutter/material.dart';
import 'package:common/generated/l10n.dart';

extension LocalizedStrings on BuildContext {
  /// Returns single instance of [AppLocalizations]
  /// Used instead of accessing and importing localized strings
  AppLocalization   get localization => AppLocalization.of(this);

}
