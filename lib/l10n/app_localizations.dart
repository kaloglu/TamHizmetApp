import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('tr')];

  /// No description provided for @customerPortal.
  ///
  /// In tr, this message translates to:
  /// **'MÜŞTERİ PORTALI'**
  String get customerPortal;

  /// No description provided for @customerAppTitle.
  ///
  /// In tr, this message translates to:
  /// **'TAM HİZMET AL'**
  String get customerAppTitle;

  /// No description provided for @customerLoginTitle.
  ///
  /// In tr, this message translates to:
  /// **'Müşteri Giriş Yap'**
  String get customerLoginTitle;

  /// No description provided for @welcomeTitle.
  ///
  /// In tr, this message translates to:
  /// **'Eviniz ve işiniz için aradığınız uzmanlar tek dokunuşla'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Dakikalar içinde güvenilir ustalara ulaşın, şeffaf fiyatlarla teklif toplayın.'**
  String get welcomeSubtitle;

  /// No description provided for @loginAndExplore.
  ///
  /// In tr, this message translates to:
  /// **'GİRİŞ YAP & KEŞFET'**
  String get loginAndExplore;

  /// No description provided for @whyTamHizmet.
  ///
  /// In tr, this message translates to:
  /// **'NEDEN TAM HİZMET AL?'**
  String get whyTamHizmet;

  /// No description provided for @feature1Title.
  ///
  /// In tr, this message translates to:
  /// **'Binlerce Onaylı Usta'**
  String get feature1Title;

  /// No description provided for @feature1Desc.
  ///
  /// In tr, this message translates to:
  /// **'Elektrik, tesisat, temizlik ve tadilatta belgeli uzmanlardan tamamen ücretsiz teklif alın.'**
  String get feature1Desc;

  /// No description provided for @feature2Title.
  ///
  /// In tr, this message translates to:
  /// **'%100 TamHizmet Garantisi'**
  String get feature2Title;

  /// No description provided for @feature2Desc.
  ///
  /// In tr, this message translates to:
  /// **'Güvenli havuz ödeme modeli; iş başarıyla bitip siz onaylamadan ustanıza ödeme aktarılmaz.'**
  String get feature2Desc;

  /// No description provided for @feature3Title.
  ///
  /// In tr, this message translates to:
  /// **'Doğrulanmış Müşteri Yorumları'**
  String get feature3Title;

  /// No description provided for @feature3Desc.
  ///
  /// In tr, this message translates to:
  /// **'Yalnızca hizmeti tamamlamış gerçek komşularınızın şeffaf değerlendirmeleri ve puanları.'**
  String get feature3Desc;

  /// No description provided for @satisfactionRate.
  ///
  /// In tr, this message translates to:
  /// **'4.9 / 5.0 Memnuniyet'**
  String get satisfactionRate;

  /// No description provided for @completedJobs.
  ///
  /// In tr, this message translates to:
  /// **'Son 30 günde 12.400+ tamamlanan iş'**
  String get completedJobs;

  /// No description provided for @googleSignIn.
  ///
  /// In tr, this message translates to:
  /// **'Google ile Giriş Yap'**
  String get googleSignIn;

  /// No description provided for @googleSignInSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Hızlı, tek tıkla ve şifresiz güvenli giriş'**
  String get googleSignInSubtitle;

  /// No description provided for @sslSecure.
  ///
  /// In tr, this message translates to:
  /// **'256-Bit SSL'**
  String get sslSecure;

  /// No description provided for @kvkkSecure.
  ///
  /// In tr, this message translates to:
  /// **'KVKK Güvencesi'**
  String get kvkkSecure;

  /// No description provided for @termsAndPrivacy.
  ///
  /// In tr, this message translates to:
  /// **'Devam ederek Kullanım Koşulları\'nı ve Gizlilik Politikası\'nı onaylamış olursunuz.'**
  String get termsAndPrivacy;

  /// No description provided for @terms.
  ///
  /// In tr, this message translates to:
  /// **'Kullanım Koşulları'**
  String get terms;

  /// No description provided for @privacy.
  ///
  /// In tr, this message translates to:
  /// **'Gizlilik Politikası'**
  String get privacy;

  /// No description provided for @providerCtaTitle.
  ///
  /// In tr, this message translates to:
  /// **'Usta veya Hizmet Veren misiniz?'**
  String get providerCtaTitle;

  /// No description provided for @providerCtaSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'İş fırsatlarına teklif vermek için giriş yapın'**
  String get providerCtaSubtitle;

  /// No description provided for @providerCtaAction.
  ///
  /// In tr, this message translates to:
  /// **'Tam Hizmet Ver'**
  String get providerCtaAction;

  /// No description provided for @zeroCommission.
  ///
  /// In tr, this message translates to:
  /// **'Sıfır Komisyon • Doğrudan İletişim'**
  String get zeroCommission;

  /// No description provided for @welcomeBack.
  ///
  /// In tr, this message translates to:
  /// **'Tam Hizmet Al\'a Hoş Geldiniz'**
  String get welcomeBack;

  /// No description provided for @webLoginDesc.
  ///
  /// In tr, this message translates to:
  /// **'Şifresiz, SMS onay kodu beklemeden doğrudan Google hesabınızla saniyeler içinde oturum açın.'**
  String get webLoginDesc;

  /// No description provided for @secureSession.
  ///
  /// In tr, this message translates to:
  /// **'Güvenli Oturum'**
  String get secureSession;

  /// No description provided for @noSpam.
  ///
  /// In tr, this message translates to:
  /// **'Spamsız'**
  String get noSpam;

  /// No description provided for @kvkkProtected.
  ///
  /// In tr, this message translates to:
  /// **'KVKK Korumalı'**
  String get kvkkProtected;

  /// No description provided for @turkeyWide.
  ///
  /// In tr, this message translates to:
  /// **'Türkiye geneli 81 ilde serbest pazaryeri'**
  String get turkeyWide;

  /// No description provided for @helpCenter.
  ///
  /// In tr, this message translates to:
  /// **'Yardım Merkezi'**
  String get helpCenter;

  /// No description provided for @howItWorks.
  ///
  /// In tr, this message translates to:
  /// **'Nasıl Çalışır?'**
  String get howItWorks;

  /// No description provided for @securityStandards.
  ///
  /// In tr, this message translates to:
  /// **'Güvenlik Standartları'**
  String get securityStandards;

  /// No description provided for @liveFeedActive.
  ///
  /// In tr, this message translates to:
  /// **'Canlı Talep Akışı Aktif'**
  String get liveFeedActive;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
