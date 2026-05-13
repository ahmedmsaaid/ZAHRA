import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/localizations/app_strings.g.dart';
import 'package:zahra/core/routes/app_routes.dart';
import 'package:zahra/core/styles/app_colors.dart';
import 'package:zahra/core/styles/app_text_style.dart';
import 'package:zahra/core/widgets/custom_app_bar.dart';

import 'package:zahra/features/home/presentation/widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(context);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      appBar: CustomAppBar(
        title: AppStrings.homeTitle,
        showLeading: true,
        customLeading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.calendar);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            _buildCycleCircle(context),
            30.verticalSpace,
            _buildPhaseInfo(context),
            30.verticalSpace,
            _buildInfoCards(context),
            30.verticalSpace,
            _buildDailyTip(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCycleCircle(BuildContext context) {
    final colors = AppColors(context);
    return Center(
      child: Container(
        width: 200.w,
        height: 200.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: colors.primary, width: 8.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '16',
              style: AppTextStyles.text32w700(color: colors.primary),
            ),
            Text(
              AppStrings.daysOfDays('16', '28'),
              style: AppTextStyles.text14w500(color: colors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhaseInfo(BuildContext context) {
    final colors = AppColors(context);
    return Column(
      children: [
        Text(
          AppStrings.phaseOvulation,
          style: AppTextStyles.text20w700(color: colors.textPrimary),
        ),
        8.verticalSpace,
        Text(
          AppStrings.daysRemainingText('5'),
          style: AppTextStyles.text16w500(color: colors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildInfoCards(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCard(context, AppStrings.fertileWindow, AppStrings.yes, AppColors(context).fertileGreen),
        _buildCard(context, AppStrings.nextPeriod, '12 ${AppStrings.monthName(5)}', AppColors(context).periodRed),
      ],
    );
  }

  Widget _buildCard(BuildContext context, String title, String value, Color color) {
    final colors = AppColors(context);
    return Container(
      width: 165.w,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.text14w500(color: colors.textSecondary),
          ),
          8.verticalSpace,
          Text(
            value,
            style: AppTextStyles.text18w700(color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyTip(BuildContext context) {
    final colors = AppColors(context);
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_outline, color: colors.primary),
              8.horizontalSpace,
              Text(
                AppStrings.dailyTip,
                style: AppTextStyles.text16w700(color: colors.primary),
              ),
            ],
          ),
          12.verticalSpace,
          Text(
            AppStrings.ovulationTip,
            style: AppTextStyles.text14w500(color: colors.textPrimary),
          ),
        ],
      ),
    );
  }
}
