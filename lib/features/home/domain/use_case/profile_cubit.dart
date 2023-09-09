import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/features/home/data/repository/local_profile_repository.dart';
import 'package:personal_website/features/home/data/repository/remote_profile_repository.dart';
import 'package:personal_website/features/home/domain/use_case/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final RemoteProfileRepository remoteProfileRepository;
  final LocalProfileRepository localProfileRepository;

  ProfileCubit({
    required this.remoteProfileRepository,
    required this.localProfileRepository,
  }) : super(ProfileState.initial()) {
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      var developerProfile = await remoteProfileRepository.getProfile();
      developerProfile ??= await localProfileRepository.loadProfile();

      emit(state.copyWith(developerProfile: developerProfile));
    } on Exception {
      //todo: send to crashlytics
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
