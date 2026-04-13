import 'package:bookia/features/profile/data/repo/profile_repo.dart';

class LogoutUseCase {
  final ProfileRepo profileRepo;
  LogoutUseCase(this.profileRepo);
  Future<void> call() async {
    await profileRepo.logout();
  }
}
