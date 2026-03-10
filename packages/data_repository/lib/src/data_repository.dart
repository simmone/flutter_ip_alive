import 'package:ip_api/ip_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// DataRepository use shared_preferences as local storage
class DataRepository extends IpApi {
  
  /// Initialize a SharedPreferences
  DataRepository() {
    prefs = SharedPreferencesAsync();
  }

  /// prefs is local storage handle
  late SharedPreferencesAsync prefs;

  /// get 'ipList' from local storage
  @override
  Future<List<String>> getIpList() async {
    return await prefs.getStringList('ipList') ?? [];
  }

  /// save a complete list 'ipList' to local storage
  @override
  Future<void> saveIpList(List<String> ipList) async {
    await prefs.setStringList('ipList', ipList);
  }
}
