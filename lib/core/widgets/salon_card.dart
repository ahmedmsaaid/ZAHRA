import 'package:style/features/user/offer_details/presentation/screens/offer_details_screen.dart';

import '../exports/exports.dart';
import '../models/salon_model.dart';

class SalonCard extends StatelessWidget {
  final SalonModel salon;

  const SalonCard({super.key, required this.salon});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(context);

    return GestureDetector(
      onTap: () {
        final OferDetailsModel offer = OferDetailsModel(
          image: salon.imageUrl,
          title: salon.name,
          price: "150 دينار",

          description: "صالون حلاقه رجالي",
          about: salon.distance.toString(),
        );
        context.pushNamed(AppRoutes.offerDetails, arguments: {"offer": offer});
      },
      child: Container(
        width: 150.w,

        decoration: BoxDecoration(
          color: colors.cardBackground,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                  child: CustomNetworkImage.rectangle(
                    imageUrl: salon.imageUrl,
                    height: 100.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8.h,
                  right: 8.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: colors.cardBackground,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, size: 12.sp, color: Colors.amber),
                            2.horizontalSpace,
                            Text(
                              salon.rating.toString(),
                              style: AppTextStyles.text10w500(
                                color: colors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            4.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Row(
                children: [
                  Text(
                    salon.name,
                    style: AppTextStyles.text12w500(color: colors.textPrimary),
                    textDirection: TextDirection.rtl,
                  ),
                  Spacer(),
                  Text(
                    '${salon.distance} ${AppStrings.kmAway.trans}',
                    style: AppTextStyles.text10w400(
                      color: colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (salon.address != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Text(
                  salon.address!,
                  style: AppTextStyles.text10w400(color: colors.textHint),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
