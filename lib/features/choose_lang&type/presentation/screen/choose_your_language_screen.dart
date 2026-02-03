import 'package:easy_localization/easy_localization.dart';
import 'package:style/core/localizations/localization_provider.dart';
import 'package:style/core/services/cach_helper/cache_helper_keys.dart';

import '../../../../core/exports/exports.dart';
import '../../../../core/services/cach_helper/cache_helper.dart';
import '../widgets/custom_language_card.dart';

class ChooseYourLanguageScreen extends StatelessWidget {
  const ChooseYourLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final language = ref.watch(localizationProvider.notifier);
            ref.listen(localizationProvider, (previous, next) async {
              print('previous: $previous');
              print('next: $next');
              context.setLocale(next);
              await CacheHelper.setBool(CacheKeys.isFirstTime, false);
              context.pushNamed(AppRoutes.chooseUserTypeScreen);
            });

            return Center(
              child: Column(
                children: [
                  29.verticalSpace,
                  Text(
                    AppStrings.chooseYourLanguage,
                    style: AppTextStyles.text20w700(),
                  ),
                  16.verticalSpace,
                  CustomChooseCard(
                    txt: 'عربي',
                    img: AppIcons.iraqIcon,
                    onTap: () {
                      language.changeToArabic();
                    },
                  ),
                  CustomChooseCard(
                    txt: 'English',
                    img: AppIcons.ukIcon,
                    onTap: () {
                      language.changeToEnglish();
                    },
                  ),
                  CustomChooseCard(
                    txt: 'Turkish',
                    img: AppIcons.turkyIcon,
                    onTap: () {
                      language.changeToTurkish();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
