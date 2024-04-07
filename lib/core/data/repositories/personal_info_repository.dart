import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal_website/core/data/models/blog_post/blog_post.dart';
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

  Future<Project> getProjectInfo() async {
    try {
      final document =
      await FirebaseFirestore.instance.collection('personal_data').doc('projects').get();

      return Project.fromJson(document.data() ?? {});
    } catch (e) {
      return const Project();
    }
  }

  Future<void> saveProjectInfo(Project project) async {
    try {
      await FirebaseFirestore.instance.collection('personal_data').doc('projects').set(project.toJson());
    } catch (e) {
      // todo: send to crashlytics
    }
  }

  Future<BlogPost> getBlogPostsInfo() async {
    try {
      final document =
      await FirebaseFirestore.instance.collection('personal_data').doc('blog_posts').get();

      return BlogPost.fromJson(document.data() ?? {});
    } catch (e) {
      return const BlogPost();
    }
  }

  Future<void> saveBlogPosts(BlogPost blogPost) async {
    try {
      await FirebaseFirestore.instance.collection('personal_data').doc('blog_posts').set(blogPost.toJson());
    } catch (e) {
      // todo: send to crashlytics
    }
  }
}
