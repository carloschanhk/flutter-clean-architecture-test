import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_test/injectible/injectible_init.dart';
import 'package:clean_architecture_test/live_data_module/live_data.dart';
import 'package:clean_architecture_test/live_data_module/live_data_widget.dart';
import 'package:flutter/material.dart';
import 'counter_page_view_model.dart';

//This class is showing how to use the custom LiveDataWidget.
class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Inject viewmodel in the beginning
    final CounterPageViewModel counterPageViewModel =
        getIt<CounterPageViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        leading: IconButton(
          onPressed: () {
            AutoRouter.of(context).pop();
          },
          icon: Icon(Icons.keyboard_arrow_left),
        ),
      ),
      body: Center(
        // Consume the LiveData value
        child: LiveDataWidget<LiveData<int>>(
          data: counterPageViewModel.counterLiveData,
          builder: (context, data, _) {
            return Text("${data.value}");
          },
        ),
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
  }
}
