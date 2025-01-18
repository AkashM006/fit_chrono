// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$logHash() => r'c910427302a583e9b67109d43f446ad9395fbbe4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [log].
@ProviderFor(log)
const logProvider = LogFamily();

/// See also [log].
class LogFamily extends Family<AsyncValue<WaveRunnerLogDto>> {
  /// See also [log].
  const LogFamily();

  /// See also [log].
  LogProvider call(
    int id,
  ) {
    return LogProvider(
      id,
    );
  }

  @override
  LogProvider getProviderOverride(
    covariant LogProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'logProvider';
}

/// See also [log].
class LogProvider extends AutoDisposeStreamProvider<WaveRunnerLogDto> {
  /// See also [log].
  LogProvider(
    int id,
  ) : this._internal(
          (ref) => log(
            ref as LogRef,
            id,
          ),
          from: logProvider,
          name: r'logProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$logHash,
          dependencies: LogFamily._dependencies,
          allTransitiveDependencies: LogFamily._allTransitiveDependencies,
          id: id,
        );

  LogProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    Stream<WaveRunnerLogDto> Function(LogRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LogProvider._internal(
        (ref) => create(ref as LogRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<WaveRunnerLogDto> createElement() {
    return _LogProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LogProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LogRef on AutoDisposeStreamProviderRef<WaveRunnerLogDto> {
  /// The parameter `id` of this provider.
  int get id;
}

class _LogProviderElement
    extends AutoDisposeStreamProviderElement<WaveRunnerLogDto> with LogRef {
  _LogProviderElement(super.provider);

  @override
  int get id => (origin as LogProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
