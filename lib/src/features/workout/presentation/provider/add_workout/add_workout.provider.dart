import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout/data/repository/workout_impl.repository.dart';
import 'package:fit_chrono/src/features/workout/domain/usecase/add_workout.usecase.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_workout.provider.g.dart';

@riverpod
class AddWorkout extends _$AddWorkout {
  @override
  DataState<String>? build() {
    return null;
  }

  void go(WorkoutDto workout) async {
    state = DataLoading();

    final workoutRepository = ref.read(workoutImplProvider);

    final workoutEntity = workout.toEntity();

    final result =
        await AddWorkoutUsecase(workoutRepository)(params: workoutEntity);

    state = result.fold(
      onSuccess: (data) => DataSuccess(
        "${workout.name} unlocked! 💥 Time to power up—let's go!",
      ),
      onFailure: (error) => DataFailure(error),
    );
  }
}
