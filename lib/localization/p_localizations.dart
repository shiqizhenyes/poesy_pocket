

import 'package:flutter/widgets.dart';

class PLocations {

  PLocations(this.locale);

  final Locale locale;

  static PLocations of(BuildContext context) {
    return Localizations.of<PLocations>(context, PLocations);
  }

  static Map<String, Map<String, String>> _localizedValue = {
    'en': {
      'title':'诗藏',
      'smooth': '畅',
      'stich': '一首',
      'meet': '邂逅',
      'poetry': '诗词',
      'ritual_music': '礼乐',
    },
    'zh': {
      'title':'诗藏',
      'smooth': '畅',
      'stich': '一首',
      'meet': '邂逅',
      'poetry': '诗词',
      'ritual_music': '礼乐',
    }
  };

  String get title {
    return _localizedValue[locale.languageCode]["title"];
  }

  String get smooth {
    return _localizedValue[locale.languageCode]["smooth"];
  }

  ///      'stich': '一首',
  ///      'meet': '邂逅',
  ///      'poetry': '诗词',
  ///      'comity': '礼让',

  String get stich {
    return _localizedValue[locale.languageCode]["stich"];
  }

  String get meet {
    return _localizedValue[locale.languageCode]["meet"];
  }

  String get poetry {
    return _localizedValue[locale.languageCode]["poetry"];
  }

  String get ritualMusic {
    return _localizedValue[locale.languageCode]["ritual_music"];
  }

}