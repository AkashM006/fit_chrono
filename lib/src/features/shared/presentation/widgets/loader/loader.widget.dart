import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_spinner/custom_spinner.widget.dart';
import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    super.key,
    this.text,
  });
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: SizeConfig.safeBlockVertical * 3.5,
          child: const AspectRatio(
            aspectRatio: 1,
            child: CustomSpinnerWidget(),
          ),
        ),
        if (text != null)
          SizedBox(
            height: SizeConfig.safeBlockVertical * 1.5,
          ),
        if (text != null) Text(text!)
      ],
    );
  }
}
