import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:personal_website/features/home/data/developer_profile.dart';

class RemoteProfileRepository {
  final Dio dio;

  RemoteProfileRepository(this.dio);

  Future<DeveloperProfile?> getProfile() async {
    try {
      final res = await dio.get('profile.json');

      if (res.data == null || res.data!.isEmpty) {
        return null;
      }

      final json = jsonDecode(res.data!);

      return DeveloperProfile.fromJson(json as Map<String, dynamic>);
    } on Exception {
      return null;
    } on Error {
      return null;
    }
  }
}
