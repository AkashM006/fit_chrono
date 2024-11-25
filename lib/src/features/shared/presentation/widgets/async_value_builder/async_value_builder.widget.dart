import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_error/custom_error.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/loader/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueBuilderWidget<T> extends StatelessWidget {
  const AsyncValueBuilderWidget({
    super.key,
    required this.asyncValue,
    required this.builder,
    this.isSliver = false,
  });

  final AsyncValue<T> asyncValue;
  final Widget Function(BuildContext context, T data) builder;
  final bool isSliver;

  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
      data: (data) => builder(context, data),
      error: (error, stackTrace) => !isSliver
          ? Center(
              child: CustomErrorWidget(text: error.toString()),
            )
          : SliverToBoxAdapter(
              child: CustomErrorWidget(text: error.toString()),
            ),
      loading: () => !isSliver
          ? const Center(
              child: LoaderWidget(),
            )
          : const SliverToBoxAdapter(
              child: LoaderWidget(),
            ),
    );
  }
}
