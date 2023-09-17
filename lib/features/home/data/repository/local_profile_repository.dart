import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:personal_website/features/home/data/developer_profile_dto.dart';

class LocalProfileRepository {
  Future<DeveloperProfileDto?> loadProfile() async {
    try {
      final data = await rootBundle.loadString('assets/profile.json');
      final res = json.decode(data);

      return DeveloperProfileDto.fromJson(res);
    } on Exception {
      return null;
    }
  }
}
