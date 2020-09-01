
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:poesy_pocket/localization/p_localizations.dart';

class PLocationsDelegate extends LocalizationsDelegate<PLocations> {

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<PLocations> load(Locale locale) {
    return SynchronousFuture<PLocations>(PLocations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate old) => false;

}