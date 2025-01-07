import 'package:fit_chrono/src/features/logs/presentation/provider/logs.provider.dart';
import 'package:fit_chrono/src/features/logs/presentation/widgets/logs_list.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/async_value_builder/async_value_builder.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_async_appbar/custom_async_appbar.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogsScreen extends ConsumerWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logs = ref.watch(logsProvider);

    return Scaffold(
      appBar: CustomAsyncAppBar(
        asyncData: logs,
        builder: (context, data) => AppBar(
          title: const Text("Logs"),
        ),
      ),
      body: AsyncValueBuilderWidget(
        asyncValue: logs,
        builder: (context, data) => LogsListWidget(logs: data),
      ),
    );
  }
}
