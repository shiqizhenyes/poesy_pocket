

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
      'read_aloud_poesy_for_you': '为你读诗',
      'concentration': '精选',
      'has_play': '播放次数',
      'colon': ':',
    },
    'zh': {
      'title':'诗藏',
      'smooth': '畅',
      'stich': '一首',
      'meet': '邂逅',
      'poetry': '诗词',
      'ritual_music': '礼乐',
      'read_aloud_poesy_for_you': '为你读诗',
      'concentration': '精选',
      'has_play': '已播放',
      'colon': '：',

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


  ///     'read_aloud_poesy_for_you': '为你读诗',
  //       'concentration': '精选',

  String get readAloudPoesyForYou {
    return _localizedValue[locale.languageCode]["read_aloud_poesy_for_you"];
  }

  String get concentration {
    return _localizedValue[locale.languageCode]["concentration"];
  }

  ///  'play_count': '播放次数',
//       'colon': '：',

  String get hasPlay {
    return _localizedValue[locale.languageCode]["has_play"];
  }

  String get colon {
    return _localizedValue[locale.languageCode]["colon"];
  }

}