// lib/core/routes/app_router.dart
import 'package:zahra/features/settings/presentation/screens/cycle_history_screen.dart';
import 'package:zahra/features/settings/presentation/screens/personal_information_screen.dart';
import 'package:zahra/features/home/presentation/screens/health_reports_screen.dart';
import 'package:zahra/features/reminders/presentation/screens/reminders_screen.dart';
import 'package:zahra/features/settings/presentation/screens/settings_screen.dart';
import 'package:zahra/features/calendar/presentation/screens/calendar_screen.dart';
import 'package:zahra/features/home/presentation/screens/home_screen.dart';
import 'package:zahra/features/on_boarding/screen/on_boarding_screen.dart';
import 'package:zahra/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:zahra/core/routes/app_routes.dart';
import 'package:zahra/features/auth/presentation/screens/login_screen.dart';
import 'package:zahra/features/choose_lang&type/presentation/screen/choose_user_type_screen.dart';
import 'package:zahra/features/choose_lang&type/presentation/screen/choose_your_language_screen.dart';
import 'package:zahra/features/notifications/presentation/screens/notifications_screen.dart';

import '../../features/auth/domain/business_type.dart';
import '../../features/auth/presentation/screens/about_type_screen.dart';
import '../../features/auth/presentation/screens/create_new_password_screen.dart';
import '../../features/auth/presentation/screens/forget_password_screen.dart';
import '../../features/auth/presentation/screens/otp_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoarding:
        return _buildAnimatedRoute(const OnboardingScreen(), settings);
      case AppRoutes.splash:
        return _buildAnimatedRoute(const SplashScreen(), settings);
      case AppRoutes.chooseYourLanguageScreen:
        return _buildAnimatedRoute(const ChooseYourLanguageScreen(), settings);
      case AppRoutes.chooseUserTypeScreen:
        return _buildAnimatedRoute(ChooseUserTypeScreen(), settings);
      case AppRoutes.loginScreen:
        final bool isUser = (settings.arguments as bool?) ?? false;
        return _buildAnimatedRoute(LoginScreen(isUser: isUser), settings);
      case AppRoutes.chooseYourLanguageScreen:
        return _buildAnimatedRoute(const ChooseYourLanguageScreen(), settings);
      case AppRoutes.forgetPasswordScreen:
        final bool isUser = (settings.arguments as bool?) ?? false;
        return _buildAnimatedRoute(
          ForgetPasswordScreen(isUser: isUser),
          settings,
        );
      case AppRoutes.otpScreen:
        final bool isUser = (settings.arguments as bool?) ?? false;
        return _buildAnimatedRoute(OtpScreen(isUser: isUser), settings);
      case AppRoutes.createNewPasswordScreen:
        final bool isUser = (settings.arguments as bool?) ?? false;
        return MaterialPageRoute(
          builder: (_) => CreateNewPasswordScreen(isUser: isUser),
        );
      case AppRoutes.registerScreen:
        final bool isUser = (settings.arguments as bool?) ?? false;
        return _buildAnimatedRoute(RegisterScreen(isUser: isUser), settings);
      case AppRoutes.home:
        return _buildAnimatedRoute(const HomeScreen(), settings);
      case AppRoutes.calendar:
        return _buildAnimatedRoute(const CalendarScreen(), settings);
      case AppRoutes.settings:
        return _buildAnimatedRoute(const SettingsScreen(), settings);
      case AppRoutes.reminders:
        return _buildAnimatedRoute(const RemindersScreen(), settings);
      case AppRoutes.healthReports:
        return _buildAnimatedRoute(const HealthReportsScreen(), settings);
      case AppRoutes.personalInformation:
        return _buildAnimatedRoute(const PersonalInformationScreen(), settings);
      case AppRoutes.cycleHistory:
        return _buildAnimatedRoute(const CycleHistoryScreen(), settings);
      case AppRoutes.completeRegisterScreen:
        return _buildAnimatedRoute(
          AboutTypeScreen(businessType: BusinessType.salon),
          settings,
        );


      default:
        return _buildAnimatedRoute(
          const Scaffold(body: Center(child: Text('Page not found'))),
          settings,
        );
    }
  }

  static PageRouteBuilder _buildAnimatedRoute(
    Widget page,
    RouteSettings settings,
  ) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page, // ✅ Riverpod مش محتاج wrapper
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position:
                Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                ),
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
