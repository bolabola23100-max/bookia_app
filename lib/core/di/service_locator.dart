import 'package:bookia/features/auth/data/data_source/auth_remote_data_source_impl.dart';
import 'package:bookia/features/auth/data/data_source/remote_data_source.dart';
import 'package:bookia/features/auth/data/repo/auth/auth_repo.dart';
import 'package:bookia/features/auth/data/repo/auth/auth_repo_impl.dart';
import 'package:bookia/features/auth/domain/usecases/create_new_password_usecases.dart';
import 'package:bookia/features/auth/domain/usecases/forget_password_usecases.dart';
import 'package:bookia/features/auth/domain/usecases/login_usecases.dart';
import 'package:bookia/features/auth/domain/usecases/register_usecases.dart';
import 'package:bookia/features/auth/domain/usecases/verifycode_usecases.dart';
import 'package:bookia/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:bookia/features/cart/data/data_source/cart_remote_data_source_impl.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/cart/data/repo/cart_repo_impl.dart';
import 'package:bookia/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/update_cart_usecase.dart';
import 'package:bookia/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookia/features/home/data/data_source/home_remote_data_source_impl.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:bookia/features/home/data/repo/home_repo_impl.dart';
import 'package:bookia/features/home/domain/usecases/get_best_sellers_usecase.dart';
import 'package:bookia/features/home/domain/usecases/get_sliders_usecase.dart';
import 'package:bookia/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:bookia/features/wishlist/data/data_source/wishlist_remote_data_source_impl.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo_impl.dart';
import 'package:bookia/features/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:bookia/features/wishlist/domain/usecases/get_wishlist_usecase.dart';
import 'package:bookia/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:bookia/features/profile/data/data_source/profile_remote_data_source_impl.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:bookia/features/profile/data/repo/profile_repo_impl.dart';
import 'package:bookia/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:bookia/features/profile/domain/usecases/delete_profile_usecase.dart';
import 'package:bookia/features/profile/domain/usecases/get_order_history_usecase.dart';
import 'package:bookia/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:bookia/features/profile/domain/usecases/logout_usecase.dart';
import 'package:bookia/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:bookia/features/search/data/data_source/search_remote_data_source.dart';
import 'package:bookia/features/search/data/data_source/search_remote_data_source_impl.dart';
import 'package:bookia/features/search/data/repo/search_repo.dart';
import 'package:bookia/features/search/data/repo/search_repo_impl.dart';
import 'package:bookia/features/search/domain/usecases/search_books_usecase.dart';
import 'package:bookia/features/place_order/data/data_source/place_order_remote_data_source.dart';
import 'package:bookia/features/place_order/data/data_source/place_order_remote_data_source_impl.dart';
import 'package:bookia/features/place_order/data/repo/place_order_repo.dart';
import 'package:bookia/features/place_order/data/repo/place_order_repo_impl.dart';
import 'package:bookia/features/place_order/domain/usecases/get_governorates_usecase.dart';
import 'package:bookia/features/place_order/domain/usecases/place_order_usecase.dart';
import 'package:bookia/features/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<LoginUseCases>(() => LoginUseCases(getIt()));
  getIt.registerLazySingleton<RegisterUseCases>(
    () => RegisterUseCases(getIt()),
  );
  getIt.registerLazySingleton<ForgetPasswordUseCases>(
    () => ForgetPasswordUseCases(getIt()),
  );
  getIt.registerLazySingleton<VerifyCodeUseCases>(
    () => VerifyCodeUseCases(getIt()),
  );
  getIt.registerLazySingleton<CreateNewPasswordUseCases>(
    () => CreateNewPasswordUseCases(getIt()),
  );

  // Cart
  getIt.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(cartRemoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<GetCartUseCase>(() => GetCartUseCase(getIt()));
  getIt.registerLazySingleton<AddToCartUseCase>(
    () => AddToCartUseCase(getIt()),
  );
  getIt.registerLazySingleton<RemoveFromCartUseCase>(
    () => RemoveFromCartUseCase(getIt()),
  );
  getIt.registerLazySingleton<UpdateCartUseCase>(
    () => UpdateCartUseCase(getIt()),
  );

  // Home
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeRemoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<GetSlidersUseCase>(
    () => GetSlidersUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetBestSellersUseCase>(
    () => GetBestSellersUseCase(getIt()),
  );

  // Wishlist
  getIt.registerLazySingleton<WishlistRemoteDataSource>(
    () => WishlistRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<WishlistRepo>(
    () => WishlistRepoImpl(wishlistRemoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<GetWishlistUseCase>(
    () => GetWishlistUseCase(getIt()),
  );
  getIt.registerLazySingleton<AddToWishlistUseCase>(
    () => AddToWishlistUseCase(getIt()),
  );
  getIt.registerLazySingleton<RemoveFromWishlistUseCase>(
    () => RemoveFromWishlistUseCase(getIt()),
  );

  // Profile
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(profileRemoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<GetOrderHistoryUseCase>(
    () => GetOrderHistoryUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetProfileUseCase>(
    () => GetProfileUseCase(getIt()),
  );
  getIt.registerLazySingleton<UpdateProfileUseCase>(
    () => UpdateProfileUseCase(getIt()),
  );
  getIt.registerLazySingleton<ChangePasswordUseCase>(
    () => ChangePasswordUseCase(getIt()),
  );
  getIt.registerLazySingleton<DeleteProfileUseCase>(
    () => DeleteProfileUseCase(getIt()),
  );
  getIt.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(getIt()));

  // Search
  getIt.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(searchRemoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<SearchBooksUseCase>(
    () => SearchBooksUseCase(getIt()),
  );

  // Place Order
  getIt.registerLazySingleton<PlaceOrderRemoteDataSource>(
    () => PlaceOrderRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<PlaceOrderRepo>(
    () => PlaceOrderRepoImpl(placeOrderRemoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<GetGovernoratesUseCase>(
    () => GetGovernoratesUseCase(getIt()),
  );
  getIt.registerLazySingleton<PlaceOrderUseCase>(
    () => PlaceOrderUseCase(getIt()),
  );
}
