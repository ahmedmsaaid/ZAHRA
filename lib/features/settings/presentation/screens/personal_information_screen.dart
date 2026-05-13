import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/localizations/app_strings.g.dart';
import 'package:zahra/core/styles/app_colors.dart';
import 'package:zahra/core/styles/app_text_style.dart';
import 'package:zahra/core/widgets/custom_app_bar.dart';
import 'package:zahra/core/widgets/custom_text_field.dart';
import 'package:zahra/core/widgets/custom_button.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.personalInformation,
        showLeading: true,
        showTrailing: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            _buildProfileImage(context),
            30.verticalSpace,
            CustomTextField(
              hintText: AppStrings.fullName,
              prefixIcon: Icon(Icons.person_outline, color: colors.primary),
            ),
            20.verticalSpace,
            CustomTextField(
              hintText: AppStrings.email,
              prefixIcon: Icon(Icons.email_outlined, color: colors.primary),
            ),
            20.verticalSpace,
            CustomTextField(
              hintText: AppStrings.phoneNumber,
              prefixIcon: Icon(Icons.phone_outlined, color: colors.primary),
            ),
            20.verticalSpace,
            CustomTextField(
              hintText: AppStrings.country,
              prefixIcon: Icon(Icons.location_on_outlined, color: colors.primary),
            ),
            40.verticalSpace,
            CustomAppButton(
              text: AppStrings.saveChanges,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(AppStrings.dataSavedSuccessfully)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    final colors = AppColors(context);
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundColor: colors.primary.withOpacity(0.1),
            child: Icon(Icons.person, size: 60.sp, color: colors.primary),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: colors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: colors.background, width: 2),
              ),
              child: Icon(Icons.camera_alt, size: 16.sp, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
