import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/localizations/app_strings.g.dart';
import 'package:zahra/core/styles/app_colors.dart';
import 'package:zahra/core/styles/app_text_style.dart';
import 'package:zahra/core/widgets/custom_app_bar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final Set<String> selectedSymptoms = {};
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.calendar,
        showLeading: true,
        showTrailing: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCalendarView(context),
            30.verticalSpace,
            Text(
              AppStrings.logSymptomsAndMood,
              style: AppTextStyles.text20w700(color: colors.textPrimary),
            ),
            16.verticalSpace,
            _buildSymptomGrid(context),
            40.verticalSpace,
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppStrings.symptomsSaved('${selectedDate.day}/${selectedDate.month}'))),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
                ),
                child: Text(AppStrings.saveSymptoms, style: AppTextStyles.text16w700(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarView(BuildContext context) {
    final colors = AppColors(context);
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    final firstDayOfMonth = DateTime(now.year, now.month, 1).weekday;

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
                '${AppStrings.monthName(now.month)} ${now.year}',
                style: AppTextStyles.text18w700(color: colors.primary),
              ),
              Row(
                children: [
                  Icon(Icons.chevron_left, color: colors.primary),
                  20.horizontalSpace,
                  Icon(Icons.chevron_right, color: colors.primary),
                ],
              ),
            ],
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                .map((d) => Text(d, style: AppTextStyles.text14w700(color: colors.textSecondary)))
                .toList(),
          ),
          10.verticalSpace,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
            itemCount: daysInMonth + (firstDayOfMonth % 7),
            itemBuilder: (context, index) {
              final dayOffset = (firstDayOfMonth % 7);
              if (index < dayOffset) return const SizedBox.shrink();
              final day = index - dayOffset + 1;
              final isToday = day == now.day;
              final isSelected = day == selectedDate.day;

              return GestureDetector(
                onTap: () => setState(() => selectedDate = DateTime(now.year, now.month, day)),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? colors.primary : Colors.transparent,
                    shape: BoxShape.circle,
                    border: isToday ? Border.all(color: colors.primary, width: 2) : null,
                  ),
                  child: Text(
                    day.toString(),
                    style: AppTextStyles.text14w500(
                      color: isSelected ? Colors.white : (isToday ? colors.primary : colors.textPrimary),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSymptomGrid(BuildContext context) {
    final symptoms = [
      {'name': AppStrings.symptomCramps, 'icon': Icons.flash_on},
      {'name': AppStrings.symptomHeadache, 'icon': Icons.sick},
      {'name': AppStrings.symptomFatigue, 'icon': Icons.battery_alert},
      {'name': AppStrings.symptomBloating, 'icon': Icons.waves},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.w,
        childAspectRatio: 2.5,
      ),
      itemCount: symptoms.length,
      itemBuilder: (context, index) {
        final name = symptoms[index]['name'] as String;
        final icon = symptoms[index]['icon'] as IconData;
        final isSelected = selectedSymptoms.contains(name);

        return _buildSymptomItem(context, name, icon, isSelected);
      },
    );
  }

  Widget _buildSymptomItem(BuildContext context, String name, IconData icon, bool isSelected) {
    final colors = AppColors(context);
    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedSymptoms.remove(name);
          } else {
            selectedSymptoms.add(name);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: isSelected ? colors.primary.withOpacity(0.1) : colors.containerBackground,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? colors.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? colors.primary : colors.textSecondary, size: 24.sp),
            12.horizontalSpace,
            Text(
              name,
              style: AppTextStyles.text14w500(
                color: isSelected ? colors.primary : colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
