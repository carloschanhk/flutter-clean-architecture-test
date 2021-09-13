import 'package:clean_architecture_test/data/counter/counter_repository.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterPageViewModel extends GetxController {
  CounterRepository counterRepository;
  CounterPageViewModel(this.counterRepository);

  @override
  void onInit() {
    initCounter();
    super.onInit();
  }

  @override
  void onClose() {
    saveCount();
    super.onClose();
  }

  RxInt count = 0.obs;

  void initCounter() {
    count.value = counterRepository.retrieveSavedCount();
  }

  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }

  saveCount() {
    counterRepository.saveCount(count.value);
  }
}
