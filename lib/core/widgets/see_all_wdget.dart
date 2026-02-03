import '../exports/exports.dart';

class SowAllWidget extends StatelessWidget {
  const SowAllWidget({super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.text14w600(color: colors.textPrimary),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              AppStrings.viewAll.trans,
              style: AppTextStyles.text12w400(color: colors.primaryVariant),
            ),
          ),
        ],
      ),
    );
  }
}
