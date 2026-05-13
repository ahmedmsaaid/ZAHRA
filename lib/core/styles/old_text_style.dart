import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyle {
  final BuildContext context;
  late final AppColors _colors;

  AppTextStyle(this.context) {
    _colors = AppColors(context);
  }

  // ===== Headings =====
  TextStyle get heading => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
    color: _colors.textPrimary,
  );

  TextStyle get title => TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: _colors.textPrimary,
  );

  TextStyle get sectionTitle => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: _colors.textPrimary,
  );

  // ===== Body Text =====
  TextStyle get body => TextStyle(
    fontSize: 16.sp,
    height: 1.4,
    color: _colors.textPrimary,
  );

  TextStyle get bodyMedium => TextStyle(
    fontSize: 14.sp,
    height: 1.4,
    color: _colors.textPrimary,
  );

  TextStyle get bodySmall => TextStyle(
    fontSize: 12.sp,
    height: 1.4,
    color: _colors.textPrimary,
  );

  // ===== Subtitle & Secondary =====
  TextStyle get subtitle => TextStyle(
    fontSize: 16.sp,
    height: 1.4,
    color: _colors.textSecondary,
  );

  TextStyle get info => TextStyle(
    fontSize: 14.sp,
    height: 1.4,
    color: _colors.textSecondary,
  );

  TextStyle get caption => TextStyle(
    fontSize: 12.sp,
    color: _colors.textSecondary,
  );

  // ===== Hint Text =====
  TextStyle get hint => TextStyle(
    fontSize: 14.sp,
    color: _colors.textHint,
  );

  // ===== AppBar =====
  TextStyle get appBarTitle => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: _colors.textPrimary,
  );

  // ===== Button Text =====
  TextStyle get buttonText => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
    color: AppColors.white,
  );

  TextStyle get buttonTextSmall => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  TextStyle get buttonTextPrimary => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: _colors.primary,
  );

  // ===== Special / Status =====
  TextStyle get badge => TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  TextStyle get tag => TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: _colors.textSecondary,
  );

  TextStyle get error => TextStyle(
    fontSize: 13.sp,
    color: _colors.error,
  );

  TextStyle get success => TextStyle(
    fontSize: 13.sp,
    color: _colors.success,
  );

  // ===== Link Text =====
  TextStyle get link => TextStyle(
    fontSize: 14.sp,
    color: _colors.primary,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );

  // ===== Rating Text (لو استخدمتيها في الريفيوز مثلاً) =====
  TextStyle get ratingText => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: _colors.textPrimary,
  );

  TextStyle get ratingCount => TextStyle(
    fontSize: 12.sp,
    color: _colors.textSecondary,
  );
}
