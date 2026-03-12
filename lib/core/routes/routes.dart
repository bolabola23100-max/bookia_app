import 'package:bookia/features/auth/presentation/screens/authentication/login_screen.dart';
import 'package:bookia/features/auth/presentation/screens/authentication/register_screen.dart';
import 'package:bookia/features/auth/presentation/screens/verification_screens/create_new_password.dart';
import 'package:bookia/features/auth/presentation/screens/verification_screens/forgot_password_screen.dart';
import 'package:bookia/features/auth/presentation/screens/verification_screens/otp_screen.dart';
import 'package:bookia/features/auth/presentation/screens/verification_screens/password_changed.dart';
import 'package:bookia/features/home/data/models/best_sellers_response/product.dart';
import 'package:bookia/features/home/presentation/screens/book_details/details_screen.dart';
import 'package:bookia/features/main/main_app_screen.dart';
import 'package:bookia/features/home/presentation/screens/home_screen.dart';
import 'package:bookia/features/on_boarding_screens/screens/splash_screen.dart';
import 'package:bookia/features/on_boarding_screens/screens/welcome_screen.dart';
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
      builder: (context, state) =>
          DetailsScreen(product: state.extra as Product),
    ),
  ],
);
