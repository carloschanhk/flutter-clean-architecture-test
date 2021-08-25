import 'package:clean_architecture_test/data/counter/counter_repository.dart';
import 'package:clean_architecture_test/live_data/live_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterPageViewModel {
  CounterRepository counterRepository;
  CounterPageViewModel(this.counterRepository);

  final LiveData<int> counterLiveData = LiveData(0);

  void initCounter() {
    counterLiveData.value = counterRepository.retrieveSavedCount();
  }

  void increment() {
    counterLiveData.value = counterLiveData.value + 1;
  }

  void decrement() {
    counterLiveData.value = counterLiveData.value - 1;
  }

  saveCount() {
    counterRepository.saveCount(counterLiveData.value);
  }
}
