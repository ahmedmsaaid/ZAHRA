import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/localizations/app_strings.g.dart';
import 'package:zahra/core/styles/app_colors.dart';
import 'package:zahra/core/styles/app_text_style.dart';
import 'package:zahra/core/widgets/custom_app_bar.dart';

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  final List<Map<String, dynamic>> reminders = [
    {'title': AppStrings.pillReminder, 'time': const TimeOfDay(hour: 21, minute: 0), 'isActive': true, 'icon': Icons.medication},
    {'title': AppStrings.waterReminder, 'time': const TimeOfDay(hour: 10, minute: 0), 'isActive': false, 'icon': Icons.water_drop},
  ];

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.reminders,
        showLeading: true,
        showTrailing: false,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20.w),
        itemCount: reminders.length,
        separatorBuilder: (context, index) => 16.verticalSpace,
        itemBuilder: (context, index) {
          final item = reminders[index];
          return _buildReminderCard(
            context,
            index: index,
            title: item['title'] as String,
            time: item['time'] as TimeOfDay,
            icon: item['icon'] as IconData,
            isActive: item['isActive'] as bool,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewReminder(context),
        backgroundColor: colors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _addNewReminder(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(AppStrings.addReminder, style: AppTextStyles.text18w700()),
              20.verticalSpace,
              ListTile(
                leading: const Icon(Icons.alarm),
                title: Text(AppStrings.newMedication),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    reminders.add({
                      'title': '${AppStrings.medication} ${reminders.length + 1}',
                      'time': const TimeOfDay(hour: 8, minute: 0),
                      'isActive': true,
                      'icon': Icons.alarm,
                    });
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildReminderCard(
    BuildContext context, {
    required int index,
    required String title,
    required TimeOfDay time,
    required IconData icon,
    required bool isActive,
  }) {
    final colors = AppColors(context);
    return Card(
      elevation: 0,
      color: colors.cardBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: colors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: colors.primary),
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.text16w700()),
                  GestureDetector(
                    onTap: () async {
                      final picked = await showTimePicker(context: context, initialTime: time);
                      if (picked != null) {
                        setState(() {
                          reminders[index]['time'] = picked;
                        });
                      }
                    },
                    child: Text(
                      AppStrings.dailyAt(time.format(context)),
                      style: AppTextStyles.text14w500(
                        color: isActive ? colors.primary : colors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: isActive,
              onChanged: (val) => setState(() => reminders[index]['isActive'] = val),
              activeColor: colors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
