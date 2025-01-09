import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogDetailScreen extends ConsumerWidget {
  const LogDetailScreen({
    super.key,
    this.id,
  });

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (id == null) {
      // todo: Return Not found page
    }

    return const Scaffold(
      body: Center(
        child: Text("Log Detail"),
      ),
    );
  }
}
