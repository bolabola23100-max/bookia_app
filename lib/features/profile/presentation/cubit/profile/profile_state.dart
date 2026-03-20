part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitialState extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileSuccessState extends ProfileState {
  final User user;
  ProfileSuccessState({required this.user});
}

final class ProfileErrorState extends ProfileState {}

final class UpdateProfileLoadingState extends ProfileState {}

final class UpdateProfileSuccessState extends ProfileState {
  final User user;
  UpdateProfileSuccessState({required this.user});
}

final class UpdateProfileErrorState extends ProfileState {}

final class ChangePasswordLoadingState extends ProfileState {}

final class ChangePasswordSuccessState extends ProfileState {}

final class ChangePasswordErrorState extends ProfileState {}

final class LogoutLoadingState extends ProfileState {}

final class LogoutSuccessState extends ProfileState {}

final class DeleteAccountLoadingState extends ProfileState {}

final class DeleteAccountSuccessState extends ProfileState {}

final class DeleteAccountErrorState extends ProfileState {}
