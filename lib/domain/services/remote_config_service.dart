import 'package:todo/common/checking_network.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/common/constants.dart';

class RemoteConfigService {
  static Future<RemoteConfigService> init() async {
    if (!await hasNetwork()) return RemoteConfigService();
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 1),
      ),
    );
    final prefs = await SharedPreferences.getInstance();
    bool newValue;
    remoteConfig.addListener(() async {
      try {
        await remoteConfig.fetchAndActivate();
      } catch (e) {
        remoteConfig.removeListener(() {});
      }
      newValue = remoteConfig.getBool(newColorEnabled);
      await prefs.setBool(newColorEnabled, newValue);
    });
    await remoteConfig.activate();
    return RemoteConfigService();
  }
}
