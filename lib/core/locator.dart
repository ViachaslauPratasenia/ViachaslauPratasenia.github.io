import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:personal_website/const/const.dart';
import 'package:personal_website/features/change_theme/domain/use_case/theme_cubit.dart';
import 'package:personal_website/features/home/data/repository/local_profile_repository.dart';
import 'package:personal_website/features/home/data/repository/remote_profile_repository.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton(() => Dio(BaseOptions(baseUrl: Const.config.GITHUB_URL)));

  locator.registerLazySingleton<RemoteProfileRepository>(
    () => RemoteProfileRepository(locator.get<Dio>()),
  );
  locator.registerLazySingleton<LocalProfileRepository>(() => LocalProfileRepository());

  locator.registerFactory<ProfileCubit>(
    () => ProfileCubit(
      remoteProfileRepository: locator.get<RemoteProfileRepository>(),
      localProfileRepository: locator.get<LocalProfileRepository>(),
    ),
  );

  locator.registerFactory<ThemeCubit>(() => ThemeCubit());
}
