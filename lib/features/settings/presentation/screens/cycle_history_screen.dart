import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/localizations/app_strings.g.dart';
import 'package:zahra/core/styles/app_colors.dart';
import 'package:zahra/core/styles/app_text_style.dart';
import 'package:zahra/core/widgets/custom_app_bar.dart';

class CycleHistoryScreen extends StatelessWidget {
  const CycleHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.cycleHistory,
        showLeading: true,
        showTrailing: false,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20.w),
        itemCount: 5,
        separatorBuilder: (context, index) => 16.verticalSpace,
        itemBuilder: (context, index) {
          return _buildCycleItem(context, index);
        },
      ),
    );
  }

  Widget _buildCycleItem(BuildContext context, int index) {
    final colors = AppColors(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: colors.shadow,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${AppStrings.cycleStart}: ${15 - index} ${AppStrings.monthName(4)}',
                style: AppTextStyles.text14w700(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  '28 ${AppStrings.days}',
                  style: AppTextStyles.text12w700(color: colors.primary),
                ),
              ),
            ],
          ),
          12.verticalSpace,
          Row(
            children: [
              _buildStat(context, AppStrings.periodLength, '5 ${AppStrings.days}'),
              30.horizontalSpace,
              _buildStat(context, AppStrings.duration, '28 ${AppStrings.days}'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(BuildContext context, String label, String value) {
    final colors = AppColors(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.text12w500(color: colors.textSecondary),
        ),
        4.verticalSpace,
        Text(
          value,
          style: AppTextStyles.text14w700(color: colors.textPrimary),
        ),
      ],
    );
  }
}
