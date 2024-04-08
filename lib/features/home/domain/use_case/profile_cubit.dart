import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/core/data/models/blog_post/notes.dart';
import 'package:personal_website/core/data/models/profile/profile.dart';
import 'package:personal_website/core/data/models/project/project.dart';
import 'package:personal_website/core/data/models/work/work.dart';
import 'package:personal_website/core/data/repositories/personal_info_repository.dart';
import 'package:personal_website/features/home/domain/use_case/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final PersonalInfoRepository personalInfoRepository;

  ProfileCubit({required this.personalInfoRepository}) : super(ProfileState.initial()) {
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      await Future.wait([
        personalInfoRepository.getProfileInfo(),
        personalInfoRepository.getWorkInfo(),
        personalInfoRepository.getProjectInfo(),
        personalInfoRepository.getNotesInfo()
      ]).then((value) {
        final profileInfo = value[0] as Profile;
        final workInfo = value[1] as Work;
        final projectsInfo = value[2] as Projects;
        final notesInfo = value[3] as Notes;

        emit(state.copyWith(
          isLoading: false,
          profile: profileInfo,
          work: workInfo,
          projects: projectsInfo,
          notes: notesInfo,
        ));
      });
    } on Exception {
      //todo: send to crashlytics
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
