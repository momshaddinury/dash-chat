import 'package:dash_chat_app/features/profile/profile_model.dart';
import 'package:dash_chat_app/features/profile/profile_repository.dart';

class ProfileViewModel {
  final ProfileRepository _repo = ProfileRepository();
  ProfileModel get getUserProfile {
    return _repo.demoProfile;
  }
}
