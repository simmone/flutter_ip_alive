import 'package:data_repository/data_repository.dart';

class IpRepository {
  IpRepository({DataRepository? dataRepository}) {
    _dataRepository = dataRepository ?? DataRepository();
  }

  late DataRepository _dataRepository;

  Future<List<String>> getIpList() async {
    return List.from(await _dataRepository.getIpList());
  }

  Future<void> addIp(String ip) async {
    List<String> ipList = await getIpList();
    
    if (!ipList.contains(ip)) {
      ipList.add(ip);

      await _dataRepository.saveIpList(ipList);
    }
  }
}
