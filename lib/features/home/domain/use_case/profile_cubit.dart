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
      final personalData = await personalInfoRepository.getPersonalData();

      final profile = personalData['profile'] as Profile?;
      final work = personalData['work'] as Work?;
      final projects = personalData['projects'] as Projects?;
      final notes = personalData['notes'] as Notes?;

      emit(state.copyWith(
        isLoading: false,
        profile: profile,
        work: work,
        projects: projects,
        notes: notes,
      ));
    } on Exception {
      //todo: send to crashlytics
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
