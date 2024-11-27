import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';

const initialWorkoutsInWaves = [
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(1),
    workoutWaveId: Value(1),
    position: Value(0),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(1),
    position: Value(1),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(3),
    workoutWaveId: Value(1),
    position: Value(2),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(1),
    position: Value(3),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(4),
    workoutWaveId: Value(1),
    position: Value(4),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(1),
    position: Value(5),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(5),
    workoutWaveId: Value(1),
    position: Value(6),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(1),
    position: Value(7),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(6),
    workoutWaveId: Value(1),
    position: Value(8),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(1),
    position: Value(9),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(7),
    workoutWaveId: Value(1),
    position: Value(10),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(1),
    position: Value(11),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(8),
    workoutWaveId: Value(1),
    position: Value(12),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(1),
    position: Value(13),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(9),
    workoutWaveId: Value(1),
    position: Value(14),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(10),
    workoutWaveId: Value(2),
    position: Value(0),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(2),
    position: Value(1),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(11),
    workoutWaveId: Value(2),
    position: Value(2),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(2),
    position: Value(3),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(12),
    workoutWaveId: Value(2),
    position: Value(4),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(2),
    position: Value(5),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(13),
    workoutWaveId: Value(2),
    position: Value(6),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(2),
    position: Value(7),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(14),
    workoutWaveId: Value(2),
    position: Value(8),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(2),
    position: Value(9),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(15),
    workoutWaveId: Value(2),
    position: Value(10),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(24),
    workoutWaveId: Value(4),
    position: Value(0),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(4),
    position: Value(1),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(25),
    workoutWaveId: Value(4),
    position: Value(2),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(4),
    position: Value(3),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(26),
    workoutWaveId: Value(4),
    position: Value(4),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(4),
    position: Value(5),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(27),
    workoutWaveId: Value(4),
    position: Value(6),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(4),
    position: Value(7),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(28),
    workoutWaveId: Value(4),
    position: Value(8),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(4),
    position: Value(9),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(29),
    workoutWaveId: Value(4),
    position: Value(10),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(4),
    position: Value(11),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(30),
    workoutWaveId: Value(4),
    position: Value(12),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(4),
    position: Value(13),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(31),
    workoutWaveId: Value(4),
    position: Value(14),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(16),
    workoutWaveId: Value(3),
    position: Value(0),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(3),
    position: Value(1),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(17),
    workoutWaveId: Value(3),
    position: Value(2),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(3),
    position: Value(3),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(18),
    workoutWaveId: Value(3),
    position: Value(4),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(3),
    position: Value(5),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(19),
    workoutWaveId: Value(3),
    position: Value(6),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(3),
    position: Value(7),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(20),
    workoutWaveId: Value(3),
    position: Value(8),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(3),
    position: Value(9),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(21),
    workoutWaveId: Value(3),
    position: Value(10),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(3),
    position: Value(11),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(22),
    workoutWaveId: Value(3),
    position: Value(12),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(3),
    position: Value(13),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(23),
    workoutWaveId: Value(3),
    position: Value(14),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(10),
    workoutWaveId: Value(5),
    position: Value(0),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(5),
    position: Value(1),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(32),
    workoutWaveId: Value(5),
    position: Value(2),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(5),
    position: Value(3),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(33),
    workoutWaveId: Value(5),
    position: Value(4),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(5),
    position: Value(5),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(34),
    workoutWaveId: Value(5),
    position: Value(6),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(5),
    position: Value(7),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(35),
    workoutWaveId: Value(5),
    position: Value(8),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(5),
    position: Value(9),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(36),
    workoutWaveId: Value(5),
    position: Value(10),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(5),
    position: Value(11),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(37),
    workoutWaveId: Value(5),
    position: Value(12),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(38),
    workoutWaveId: Value(6),
    position: Value(0),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(6),
    position: Value(1),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(19),
    workoutWaveId: Value(6),
    position: Value(2),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(6),
    position: Value(3),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(39),
    workoutWaveId: Value(6),
    position: Value(4),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(6),
    position: Value(5),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(40),
    workoutWaveId: Value(6),
    position: Value(6),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(6),
    position: Value(7),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(41),
    workoutWaveId: Value(6),
    position: Value(8),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(6),
    position: Value(9),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(42),
    workoutWaveId: Value(6),
    position: Value(10),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(6),
    position: Value(11),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(43),
    workoutWaveId: Value(6),
    position: Value(12),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(2),
    workoutWaveId: Value(6),
    position: Value(13),
  ),
  WorkoutsInWavesCompanion(
    workoutWithMeasureId: Value(44),
    workoutWaveId: Value(6),
    position: Value(14),
  ),
];
