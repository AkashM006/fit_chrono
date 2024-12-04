import 'dart:async';

import 'package:flutter/material.dart';

class StartWaveWidget extends StatefulWidget {
  const StartWaveWidget({
    super.key,
    required this.onTimerComplete,
  });

  final void Function() onTimerComplete;

  @override
  State<StartWaveWidget> createState() => _StartWaveWidgetState();
}

class _StartWaveWidgetState extends State<StartWaveWidget> {
  late int _remainingTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _remainingTime = 15;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_remainingTime > 0) {
          setState(() {
            _remainingTime -= 1;
          });
        } else {
          _timer.cancel();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
