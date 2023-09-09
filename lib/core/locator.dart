import 'package:get_it/get_it.dart';
import 'package:personal_website/features/home/data/repository/local_profile_repository.dart';
import 'package:personal_website/features/home/data/repository/remote_profile_repository.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton<RemoteProfileRepository>(() => RemoteProfileRepository());
  locator.registerLazySingleton<LocalProfileRepository>(() => LocalProfileRepository());

  locator.registerFactory<ProfileCubit>(
    () => ProfileCubit(
      remoteProfileRepository: locator.get<RemoteProfileRepository>(),
      localProfileRepository: locator.get<LocalProfileRepository>(),
    ),
  );
}
