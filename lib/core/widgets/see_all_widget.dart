import '../exports/exports.dart';

class SeeAllWidget extends StatelessWidget {
  const SeeAllWidget({
    super.key,
    required this.title,
    required this.onTab,
    this.isReviews,
  });

  final String title;
  final VoidCallback onTab;
  final bool? isReviews;

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
            style: AppTextStyles.text18w600(color: colors.textPrimary),
          ),
          TextButton(
            onPressed: onTab,
            child: Text(
              isReviews ?? false
                  ? AppStrings.reviewNow.trans
                  : AppStrings.seeAll.trans,
              style: AppTextStyles.text14w500(color: colors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
