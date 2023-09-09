import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:personal_website/const/const.dart';
import 'package:personal_website/features/home/data/developer_profile.dart';

class RemoteProfileRepository {
  Future<DeveloperProfile?> getProfile() async {
    try {
      final res = await Dio().get(Const.config.PROFILE_URL);

      if (res.data == null || res.data!.isEmpty) {
        return null;
      }

      final json = jsonDecode(res.data!);

      return DeveloperProfile.fromJson(json as Map<String, dynamic>);
    } on Exception {
      return null;
    }
  }
}