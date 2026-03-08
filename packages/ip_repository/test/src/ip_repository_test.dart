// Not required for test files
// ignore_for_file: prefer_const_constructors
import 'package:ip_repository/ip_repository.dart';
import 'package:test/test.dart';

void main() {
  group('IpRepository', () {
    test('can be instantiated', () {
      expect(IpRepository(), isNotNull);
    });
  });
}
