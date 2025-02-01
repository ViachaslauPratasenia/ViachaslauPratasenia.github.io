import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal_website/core/data/firebase_keys.dart';
import 'package:personal_website/core/data/models/blog_post/notes.dart';
import 'package:personal_website/core/data/models/profile/profile.dart';
import 'package:personal_website/core/data/models/project/project.dart';
import 'package:personal_website/core/data/models/work/work.dart';

class PersonalInfoRepository {
  PersonalInfoRepository();

  Future<Map<String, dynamic>> getPersonalData() async {
    try {
      final document = await FirebaseFirestore.instance.collection(FirebaseKeys.personalData).get();

      final profile =
          document.docs.firstWhere((element) => element.id == FirebaseKeys.profile).data();
      final work = document.docs.firstWhere((element) => element.id == FirebaseKeys.work).data();
      final projects =
          document.docs.firstWhere((element) => element.id == FirebaseKeys.projects).data();
      final notes =
          document.docs.firstWhere((element) => element.id == FirebaseKeys.blogPosts).data();

      final personalData = {
        FirebaseKeys.profile: Profile.fromJson(profile),
        FirebaseKeys.work: Work.fromJson(work),
        FirebaseKeys.projects: Projects.fromJson(projects),
        FirebaseKeys.notes: Notes.fromJson(notes),
      };

      return personalData;
    } catch (e) {
      return {};
    }
  }

  Future<Profile> getProfileInfo() async {
    try {
      final document = await FirebaseFirestore.instance
          .collection(FirebaseKeys.personalData)
          .doc(FirebaseKeys.profile)
          .get();

      return Profile.fromJson(document.data() ?? {});
    } catch (e) {
      return const Profile();
    }
  }

  Future<void> saveProfileInfo(Profile profile) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseKeys.personalData)
          .doc(FirebaseKeys.profile)
          .set(profile.toJson());
    } catch (e) {
      // todo: send to crashlytics
    }
  }

  Future<Work> getWorkInfo() async {
    try {
      final document = await FirebaseFirestore.instance
          .collection(FirebaseKeys.personalData)
          .doc(FirebaseKeys.work)
          .get();

      return Work.fromJson(document.data() ?? {});
    } catch (e) {
      return const Work();
    }
  }

  Future<void> saveWorkInfo(Work work) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseKeys.personalData)
          .doc(FirebaseKeys.work)
          .set(work.toJson());
    } catch (e) {
      // todo: send to crashlytics
    }
  }

  Future<Projects> getProjectInfo() async {
    try {
      final document = await FirebaseFirestore.instance
          .collection(FirebaseKeys.personalData)
          .doc(FirebaseKeys.projects)
          .get();

      return Projects.fromJson(document.data() ?? {});
    } catch (e) {
      return const Projects();
    }
  }

  Future<void> saveProjectInfo(Projects project) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseKeys.personalData)
          .doc(FirebaseKeys.projects)
          .set(project.toJson());
    } catch (e) {
      // todo: send to crashlytics
    }
  }

  Future<Notes> getNotesInfo() async {
    try {
      final document = await FirebaseFirestore.instance
          .collection(FirebaseKeys.personalData)
          .doc(FirebaseKeys.blogPosts)
          .get();

      return Notes.fromJson(document.data() ?? {});
    } catch (e) {
      return const Notes();
    }
  }

  Future<void> saveNotes(Notes notes) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseKeys.personalData)
          .doc(FirebaseKeys.blogPosts)
          .set(notes.toJson());
    } catch (e) {
      // todo: send to crashlytics
    }
  }

  Future<void> setNewName() async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseKeys.personalData)
          .doc(FirebaseKeys.profile)
          .update({'name': 'Teeeest'});
    } catch (e) {
      print('asdas');
    }
  }
}
