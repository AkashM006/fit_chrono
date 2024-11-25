// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_workout.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchWorkoutsHash() => r'560f58a08fece6f7aa37df6c11b23ce9fc258e46';

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

/// See also [searchWorkouts].
@ProviderFor(searchWorkouts)
const searchWorkoutsProvider = SearchWorkoutsFamily();

/// See also [searchWorkouts].
class SearchWorkoutsFamily extends Family<AsyncValue<List<WorkoutDto>>> {
  /// See also [searchWorkouts].
  const SearchWorkoutsFamily();

  /// See also [searchWorkouts].
  SearchWorkoutsProvider call(
    String workoutName,
  ) {
    return SearchWorkoutsProvider(
      workoutName,
    );
  }

  @override
  SearchWorkoutsProvider getProviderOverride(
    covariant SearchWorkoutsProvider provider,
  ) {
    return call(
      provider.workoutName,
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
  String? get name => r'searchWorkoutsProvider';
}

/// See also [searchWorkouts].
class SearchWorkoutsProvider
    extends AutoDisposeFutureProvider<List<WorkoutDto>> {
  /// See also [searchWorkouts].
  SearchWorkoutsProvider(
    String workoutName,
  ) : this._internal(
          (ref) => searchWorkouts(
            ref as SearchWorkoutsRef,
            workoutName,
          ),
          from: searchWorkoutsProvider,
          name: r'searchWorkoutsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchWorkoutsHash,
          dependencies: SearchWorkoutsFamily._dependencies,
          allTransitiveDependencies:
              SearchWorkoutsFamily._allTransitiveDependencies,
          workoutName: workoutName,
        );

  SearchWorkoutsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.workoutName,
  }) : super.internal();

  final String workoutName;

  @override
  Override overrideWith(
    FutureOr<List<WorkoutDto>> Function(SearchWorkoutsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchWorkoutsProvider._internal(
        (ref) => create(ref as SearchWorkoutsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        workoutName: workoutName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<WorkoutDto>> createElement() {
    return _SearchWorkoutsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchWorkoutsProvider && other.workoutName == workoutName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workoutName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchWorkoutsRef on AutoDisposeFutureProviderRef<List<WorkoutDto>> {
  /// The parameter `workoutName` of this provider.
  String get workoutName;
}

class _SearchWorkoutsProviderElement
    extends AutoDisposeFutureProviderElement<List<WorkoutDto>>
    with SearchWorkoutsRef {
  _SearchWorkoutsProviderElement(super.provider);

  @override
  String get workoutName => (origin as SearchWorkoutsProvider).workoutName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
