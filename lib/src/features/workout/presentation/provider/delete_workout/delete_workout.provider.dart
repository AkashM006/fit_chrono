import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout/data/repository/workout_impl.repository.dart';
import 'package:fit_chrono/src/features/workout/domain/usecase/delete_workout.usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_workout.provider.g.dart';

@riverpod
class DeleteWorkout extends _$DeleteWorkout {
  @override
  DataState<String>? build() {
    return null;
  }

  void go(int id) async {
    state = DataLoading();

    final workoutRepository = ref.read(workoutImplProvider);
    final result = await DeleteWorkoutUsecase(workoutRepository)(params: id);

    state = result.fold(
      onSuccess: (data) => DataSuccess(
        "Workout removed! Making space for new goals ✨",
      ),
      onFailure: (error) => DataFailure(error),
    );
  }
}
