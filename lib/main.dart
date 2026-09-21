import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/generated/app_localizations.dart';
import 'core/theme/app_themes.dart';
import 'features/auth/presentation/screens/customer_login_screen.dart';

void main() {
  runApp(const TamHizmetApp());
}

class TamHizmetApp extends StatelessWidget {
  const TamHizmetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TamHizmet',
      debugShowCheckedModeBanner: false,
      
      // Merkezi Tema Yapılandırması
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,

      // Çoklu Dil Yapılandırması
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('tr', ''), // Türkçe
      ],

      // Başlangıç Ekranı (Önizleme için şimdilik doğrudan Login)
      home: const CustomerLoginScreen(),
    );
  }
}
