import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ToggleBuilder<T> extends StatelessWidget {
  final ValueNotifier<T> toggle;
  final Widget Function(BuildContext context, T value) builder;

  const ToggleBuilder({
    super.key,
    required this.toggle,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: toggle,
      builder: (context, T value, _) => builder(context, value),
    );
  }
}
