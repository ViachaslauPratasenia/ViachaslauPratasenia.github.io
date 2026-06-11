import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Global test setup, automatically applied to every test in this directory
/// tree by the Flutter test runner.
///
/// `google_fonts` resolves a [TextStyle] synchronously but kicks off a
/// background font load. Offline that load would hit the network and fail,
/// surfacing as an unhandled async error that fails otherwise-valid tests.
///
/// To keep the suite hermetic and offline, we mock the asset bundle so any
/// google_fonts request resolves from a bundled fixture TTF (the asset-path
/// branch skips the network and the checksum verification entirely).
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final fontBytes = File('test/fixtures/test_font.ttf').readAsBytesSync();

  // google_fonts resolves an asset by matching the requested API filename
  // prefix (e.g. `Inter-Medium`, `JetBrainsMono-Regular`) against the *end* of
  // each manifest asset's basename. We register one fixture asset per prefix
  // the typography helpers may request so every variant resolves offline.
  const prefixes = <String>[
    'Inter-Regular',
    'Inter-Medium',
    'Inter-SemiBold',
    'Inter-Bold',
    'JetBrainsMono-Regular',
    'JetBrainsMono-Medium',
    'JetBrainsMono-Bold',
  ];
  final assetKeys = {
    for (final p in prefixes) p: 'assets/fonts/$p.ttf',
  };

  // Modern Flutter loads the binary `AssetManifest.bin`, encoded with the
  // StandardMessageCodec. Each entry maps an asset key to a list of variant
  // descriptors ({"asset": <key>}).
  final manifestBin = const StandardMessageCodec().encodeMessage(<String, Object>{
    for (final key in assetKeys.values)
      key: <Object>[
        <String, Object>{'asset': key},
      ],
  })!;

  // Legacy JSON manifest, kept for older google_fonts code paths.
  final manifestJson = jsonEncode({
    for (final key in assetKeys.values) key: [key],
  });

  final messenger =
      TestWidgetsFlutterBinding.instance.defaultBinaryMessenger;

  messenger.setMockMessageHandler('flutter/assets', (ByteData? message) async {
    final key = utf8.decode(message!.buffer.asUint8List(
      message.offsetInBytes,
      message.lengthInBytes,
    ));
    if (key == 'AssetManifest.bin') {
      return manifestBin;
    }
    if (key == 'AssetManifest.json') {
      final bytes = Uint8List.fromList(utf8.encode(manifestJson));
      return ByteData.view(bytes.buffer);
    }
    if (key.endsWith('.ttf')) {
      return ByteData.view(Uint8List.fromList(fontBytes).buffer);
    }
    return null;
  });

  await testMain();
}
