import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'live_data.dart';

class LiveDataWidget<T extends LiveData> extends StatelessWidget {
  LiveDataWidget({Key? key, required this.data, required this.builder})
      : super(key: key);

  final T data;

  final Widget Function(BuildContext context, T value, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => data,
      child: Consumer<T>(builder: builder),
    );
  }
}
