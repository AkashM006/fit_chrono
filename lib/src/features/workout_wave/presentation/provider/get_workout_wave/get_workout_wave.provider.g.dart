// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_workout_wave.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getWorkoutWaveHash() => r'9ee600e7e5479e80971afc9a97d5779094e6a2fa';

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

/// See also [getWorkoutWave].
@ProviderFor(getWorkoutWave)
const getWorkoutWaveProvider = GetWorkoutWaveFamily();

/// See also [getWorkoutWave].
class GetWorkoutWaveFamily
    extends Family<AsyncValue<WorkoutWaveWithWorkoutsMeasureDto>> {
  /// See also [getWorkoutWave].
  const GetWorkoutWaveFamily();

  /// See also [getWorkoutWave].
  GetWorkoutWaveProvider call(
    int id,
  ) {
    return GetWorkoutWaveProvider(
      id,
    );
  }

  @override
  GetWorkoutWaveProvider getProviderOverride(
    covariant GetWorkoutWaveProvider provider,
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
  String? get name => r'getWorkoutWaveProvider';
}

/// See also [getWorkoutWave].
class GetWorkoutWaveProvider
    extends AutoDisposeFutureProvider<WorkoutWaveWithWorkoutsMeasureDto> {
  /// See also [getWorkoutWave].
  GetWorkoutWaveProvider(
    int id,
  ) : this._internal(
          (ref) => getWorkoutWave(
            ref as GetWorkoutWaveRef,
            id,
          ),
          from: getWorkoutWaveProvider,
          name: r'getWorkoutWaveProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getWorkoutWaveHash,
          dependencies: GetWorkoutWaveFamily._dependencies,
          allTransitiveDependencies:
              GetWorkoutWaveFamily._allTransitiveDependencies,
          id: id,
        );

  GetWorkoutWaveProvider._internal(
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
    FutureOr<WorkoutWaveWithWorkoutsMeasureDto> Function(
            GetWorkoutWaveRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetWorkoutWaveProvider._internal(
        (ref) => create(ref as GetWorkoutWaveRef),
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
  AutoDisposeFutureProviderElement<WorkoutWaveWithWorkoutsMeasureDto>
      createElement() {
    return _GetWorkoutWaveProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetWorkoutWaveProvider && other.id == id;
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
mixin GetWorkoutWaveRef
    on AutoDisposeFutureProviderRef<WorkoutWaveWithWorkoutsMeasureDto> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetWorkoutWaveProviderElement
    extends AutoDisposeFutureProviderElement<WorkoutWaveWithWorkoutsMeasureDto>
    with GetWorkoutWaveRef {
  _GetWorkoutWaveProviderElement(super.provider);

  @override
  int get id => (origin as GetWorkoutWaveProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
