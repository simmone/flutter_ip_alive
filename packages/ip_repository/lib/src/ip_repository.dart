import 'package:ip_api/ip_api.dart';

/// {@template ip_repository}
/// A repository that handles `ip` related requests.
/// {@endtemplate}
class IpRepository {
  /// {@macro ip_repository}
  IpRepository({
      required IpApi ipApi
  }) : _ipApi = ipApi;

  final IpApi _ipApi;

  /// Retrieve all ips in local storage
  Future<List<String>> getIpList() => _ipApi.getIpList();

  /// Save a ip into local storage if it not exists.
  Future<void> addIp(String ip) async {
    final ipList = await getIpList();
    
    if (!ipList.contains(ip)) {
      ipList.add(ip);

      await _ipApi.saveIpList(ipList);
    }
  }
}
