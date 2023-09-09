import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/features/home/data/developer_profile.dart';
import 'package:personal_website/features/home/data/repository/local_profile_repository.dart';
import 'package:personal_website/features/home/data/repository/remote_profile_repository.dart';

class ProfileCubit extends Cubit<DeveloperProfile?> {
  final RemoteProfileRepository remoteProfileRepository;
  final LocalProfileRepository localProfileRepository;

  ProfileCubit({
    required this.remoteProfileRepository,
    required this.localProfileRepository,
  }) : super(null) {
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      var developerProfile = await remoteProfileRepository.getProfile();
      developerProfile ??= await localProfileRepository.loadProfile();

      emit(developerProfile);
    } on Exception {
      //todo: handle exception
    }
  }
}
