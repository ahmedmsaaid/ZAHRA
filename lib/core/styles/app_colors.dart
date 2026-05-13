import 'package:flutter/material.dart';

class AppColors {
  final BuildContext context;
  AppColors(this.context);

  bool get _isDark => Theme.of(context).brightness == Brightness.dark;

  // Backgrounds
  Color get background =>
      _isDark ? const Color(0xFF120718) : const Color(0xFFFFF6F8);

  Color get surface =>
      _isDark ? const Color(0xFF1F1029) : const Color(0xFFFFFFFF);

  Color get backGroundType =>
      _isDark ? const Color(0xFF1F1029) : const Color(0xFFFFFFFF);

  Color get cardBackground =>
      _isDark ? const Color(0xFF2B1638) : const Color(0xFFFFFFFF);

  Color get containerBackground =>
      _isDark ? const Color(0xFF120718) : const Color(0xFFF7EDF4);

  // Primary
  Color get primary =>
      _isDark ? const Color(0xFFFF8FA8) : const Color(0xFFFF6E8C);

  Color get primaryVariant =>
      _isDark ? const Color(0xFFFFB5C6) : const Color(0xFFFF4A73);

  Color get secondary =>
      _isDark ? const Color(0xFF4AD19F) : const Color(0xFF4AD19F);

  // Text
  Color get textPrimary =>
      _isDark ? Colors.white : const Color(0xFF2A1335);

  Color get textSecondary =>
      _isDark ? const Color(0xFFE2C8F5) : const Color(0xFF8E6C9C);

  Color get textHint =>
      _isDark ? const Color(0x80FFFFFF) : const Color(0x803C1458);

  Color get textDisabled =>
      _isDark ? const Color(0x4DFFFFFF) : const Color(0x613C1458);

  Color get onBoardingIndicator =>
      _isDark ? const Color(0xFF9E79C8) : const Color(0xFFD9B9F0);

  // Accent
  Color get accent =>
      _isDark ? const Color(0xFFFFA36C) : const Color(0xFFFF8A50);

  Color get accentGold => const Color(0xFFF2C777);

  // Status
  Color get error => const Color(0xFFC84242);
  Color get success => const Color(0xFF2E8B57);
  Color get warning => const Color(0xFFFFC107);

  // Calendar / Period
  Color get periodRed => const Color(0xFFFF4A5C);
  Color get fertileGreen => const Color(0xFF4AD19F);
  Color get todayOutline =>
      _isDark ? const Color(0xFFFFC4DD) : const Color(0xFFFF6E8C);

  // Border & Divider
  Color get border =>
      _isDark ? const Color(0xFF4B2C64) : const Color(0xFFE8D7F2);

  Color get divider =>
      _isDark ? const Color(0xFF3A244D) : const Color(0xFFEFDDF8);

  // Icons
  Color get iconPrimary => textPrimary;
  Color get iconSecondary =>
      _isDark ? const Color(0xFFBFA3D6) : const Color(0xFFBBA0D4);

  // Buttons
  Color get buttonPrimary => primary;
  Color get buttonSecondary =>
      _isDark ? const Color(0xFF2B1638) : const Color(0xFFFBE1EC);

  Color get buttonDisabled =>
      _isDark ? const Color(0xFF2A2A2A) : const Color(0xFFE0E0E0);

  // Rating
  Color get ratingActive => const Color(0xFFFFC107);
  Color get ratingInactive =>
      _isDark ? const Color(0xFF4B2C64) : const Color(0xFFE0C9F4);

  // Shimmer
  Color get shimmerBase =>
      _isDark ? const Color(0xFF2B1638) : const Color(0xFFEAD6F6);

  Color get shimmerHighlight =>
      _isDark ? const Color(0xFF3B214C) : const Color(0xFFF8ECFF);

  // Shadow
  Color get shadow => _isDark
      ? Colors.black.withOpacity(0.5)
      : Colors.black.withOpacity(0.08);

  Color get pink => const Color(0xFFFF6E8C);

  // Static
  static const white = Colors.white;
  static const gray = Color(0xffA7A7A7);
  static const black = Colors.black;
  static const transparent = Colors.transparent;

  static const gradient = LinearGradient(
    colors: [Color(0xFFFFB5C6), Color(0xFFFF6E8C)],
  );

  static const blue = Color(0xff0077FF);
}
