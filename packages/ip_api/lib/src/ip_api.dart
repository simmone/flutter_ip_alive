/// {@template ip_api}
/// The interface for an API that provides access to a list of ips.
/// {@endtemplate}
abstract class IpApi {
  /// {@macro ip_api}
  const IpApi();
  
  /// get 'ipList' from local storage
  Future<List<String>> getIpList();

  /// save a complete list 'ipList' to local storage
  Future<void> saveIpList(List<String> ipList);
}
