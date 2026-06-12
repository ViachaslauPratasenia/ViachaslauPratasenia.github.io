import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/const/const.dart';
import 'package:personal_website/features/home/data/developer_profile_dto.dart';
import 'package:personal_website/features/home/data/repository/local_profile_repository.dart';
import 'package:personal_website/features/home/data/repository/remote_profile_repository.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';

class _FakeRemote implements RemoteProfileRepository {
  final DeveloperProfileDto? result;
  bool called = false;

  _FakeRemote(this.result);

  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);

  @override
  Future<DeveloperProfileDto?> getProfile() async {
    called = true;
    return result;
  }
}

class _FakeLocal implements LocalProfileRepository {
  final DeveloperProfileDto? result;
  bool called = false;

  _FakeLocal(this.result);

  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);

  @override
  Future<DeveloperProfileDto?> loadProfile() async {
    called = true;
    return result;
  }
}

void main() {
  test('local source loads only the local repository, never remote', () async {
    final remote = _FakeRemote(DeveloperProfileDto(name: 'REMOTE'));
    final local = _FakeLocal(DeveloperProfileDto(name: 'LOCAL'));
    final cubit = ProfileCubit(
      remoteProfileRepository: remote,
      localProfileRepository: local,
      source: ProfileSource.local,
    );

    await Future<void>.delayed(Duration.zero);

    expect(local.called, isTrue);
    expect(remote.called, isFalse);
    expect(cubit.state.isLoading, isFalse);
    expect(cubit.state.developerProfile?.name, 'LOCAL');
  });

  test('remote source prefers remote', () async {
    final remote = _FakeRemote(DeveloperProfileDto(name: 'REMOTE'));
    final local = _FakeLocal(DeveloperProfileDto(name: 'LOCAL'));
    final cubit = ProfileCubit(
      remoteProfileRepository: remote,
      localProfileRepository: local,
      source: ProfileSource.remote,
    );

    await Future<void>.delayed(Duration.zero);

    expect(remote.called, isTrue);
    expect(cubit.state.developerProfile?.name, 'REMOTE');
  });

  test('remote source falls back to local when remote returns null', () async {
    final remote = _FakeRemote(null);
    final local = _FakeLocal(DeveloperProfileDto(name: 'LOCAL'));
    final cubit = ProfileCubit(
      remoteProfileRepository: remote,
      localProfileRepository: local,
      source: ProfileSource.remote,
    );

    await Future<void>.delayed(Duration.zero);

    expect(remote.called, isTrue);
    expect(local.called, isTrue);
    expect(cubit.state.developerProfile?.name, 'LOCAL');
  });
}
