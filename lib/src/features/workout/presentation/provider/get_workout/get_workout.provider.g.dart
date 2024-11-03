// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_workout.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getWorkoutHash() => r'a9b47a13ca5b21b773253bee070047389f9647d9';

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

/// See also [getWorkout].
@ProviderFor(getWorkout)
const getWorkoutProvider = GetWorkoutFamily();

/// See also [getWorkout].
class GetWorkoutFamily extends Family<AsyncValue<WorkoutDto>> {
  /// See also [getWorkout].
  const GetWorkoutFamily();

  /// See also [getWorkout].
  GetWorkoutProvider call(
    int id,
  ) {
    return GetWorkoutProvider(
      id,
    );
  }

  @override
  GetWorkoutProvider getProviderOverride(
    covariant GetWorkoutProvider provider,
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
  String? get name => r'getWorkoutProvider';
}

/// See also [getWorkout].
class GetWorkoutProvider extends AutoDisposeFutureProvider<WorkoutDto> {
  /// See also [getWorkout].
  GetWorkoutProvider(
    int id,
  ) : this._internal(
          (ref) => getWorkout(
            ref as GetWorkoutRef,
            id,
          ),
          from: getWorkoutProvider,
          name: r'getWorkoutProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getWorkoutHash,
          dependencies: GetWorkoutFamily._dependencies,
          allTransitiveDependencies:
              GetWorkoutFamily._allTransitiveDependencies,
          id: id,
        );

  GetWorkoutProvider._internal(
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
    FutureOr<WorkoutDto> Function(GetWorkoutRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetWorkoutProvider._internal(
        (ref) => create(ref as GetWorkoutRef),
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
  AutoDisposeFutureProviderElement<WorkoutDto> createElement() {
    return _GetWorkoutProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetWorkoutProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetWorkoutRef on AutoDisposeFutureProviderRef<WorkoutDto> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetWorkoutProviderElement
    extends AutoDisposeFutureProviderElement<WorkoutDto> with GetWorkoutRef {
  _GetWorkoutProviderElement(super.provider);

  @override
  int get id => (origin as GetWorkoutProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
