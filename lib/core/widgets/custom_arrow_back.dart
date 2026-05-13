import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/styles/app_colors.dart';
import 'package:zahra/core/utils/assets/app_icons.dart';
import 'package:zahra/core/widgets/custome_svg_image.dart';

import '../extintions/navigation_extension.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    super.key,
    this.onTap,
    this.color,
    this.isCircular = false,
  });

  final VoidCallback? onTap;
  final Color? color;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => context.pop(),
      child: Container(
        height: isCircular ? 40.h : 30.h,
        width: isCircular ? 40.w : 30.w,
        padding: EdgeInsets.symmetric(
          horizontal: isCircular ? 2.w : 7.w,
          vertical: isCircular ? 2.h : 7.h,
        ),
        decoration: BoxDecoration(
          color: color ?? AppColors(context).primaryVariant.withOpacity(0.1),
          borderRadius: BorderRadius.circular(isCircular ? 60.r : 10.r),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new,
            size: isCircular ? 20.sp : 16.sp,
            color: AppColors(context).primaryVariant,
          ),
        ),
      ),
    );
  }
}
