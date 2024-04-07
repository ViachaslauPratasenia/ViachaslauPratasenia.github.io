import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/core/data/repositories/personal_info_repository.dart';
import 'package:personal_website/features/home/data/developer_profile_mapper.dart';
import 'package:personal_website/features/home/data/repository/local_profile_repository.dart';
import 'package:personal_website/features/home/data/repository/remote_profile_repository.dart';
import 'package:personal_website/features/home/domain/use_case/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final RemoteProfileRepository remoteProfileRepository;
  final LocalProfileRepository localProfileRepository;

  final PersonalInfoRepository personalInfoRepository;

  ProfileCubit({
    required this.remoteProfileRepository,
    required this.localProfileRepository,
    required this.personalInfoRepository,
  }) : super(ProfileState.initial()) {
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      var developerProfile = await remoteProfileRepository.getProfile();
      developerProfile ??= await localProfileRepository.loadProfile();

      if (developerProfile != null) {
        emit(state.copyWith(developerProfile: DeveloperProfileMapper.map(developerProfile)));
      }

      var personalInfo = await personalInfoRepository.getProfileInfo();
      var workInfo = await personalInfoRepository.getWorkInfo();
      var projectInfo = await personalInfoRepository.getProjectInfo();
      var blogInfo = await personalInfoRepository.getBlogPostsInfo();
      print(personalInfo);
    } on Exception {
      //todo: send to crashlytics
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
