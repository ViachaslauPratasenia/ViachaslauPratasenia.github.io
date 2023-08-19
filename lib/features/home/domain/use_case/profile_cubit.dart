import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/features/home/data/developer_profile.dart';

class ProfileCubit extends Cubit<DeveloperProfile?> {
  ProfileCubit() : super(null) {
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      final data = await rootBundle.loadString('assets/profile.json');
      final res = json.decode(data);

      final developerProfile = DeveloperProfile.fromJson(res);

      emit(developerProfile);
    } on Exception {
      //todo: handle exception
    }
  }
}