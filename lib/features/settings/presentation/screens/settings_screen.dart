import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/localizations/app_strings.g.dart';
import 'package:zahra/core/localizations/localization_provider.dart';
import 'package:zahra/core/styles/app_colors.dart';
import 'package:zahra/core/styles/app_text_style.dart';
import 'package:zahra/core/theme/theme_provider.dart';
import 'package:zahra/core/widgets/custom_app_bar.dart';
import 'package:zahra/core/routes/app_routes.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(context);
    final themeMode = ref.watch(themeNotifierProvider);
    final locale = ref.watch(localizationProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.settings,
        showLeading: true,
        showTrailing: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          _buildSection(context, AppStrings.profileSettings, [
            _buildTile(context, Icons.person_outline, AppStrings.personalInformation, () {
              Navigator.pushNamed(context, AppRoutes.personalInformation);
            }),
            _buildTile(context, Icons.history, AppStrings.cycleHistory, () {
              Navigator.pushNamed(context, AppRoutes.cycleHistory);
            }),
          ]),
          20.verticalSpace,
          _buildSection(context, AppStrings.reminders, [
            _buildTile(context, Icons.notifications_active_outlined, AppStrings.reminders, () {
              Navigator.pushNamed(context, AppRoutes.reminders);
            }),
          ]),
          20.verticalSpace,
          _buildSection(context, AppStrings.appSettings, [
            _buildTile(
              context,
              Icons.language,
              AppStrings.chooseYourLanguage,
              () => Navigator.pushNamed(context, AppRoutes.chooseYourLanguageScreen),
              trailing: Text(
                locale.languageCode == 'ar' ? 'العربية' : 'English',
                style: AppTextStyles.text14w500(color: colors.textSecondary),
              ),
            ),
            _buildTile(
              context,
              Icons.dark_mode_outlined,
              AppStrings.darkMode,
              () => ref.read(themeNotifierProvider.notifier).toggleTheme(),
              trailing: Switch(
                value: themeMode == ThemeMode.dark,
                onChanged: (val) => ref.read(themeNotifierProvider.notifier).toggleTheme(),
                activeColor: colors.primary,
              ),
            ),
            _buildTile(context, Icons.lock_outline, AppStrings.privacyPolicy, () {}),
          ]),
          40.verticalSpace,
          TextButton(
            onPressed: () {},
            child: Text(
              AppStrings.deleteAccount,
              style: AppTextStyles.text14w500(color: colors.error),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w, bottom: 8.h),
          child: Text(
            title,
            style: AppTextStyles.text16w700(color: AppColors(context).primary),
          ),
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          color: AppColors(context).cardBackground,
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildTile(BuildContext context, IconData icon, String title, VoidCallback onTap, {Widget? trailing}) {
    return ListTile(
      leading: Icon(icon, color: AppColors(context).primary),
      title: Text(title, style: AppTextStyles.text14w500()),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
