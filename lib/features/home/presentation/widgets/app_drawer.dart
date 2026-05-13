import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/localizations/app_strings.g.dart';
import 'package:zahra/core/styles/app_colors.dart';
import 'package:zahra/core/styles/app_text_style.dart';
import 'package:zahra/core/routes/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(context);

    return Drawer(
      backgroundColor: colors.background,
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  context,
                  icon: Icons.home_outlined,
                  title: AppStrings.home,
                  onTap: () => Navigator.pop(context),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.calendar_month_outlined,
                  title: AppStrings.calendar,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.calendar),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.notifications_active_outlined,
                  title: AppStrings.reminders,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.reminders);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.bar_chart_outlined,
                  title: AppStrings.healthReports,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.healthReports);
                  },
                ),
                const Divider(),
                _buildDrawerItem(
                  context,
                  icon: Icons.settings_outlined,
                  title: AppStrings.settings,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.settings);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.help_outline,
                  title: AppStrings.helpCenter,
                  onTap: () {},
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.logout,
                  title: AppStrings.logout,
                  color: colors.error,
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.loginScreen,
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colors = AppColors(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20.h,
        bottom: 20.h,
        left: 20.w,
        right: 20.w,
      ),
      decoration: BoxDecoration(
        color: colors.primary.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 35.r,
            backgroundColor: colors.primary,
            child: Icon(Icons.person, size: 40.sp, color: Colors.white),
          ),
          15.verticalSpace,
          Text(
            AppStrings.userName,
            style: AppTextStyles.text18w700(color: colors.textPrimary),
          ),
          5.verticalSpace,
          Text(
            'user@zahra.com',
            style: AppTextStyles.text14w500(color: colors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    final colors = AppColors(context);
    return ListTile(
      leading: Icon(icon, color: color ?? colors.primary),
      title: Text(
        title,
        style: AppTextStyles.text16w500(color: color ?? colors.textPrimary),
      ),
      onTap: onTap,
    );
  }
}
