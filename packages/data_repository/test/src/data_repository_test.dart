import 'package:data_repository/data_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  test('actions', () async {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();

    final dataRepository = DataRepository();

    await dataRepository.saveIpList(<String>['192.168.0.1']);

    expect(await dataRepository.getIpList(), <String>['192.168.0.1']);
  });
}
