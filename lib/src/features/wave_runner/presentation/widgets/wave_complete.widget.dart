import 'package:fit_chrono/src/core/constants/extensions.dart';
import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/features/wave_runner/presentation/dto/wave_runner_log.dto.dart';
import 'package:fit_chrono/src/features/wave_runner/presentation/widgets/log_detail.widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WaveCompleteWidget extends StatelessWidget {
  const WaveCompleteWidget({
    super.key,
    required this.log,
  });

  final WaveRunnerLogDto log;

  @override
  Widget build(BuildContext context) {
    void onComplete() {
      context.pop();
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: SizeConfig.safeBlockVertical * 5,
        ),
        child: Column(
          children: [
            Text("🌊", style: context.textTheme.displayLarge),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Wave Surfed!",
              style: context.textTheme.displaySmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Great job! You gave it your all and completed another wave. Every rep and second counts toward your success—keep pushing forward! 💪",
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: onComplete,
              style:
                  TextButton.styleFrom(textStyle: context.textTheme.bodyLarge),
              child: const Text("Back to Waves 🌊"),
            ),
            const SizedBox(
              height: 25,
            ),
            const Divider(),
            const SizedBox(
              height: 25,
            ),
            Text("Wave Log", style: context.textTheme.displaySmall),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: LogDetailWidget(log: log),
            )
          ],
        ),
      ),
    );
  }
}
