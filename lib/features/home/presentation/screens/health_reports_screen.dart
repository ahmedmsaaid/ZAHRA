import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/localizations/app_strings.g.dart';
import 'package:zahra/core/styles/app_colors.dart';
import 'package:zahra/core/styles/app_text_style.dart';
import 'package:zahra/core/widgets/custom_app_bar.dart';

class HealthReportsScreen extends StatelessWidget {
  const HealthReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.healthReports,
        showLeading: true,
        showTrailing: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            _buildReportCard(
              context,
              title: AppStrings.monthlySummary,
              description: AppStrings.monthlySummaryDesc,
              icon: Icons.description_outlined,
            ),
            20.verticalSpace,
            _buildReportCard(
              context,
              title: AppStrings.fertilityTrends,
              description: AppStrings.fertilityTrendsDesc,
              icon: Icons.trending_up,
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(AppStrings.reportGenerated)),
                );
              },
              icon: const Icon(Icons.download, color: Colors.white),
              label: Text(AppStrings.downloadPDF, style: AppTextStyles.text16w700(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                minimumSize: Size(double.infinity, 50.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard(BuildContext context, {required String title, required String description, required IconData icon}) {
    final colors = AppColors(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: colors.shadow, blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: colors.primary, size: 32.sp),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.text16w700()),
                4.verticalSpace,
                Text(description, style: AppTextStyles.text14w500(color: colors.textSecondary)),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: colors.textSecondary),
        ],
      ),
    );
  }
}
