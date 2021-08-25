import 'package:clean_architecture_test/local/counter/counter_datasource.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterRepository {
  CounterDatasource counterDatasource;

  CounterRepository(this.counterDatasource);

  int retrieveSavedCount() {
    return counterDatasource.retreiveSavedCount();
  }

  saveCount(count) {
    counterDatasource.saveCount(count);
  }
}
