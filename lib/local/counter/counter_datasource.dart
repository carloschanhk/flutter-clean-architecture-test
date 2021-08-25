import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterDatasource {
  final counterBox = Hive.box<int>("count");

  int retreiveSavedCount() {
    if (!counterBox.containsKey("count")) {
      counterBox.put("count", 0);
    }
    return counterBox.get("count")!;
  }

  saveCount(int count) {
    counterBox.put("count", count);
  }
}
