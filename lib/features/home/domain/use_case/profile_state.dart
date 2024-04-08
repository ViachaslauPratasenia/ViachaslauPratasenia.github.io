import 'package:personal_website/core/data/models/blog_post/notes.dart';
import 'package:personal_website/core/data/models/profile/profile.dart';
import 'package:personal_website/core/data/models/project/project.dart';
import 'package:personal_website/core/data/models/work/work.dart';

class ProfileState {
  final bool isLoading;
  final Profile? profile;
  final Work? work;
  final Projects? projects;
  final Notes? notes;

  const ProfileState._({
    required this.isLoading,
    this.profile,
    this.work,
    this.projects,
    this.notes,
  });

  factory ProfileState.initial() => const ProfileState._(isLoading: true);

  ProfileState copyWith({
    bool? isLoading,
    Profile? profile,
    Work? work,
    Projects? projects,
    Notes? notes,
  }) {
    return ProfileState._(
      isLoading: isLoading ?? this.isLoading,
      profile: profile ?? this.profile,
      work: work ?? this.work,
      projects: projects ?? this.projects,
      notes: notes ?? this.notes,
    );
  }
}
