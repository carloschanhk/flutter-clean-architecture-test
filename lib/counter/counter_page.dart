import 'package:clean_architecture_test/injectible/injectible_init.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_page_view_model.dart';

//This class is just for testing. Nth special here.
class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<CounterPageViewModel>(),
      builder: (context, _) {
        final counterPageViewModel = context.watch<CounterPageViewModel>();
        return Scaffold(
          appBar: AppBar(
            title: Text("Counter"),
          ),
          body: Center(
            child: Text("${counterPageViewModel.counter}"),
          ),
          floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () => counterPageViewModel.increment(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  child: const Icon(Icons.remove),
                  onPressed: () => counterPageViewModel.decrement(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
