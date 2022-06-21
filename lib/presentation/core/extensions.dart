import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension DimsX on BuildContext {
   Size get dims => MediaQuery.of(this).size;
}

extension AppLocalizationsX on BuildContext {
   /// l10n getter that gives access to .arb translations
   /// with minimal amount of boilerplate.
   AppLocalizations get l10n => AppLocalizations.of(this)!;
}
