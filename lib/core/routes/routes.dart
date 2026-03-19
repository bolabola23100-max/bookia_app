import 'package:bookia/features/auth/presentation/screens/authentication/login_screen.dart';
import 'package:bookia/features/auth/presentation/screens/authentication/register_screen.dart';
import 'package:bookia/features/auth/presentation/screens/verification_screens/create_new_password.dart';
import 'package:bookia/features/auth/presentation/screens/verification_screens/forgot_password_screen.dart';
import 'package:bookia/features/auth/presentation/screens/verification_screens/otp_screen.dart';
import 'package:bookia/features/auth/presentation/screens/verification_screens/password_changed.dart';
import 'package:bookia/features/details/presentation/widgets/cart_action/cubit/cart_action_cubit.dart';
import 'package:bookia/features/details/presentation/widgets/wishlist_action/cubit/wishlist_action_cubit.dart';
import 'package:bookia/features/home/data/models/best_sellers_response/product.dart';
import 'package:bookia/features/details/presentation/screens/details_screen.dart';
import 'package:bookia/features/main/main_app_screen.dart';
import 'package:bookia/features/home/presentation/screens/home_screen.dart';
import 'package:bookia/features/on_boarding_screens/screens/splash_screen.dart';
import 'package:bookia/features/on_boarding_screens/screens/welcome_screen.dart';
import 'package:bookia/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:bookia/features/profile/presentation/screens/my_orders_screen.dart';
import 'package:bookia/features/profile/presentation/screens/new_password_screen.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/place_order/presentation/cubit/place_order_cubit.dart';
import 'package:bookia/features/place_order/presentation/screens/place_order_screen.dart';
import 'package:bookia/features/cart/presentation/screens/success_screen.dart';
import 'package:bookia/features/search/presentation/screens/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splash = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgotPassword = "/forget-password";
  static const String otp = "/otp";
  static const String createNewPassword = "/create-new-password";
  static const String passwordChanged = "/password-changed";
  static const String welcome = "/welcome";
  static const String mainAppScreen = "/mainAppScreen";
  static const String home = "/home";
  static const String details = "/details";
  static const String editProfile = "/edit-profile";
  static const String newPassword = "/new-password";
  static const String myOrders = "/my-orders";
  static const String checkout = "/checkout";
  static const String success = "/success";
  static const String search = "/search";
}

GoRouter router = GoRouter(
  routes: [
    GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen()),
    GoRoute(path: Routes.login, builder: (context, state) => LoginScreen()),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: Routes.forgotPassword,
      builder: (context, state) => ForgotPasswordScreen(),
    ),
    GoRoute(
      path: Routes.otp,
      builder: (context, state) => OtpScreen(text: ""),
    ),
    GoRoute(
      path: Routes.createNewPassword,
      builder: (context, state) => CreateNewPassword(email: '', otpCode: ''),
    ),
    GoRoute(
      path: Routes.passwordChanged,
      builder: (context, state) => PasswordChanged(),
    ),
    GoRoute(path: Routes.welcome, builder: (context, state) => WelcomePage()),
    GoRoute(
      path: Routes.mainAppScreen,
      builder: (context, state) => MainAppScreen(),
    ),
    GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
    GoRoute(
      path: Routes.details,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WishlistActionCubit()),
          BlocProvider(create: (context) => CartActionCubit()),
        ],
        child: DetailsScreen(product: state.extra as Product),
      ),
    ),
    GoRoute(
      path: Routes.editProfile,
      builder: (context, state) => EditProfileScreen(),
    ),
    GoRoute(
      path: Routes.newPassword,
      builder: (context, state) => NewPasswordScreen(),
    ),
    GoRoute(
      path: Routes.myOrders,
      builder: (context, state) => MyOrdersScreen(),
    ),
    GoRoute(
      path: Routes.checkout,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CartCubit()..getCart()),
          BlocProvider(create: (context) => PlaceOrderCubit()),
        ],
        child: const PlaceOrderScreen(),
      ),
    ),
    GoRoute(path: Routes.success, builder: (context, state) => SuccessScreen()),
    GoRoute(
      path: Routes.search,
      builder: (context, state) => const SearchScreen(),
    ),
  ],
);
