import 'package:clean_architecture_test/live_data_module/live_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterPageViewModel {
  final LiveData<int> counterLiveData = LiveData(0);

  void increment() {
    counterLiveData.value = counterLiveData.value + 1;
  }

  void decrement() {
    counterLiveData.value = counterLiveData.value - 1;
  }
}
