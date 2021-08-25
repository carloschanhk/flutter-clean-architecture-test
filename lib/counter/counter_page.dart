import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_test/injectible/injectible_init.dart';
import 'package:clean_architecture_test/live_data/live_data.dart';
import 'package:clean_architecture_test/live_data/live_data_widget.dart';
import 'package:flutter/material.dart';
import 'counter_page_view_model.dart';

// This class is showing how to use the custom LiveDataWidget.
class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

// Stateful Widget is used to make sure value is saved when leaving the page.
class _CounterPageState extends State<CounterPage> {
  late CounterPageViewModel counterPageViewModel;
  @override
  void initState() {
    super.initState();
    // Inject viewmodel in the beginning
    counterPageViewModel = getIt<CounterPageViewModel>();
    // Get saved count from Hive database
    counterPageViewModel.initCounter();
  }

  @override
  void dispose() {
    // Save the count when leaving the page
    counterPageViewModel.saveCount();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              heroTag: null,
              child: const Icon(Icons.add),
              onPressed: () => counterPageViewModel.increment(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: null,
              child: const Icon(Icons.remove),
              onPressed: () => counterPageViewModel.decrement(),
            ),
          ),
        ],
      ),
    );
  }
}
