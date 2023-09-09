import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:personal_website/features/home/data/developer_profile.dart';

class LocalProfileRepository {
  Future<DeveloperProfile?> loadProfile() async {
    try {
      final data = await rootBundle.loadString('assets/profile.json');
      final res = json.decode(data);

      return DeveloperProfile.fromJson(res);
    } on Exception {
      return null;
    }
  }
}
