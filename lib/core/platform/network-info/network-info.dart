import 'dart:io';
import 'inetwork-info.dart';

class NetworkInfo implements INetworkInfo {
  @override
  Future<bool> get isConnected async {
    try {
      final list = await InternetAddress.lookup('google.com');

      return list.isNotEmpty && list[0].rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    } catch (e) {
      return false;
    }
  }
}
