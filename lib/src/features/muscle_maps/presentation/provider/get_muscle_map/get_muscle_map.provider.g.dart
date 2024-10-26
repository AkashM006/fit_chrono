// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_muscle_map.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$muscleMapHash() => r'1ef51692e480d5f5d7b28c99b8f006c89b6e3902';

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

/// See also [muscleMap].
@ProviderFor(muscleMap)
const muscleMapProvider = MuscleMapFamily();

/// See also [muscleMap].
class MuscleMapFamily extends Family<AsyncValue<MuscleMapEntity?>> {
  /// See also [muscleMap].
  const MuscleMapFamily();

  /// See also [muscleMap].
  MuscleMapProvider call(
    int id,
  ) {
    return MuscleMapProvider(
      id,
    );
  }

  @override
  MuscleMapProvider getProviderOverride(
    covariant MuscleMapProvider provider,
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
  String? get name => r'muscleMapProvider';
}

/// See also [muscleMap].
class MuscleMapProvider extends AutoDisposeFutureProvider<MuscleMapEntity?> {
  /// See also [muscleMap].
  MuscleMapProvider(
    int id,
  ) : this._internal(
          (ref) => muscleMap(
            ref as MuscleMapRef,
            id,
          ),
          from: muscleMapProvider,
          name: r'muscleMapProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$muscleMapHash,
          dependencies: MuscleMapFamily._dependencies,
          allTransitiveDependencies: MuscleMapFamily._allTransitiveDependencies,
          id: id,
        );

  MuscleMapProvider._internal(
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
    FutureOr<MuscleMapEntity?> Function(MuscleMapRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MuscleMapProvider._internal(
        (ref) => create(ref as MuscleMapRef),
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
  AutoDisposeFutureProviderElement<MuscleMapEntity?> createElement() {
    return _MuscleMapProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MuscleMapProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MuscleMapRef on AutoDisposeFutureProviderRef<MuscleMapEntity?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _MuscleMapProviderElement
    extends AutoDisposeFutureProviderElement<MuscleMapEntity?>
    with MuscleMapRef {
  _MuscleMapProviderElement(super.provider);

  @override
  int get id => (origin as MuscleMapProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
