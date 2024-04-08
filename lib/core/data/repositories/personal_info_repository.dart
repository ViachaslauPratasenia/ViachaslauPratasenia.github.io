import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal_website/core/data/models/blog_post/notes.dart';
import 'package:personal_website/core/data/models/profile/profile.dart';
import 'package:personal_website/core/data/models/project/project.dart';
import 'package:personal_website/core/data/models/work/work.dart';

class PersonalInfoRepository {
  PersonalInfoRepository();

  Future<Profile> getProfileInfo() async {
    try {
      final document =
          await FirebaseFirestore.instance.collection('personal_data').doc('profile').get();

      return Profile.fromJson(document.data() ?? {});
    } catch (e) {
      return const Profile();
    }
  }

  Future<void> saveProfileInfo(Profile profile) async {
    try {
      await FirebaseFirestore.instance
          .collection('personal_data')
          .doc('profile')
          .set(profile.toJson());
    } catch (e) {
      // todo: send to crashlytics
    }
  }

  Future<Work> getWorkInfo() async {
    try {
      final document =
      await FirebaseFirestore.instance.collection('personal_data').doc('work').get();

      return Work.fromJson(document.data() ?? {});
    } catch (e) {
      return const Work();
    }
  }

  Future<void> saveWorkInfo(Work work) async {
    try {
      await FirebaseFirestore.instance.collection('personal_data').doc('work').set(work.toJson());
    } catch (e) {
      // todo: send to crashlytics
    }
  }

  Future<Projects> getProjectInfo() async {
    try {
      final document =
      await FirebaseFirestore.instance.collection('personal_data').doc('projects').get();

      return Projects.fromJson(document.data() ?? {});
    } catch (e) {
      return const Projects();
    }
  }

  Future<void> saveProjectInfo(Projects project) async {
    try {
      await FirebaseFirestore.instance.collection('personal_data').doc('projects').set(project.toJson());
    } catch (e) {
      // todo: send to crashlytics
    }
  }

  Future<Notes> getNotesInfo() async {
    try {
      final document =
      await FirebaseFirestore.instance.collection('personal_data').doc('blog_posts').get();

      return Notes.fromJson(document.data() ?? {});
    } catch (e) {
      return const Notes();
    }
  }

  Future<void> saveNotes(Notes notes) async {
    try {
      await FirebaseFirestore.instance.collection('personal_data').doc('blog_posts').set(notes.toJson());
    } catch (e) {
      // todo: send to crashlytics
    }
  }
}
