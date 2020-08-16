import 'dart:convert';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }



  Map<String, String> _localizedValues;

  Future load() async{
    String jsonStrVal = await rootBundle.loadString(
        'lib/lang/${locale.languageCode}.json'
    );

    Map<String,dynamic> mappedJson = json.decode(jsonStrVal);

    _localizedValues = mappedJson.map((key, value) => MapEntry(key,value.toString()));

  }

  String getTransVal(String key)
  {
    return _localizedValues[key];
  }


  static const LocalizationsDelegate<DemoLocalizations> delegate = _DemoLocalizationsDelegate();

}

class _DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const _DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'hi'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) async {
    DemoLocalizations localization = DemoLocalizations(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(_DemoLocalizationsDelegate old) => false;
}