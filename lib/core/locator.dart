import 'package:get_it/get_it.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerFactory<ProfileCubit>(() => ProfileCubit());
  }
