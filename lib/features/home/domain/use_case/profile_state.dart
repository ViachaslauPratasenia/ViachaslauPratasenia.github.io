import 'package:personal_website/features/home/data/developer_profile.dart';

class ProfileState {
  final bool isLoading;
  final DeveloperProfile? developerProfile;

  const ProfileState._({required this.isLoading, this.developerProfile});

  factory ProfileState.initial() => const ProfileState._(isLoading: true);

  ProfileState copyWith({
    bool? isLoading,
    DeveloperProfile? developerProfile,
  }) {
    return ProfileState._(
      isLoading: isLoading ?? this.isLoading,
      developerProfile: developerProfile ?? this.developerProfile,
    );
  }
}
