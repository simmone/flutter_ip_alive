import 'package:ip_api/ip_api.dart';
import 'package:ip_repository/ip_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockIpApi extends Mock implements IpApi {}

void main() {
  group('IpRepository', () {
    late data_repository.DataRepository dataRepository;

    late IpRepository ipRepository;

    setUp(() {
      dataRepository = MockDataRepository();

      ipRepository = IpRepository(dataRepository: dataRepository);
    });

    group('contructor', () {
      test('initial', () {
        expect(ipRepository, isNotNull);
      });
    });

    const List<String> mockIpList = ['192.168.0.1', '192.168.0.2'];

    group('getIpList', () {
      test('get', () async {
        when(
          () => dataRepository.getIpList(),
        ).thenAnswer((_) async => mockIpList);

        List<String> ipList = await ipRepository.getIpList();

        verify(() => dataRepository.getIpList()).called(1);
        expect(ipList, mockIpList);
      });
    });

    group('addIp', () {
      List<String> addedMockIpList = [...mockIpList];
      addedMockIpList.add('192.168.1.1');
      
      test('save', () async {
        when(
          () => dataRepository.saveIpList(addedMockIpList)
        ).thenAnswer((_) async {});

        when(
          () => dataRepository.getIpList(),
        ).thenAnswer((_) async => mockIpList);
        
        await ipRepository.addIp('192.168.1.1');
        verify(() => dataRepository.getIpList()).called(1);
        verify(() => dataRepository.saveIpList(addedMockIpList)).called(1);

        when(
          () => dataRepository.getIpList(),
        ).thenAnswer((_) async => addedMockIpList);

        List<String> ipList = await ipRepository.getIpList();
        verify(() => dataRepository.getIpList()).called(1);
        expect(ipList.length, 3);
        expect(ipList, addedMockIpList);
      });
    });
  });
}
