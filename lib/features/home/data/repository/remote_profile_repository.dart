import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:personal_website/features/home/data/developer_profile_dto.dart';

class RemoteProfileRepository {
  final Dio dio;

  RemoteProfileRepository(this.dio);

  Future<DeveloperProfileDto?> getProfile() async {
    try {
      final res = await dio.get('profile.json');

      if (res.data == null || res.data!.isEmpty) {
        return null;
      }

      final json = jsonDecode(res.data!);

      return DeveloperProfileDto.fromJson(json as Map<String, dynamic>);
    } on Exception {
      return null;
    } on Error {
      return null;
    }
  }
}
