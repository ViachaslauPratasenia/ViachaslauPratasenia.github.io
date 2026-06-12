import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/const/const.dart';
import 'package:personal_website/features/home/data/developer_profile_dto.dart';
import 'package:personal_website/features/home/data/developer_profile_mapper.dart';
import 'package:personal_website/features/home/data/repository/local_profile_repository.dart';
import 'package:personal_website/features/home/data/repository/remote_profile_repository.dart';
import 'package:personal_website/features/home/domain/use_case/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final RemoteProfileRepository remoteProfileRepository;
  final LocalProfileRepository localProfileRepository;
  final ProfileSource source;

  ProfileCubit({
    required this.remoteProfileRepository,
    required this.localProfileRepository,
    ProfileSource? source,
  })  : source = source ?? Const.config.PROFILE_SOURCE,
        super(ProfileState.initial()) {
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      final DeveloperProfileDto? dto;
      if (source == ProfileSource.local) {
        dto = await localProfileRepository.loadProfile();
      } else {
        dto = await remoteProfileRepository.getProfile() ??
            await localProfileRepository.loadProfile();
      }

      if (dto != null) {
        emit(state.copyWith(developerProfile: DeveloperProfileMapper.map(dto)));
      }
    } on Exception {
      //todo: send to crashlytics
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
