import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:style/core/constans/app_localizations_constants.dart';
import 'package:style/core/routes/app_router.dart';
import 'package:style/core/routes/app_routes.dart';
import 'package:style/core/services/cach_helper/cache_helper.dart';
import 'package:style/core/theme/app_theme.dart';
import 'package:style/core/theme/theme_provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await EasyLocalization.ensureInitialized();

  final cacheHelper = CacheHelper();
  await cacheHelper.init();

  runApp(
    EasyLocalization(
      supportedLocales: AppLocalizationsConstants().supportedLocales,
      path: AppLocalizationsConstants().path,
      saveLocale: false,
      child: const ProviderScope(child: WasilTaskApp()),
    ),
  );
}

class WasilTaskApp extends ConsumerWidget {
  const WasilTaskApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);

    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRoutes.splash,
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        themeMode: themeMode,
        themeAnimationDuration: const Duration(milliseconds: 300),
        themeAnimationCurve: Curves.easeInOut,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}

///dart tools/generate_app_strings_easy.dart
