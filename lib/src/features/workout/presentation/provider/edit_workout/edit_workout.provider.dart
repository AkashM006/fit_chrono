import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/core/utils/list.util.dart';
import 'package:fit_chrono/src/features/workout/data/repository/workout_impl.repository.dart';
import 'package:fit_chrono/src/features/workout/domain/usecase/edit_workout.usecase.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_workout.provider.g.dart';

@riverpod
class EditWorkout extends _$EditWorkout {
  @override
  DataState<String>? build() {
    return null;
  }

  void go(WorkoutDto newWorkout, WorkoutDto oldWorkout) async {
    state = DataLoading();

    if (areListsEqual(newWorkout.muscles, oldWorkout.muscles)) {
      newWorkout = newWorkout.copyWith(
        muscles: [],
      );
    }
    final workoutRepository = ref.read(workoutImplProvider);

    final result = await EditWorkoutUsecase(workoutRepository)(
      params: newWorkout.toEntity(),
    );

    state = result.fold(
      onSuccess: (data) => DataSuccess(
        "Edit successful! 🔥 Your workout is all set. Let's get stronger together!",
      ),
      onFailure: (error) => DataFailure(error),
    );
  }
}
