import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:piczzie/l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  password() => Intl.message("password");

  email() => Intl.message("email");

  register() => Intl.message("register");

  login() => Intl.message("login");

  forgottenPassword() => Intl.message("forgotten_password");

  profile() => Intl.message("profile");

  children(String count) =>
      Intl.message("$count children", name: 'children', args: [count]);

  child(String count) =>
      Intl.message("$count child", name: 'child', args: [count]);

  friends(String count) =>
      Intl.message("$count friends", name: 'friends', args: [count]);

  friend(String count) =>
      Intl.message("$count friend", name: 'friend', args: [count]);

  description() => Intl.message("description");

  price() => Intl.message("price");

  place() => Intl.message("place");

  website() => Intl.message("website");

  addGift() => Intl.message("Add");
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'fr', 'messages'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
