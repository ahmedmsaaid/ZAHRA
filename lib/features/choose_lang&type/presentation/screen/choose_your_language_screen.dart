import 'package:zahra/core/localizations/app_strings.g.dart';
import 'package:zahra/core/routes/app_routes.dart';
import 'package:zahra/core/styles/app_text_style.dart';
import 'package:zahra/core/utils/assets/app_icons.dart';
import 'package:zahra/core/utils/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zahra/core/localizations/localization_provider.dart';
import 'package:zahra/core/services/cach_helper/cache_helper_keys.dart';

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
              // context.pushNamed(AppRoutes.home);
            context.pop();
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
                    img: AppIcons.iraqIcon, // Keep for now or find egypt icon
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
