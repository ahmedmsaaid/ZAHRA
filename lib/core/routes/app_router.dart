// lib/core/routes/app_router.dart
import 'package:flutter/material.dart';
import 'package:style/core/routes/app_routes.dart';
import 'package:style/features/auth/presentation/screens/login_screen.dart';
import 'package:style/features/choose_lang&type/presentation/screen/choose_user_type_screen.dart';
import 'package:style/features/choose_lang&type/presentation/screen/choose_your_language_screen.dart';
import 'package:style/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:style/features/on_boarding/screen/on_boarding_screen.dart';
import 'package:style/features/service_provider/bottom_navigation/presentation/screens/btn_nav_screen.dart';
import 'package:style/features/service_provider/provider_profile/presentation/screens/offer_form_screen.dart';
import 'package:style/features/service_provider/provider_profile/presentation/screens/provider_profile_screen.dart';
import 'package:style/features/service_provider/provider_profile/presentation/widgets/send_review_screen.dart';
import 'package:style/features/service_provider/settings/presentation/screens/about_place_screen.dart';
import 'package:style/features/service_provider/settings/presentation/screens/account_settings_screen.dart';
import 'package:style/features/service_provider/settings/presentation/screens/contact_us_screen.dart';
import 'package:style/features/service_provider/settings/presentation/screens/packages_screen.dart';
import 'package:style/features/service_provider/settings/presentation/screens/privacy_policy_screen.dart';
import 'package:style/features/service_provider/settings/presentation/screens/settings_screen.dart';
import 'package:style/features/splash/presentation/screens/splash_screen.dart';
import 'package:style/features/user/home/presentation/screens/most_revers_screen.dart';
import 'package:style/features/user/offer_details/presentation/screens/offer_details_screen.dart';
import 'package:style/features/user/user_bottom_navigation/presentation/screens/btn_nav_screen.dart';

import '../../features/auth/domain/business_type.dart';
import '../../features/auth/presentation/screens/about_type_screen.dart';
import '../../features/auth/presentation/screens/create_new_password_screen.dart';
import '../../features/auth/presentation/screens/forget_password_screen.dart';
import '../../features/auth/presentation/screens/otp_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/chat/presentation/screens/chat_details_screen.dart';
import '../../features/chat/presentation/screens/chats_screen.dart';
import '../../features/chat/presentation/screens/user_profile_screen.dart';
import '../../features/community/presentation/screen/community_home_screen.dart';
import '../../features/store/presentation/screens/add_and_update_product_screen.dart';
import '../../features/store/presentation/screens/cart_screen.dart';
import '../../features/store/presentation/screens/order_details_screen.dart';
import '../../features/store/presentation/screens/product_details_screen.dart';
import '../../features/store/presentation/screens/provider_product_details_screen.dart';
import '../../features/store/presentation/screens/provider_store_screen.dart';
import '../../features/store/presentation/screens/store_screen.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoarding:
        return _buildAnimatedRoute(const OnboardingScreen(), settings);
      case AppRoutes.splash:
        return _buildAnimatedRoute(const SplashScreen(), settings);
      case AppRoutes.chooseYourLanguageScreen:
        return _buildAnimatedRoute(const ChooseYourLanguageScreen(), settings);
      case AppRoutes.chooseUserTypeScreen:
        return _buildAnimatedRoute(ChooseUserTypeScreen(), settings);
      case AppRoutes.loginScreen:
        final bool isUser = (settings.arguments as bool?) ?? false;
        return _buildAnimatedRoute(LoginScreen(isUser: isUser), settings);
      case AppRoutes.chooseYourLanguageScreen:
        return _buildAnimatedRoute(const ChooseYourLanguageScreen(), settings);
      case AppRoutes.forgetPasswordScreen:
        final bool isUser = (settings.arguments as bool?) ?? false;
        return _buildAnimatedRoute(
          ForgetPasswordScreen(isUser: isUser),
          settings,
        );
      case AppRoutes.otpScreen:
        final bool isUser = (settings.arguments as bool?) ?? false;
        return _buildAnimatedRoute(OtpScreen(isUser: isUser), settings);
      case AppRoutes.createNewPasswordScreen:
        final bool isUser = (settings.arguments as bool?) ?? false;
        return MaterialPageRoute(
          builder: (_) => CreateNewPasswordScreen(isUser: isUser),
        );
      case AppRoutes.registerScreen:
        final bool isUser = (settings.arguments as bool?) ?? false;
        return _buildAnimatedRoute(RegisterScreen(isUser: isUser), settings);
      case AppRoutes.completeRegisterScreen:
        return _buildAnimatedRoute(
          AboutTypeScreen(businessType: BusinessType.salon),
          settings,
        );
      case AppRoutes.providerNav:
        return _buildAnimatedRoute(ProviderNavScreen(), settings);
      case AppRoutes.userNav:
        return _buildAnimatedRoute(UserNavScreen(), settings);
      case AppRoutes.mostRevers:
        return _buildAnimatedRoute(MostReversScreen(), settings);
      case AppRoutes.offerDetails:
        return _buildAnimatedRoute(
          OfferDetailsScreen(
            offer: (settings.arguments as Map<String, dynamic>)["offer"],
          ),
          settings,
        );

      case AppRoutes.providerProfile:
        return _buildAnimatedRoute(
          ProviderProfileScreen(
            isUser: (settings.arguments as Map<String, dynamic>)["isUser"],
          ),
          settings,
        );
      case AppRoutes.offerForm:
        return _buildAnimatedRoute(OfferFormScreen(isEdit: true), settings);
      case AppRoutes.contactUs:
        return _buildAnimatedRoute(ContactUsScreen(), settings);

      case AppRoutes.settings:
        return _buildAnimatedRoute(
          SettingsScreen(
            isUser: (settings.arguments as Map<String, dynamic>)["isUser"],
          ),
          settings,
        );
      case AppRoutes.aboutPlace:
        return _buildAnimatedRoute(AboutPlaceScreen(), settings);
      case AppRoutes.privacyPolicy:
        return _buildAnimatedRoute(PrivacyPolicyScreen(), settings);

      case AppRoutes.packages:
        return _buildAnimatedRoute(PackagesScreen(), settings);
      case AppRoutes.accountSettings:
        return _buildAnimatedRoute(AccountSettingsScreen(), settings);

      case AppRoutes.sendReview:
        return _buildAnimatedRoute(SendReviewScreen(), settings);
      case AppRoutes.notifications:
        return _buildAnimatedRoute(const NotificationsScreen(), settings);
      case AppRoutes.communityScreen:
        return _buildAnimatedRoute(const CommunityHomeScreen(), settings);
      case AppRoutes.providerStoreScreen:
        return _buildAnimatedRoute(const ProviderStoreScreen(), settings);
      case AppRoutes.StoreScreen:
        return _buildAnimatedRoute(const StoreScreen(), settings);
      case AppRoutes.providerProductDetailsScreen:
        return _buildAnimatedRoute(
          const ProviderProductDetailsScreen(),
          settings,
        );
      case AppRoutes.orderDetailsScreen:
        return _buildAnimatedRoute(const OrderDetailsScreen(), settings);
      case AppRoutes.addAndUpdateProductScreen:
        final bool? isAdd = settings.arguments as bool?;
        return _buildAnimatedRoute(
          AddAndUpdateProductScreen(isAdd: isAdd ?? true),
          settings,
        );
      case AppRoutes.storeProductDetailsScreen:
        final bool? isCart = settings.arguments as bool?;
        return _buildAnimatedRoute(
          StoreProductDetailsScreen(isCart: isCart ?? false),
          settings,
        );

      case AppRoutes.profileScreen:
        return _buildAnimatedRoute(const UserProfileScreen(), settings);
      case AppRoutes.chatsScreen:
        return _buildAnimatedRoute(const ChatsScreen(), settings);
      case AppRoutes.chatDetailsScreen:
        return _buildAnimatedRoute(const ChatDetailsScreen(), settings);
      case AppRoutes.cartScreen:
        return _buildAnimatedRoute(const CartScreen(), settings);
      default:
        return _buildAnimatedRoute(
          const Scaffold(body: Center(child: Text('Page not found'))),
          settings,
        );
    }
  }

  static PageRouteBuilder _buildAnimatedRoute(
    Widget page,
    RouteSettings settings,
  ) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page, // ✅ Riverpod مش محتاج wrapper
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position:
                Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                ),
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
