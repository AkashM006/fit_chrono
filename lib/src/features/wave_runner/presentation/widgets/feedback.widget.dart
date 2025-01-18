import 'package:fit_chrono/src/core/constants/extensions.dart';
import 'package:fit_chrono/src/core/constants/intensity_config.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_card/custom_card.widget.dart';
import 'package:flutter/material.dart';

class FeedbackWidget extends StatefulWidget {
  const FeedbackWidget.enabled({
    super.key,
    required this.intensity,
    required this.onComplete,
    this.fireTextStyle,
  }) : editable = true;

  const FeedbackWidget.disabled({
    super.key,
    required this.intensity,
    this.fireTextStyle,
  })  : editable = false,
        onComplete = null;

  final void Function(int intensity)? onComplete;
  final int intensity;
  final bool editable;
  final TextStyle? fireTextStyle;

  @override
  State<FeedbackWidget> createState() => _FeedBackWidgetState();
}

class _FeedBackWidgetState extends State<FeedbackWidget> {
  int _selectedIntensityIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIntensityIndex = widget.intensity;
  }

  void onIntensitySelect(int index) {
    setState(() {
      _selectedIntensityIndex = index;
    });
  }

  void onNext() {
    if (widget.onComplete != null) {
      widget.onComplete!(_selectedIntensityIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    final fireText = Text(
      "🔥",
      style: widget.fireTextStyle ?? context.textTheme.displayLarge,
    );

    final animatedIntensitySelectorWidget =
        List.generate(intensityLevels, (index) => index)
            .map(
              (item) => InkWell(
                onTap: !widget.editable ? null : () => onIntensitySelect(item),
                child: AnimatedOpacity(
                  opacity: _selectedIntensityIndex >= item ? 1 : 0.1,
                  duration: const Duration(milliseconds: 150),
                  child: fireText,
                ),
              ),
            )
            .toList();

    final fireTextListWidget = CustomCardWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: animatedIntensitySelectorWidget,
        ),
      ),
    );

    if (!widget.editable) {
      return Row(
        spacing: 10,
        children: animatedIntensitySelectorWidget,
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Text(
              "You Did It! 💪",
              textAlign: TextAlign.center,
              style: context.textTheme.displayMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "How did this workout wave push your limits? Let us know how intense it was!",
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 30,
            ),
            fireTextListWidget,
            const SizedBox(
              height: 20,
            ),
            if (_selectedIntensityIndex >= 0)
              Text(
                intensityMessages[_selectedIntensityIndex],
                style: context.textTheme.headlineSmall,
              ),
            const SizedBox(
              height: 40,
            ),
            FilledButton(onPressed: onNext, child: const Text("See logs"))
          ],
        ),
      ),
    );
  }
}
