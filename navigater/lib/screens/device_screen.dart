import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  String platform = "";
  String data = "";

  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (kIsWeb) {
      //is it web platform (browser)
      platform = "web";
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      data = webBrowserInfo.toString();
    } else {
      if (defaultTargetPlatform == TargetPlatform.android) {
        platform = "android";
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        data = androidInfo.toString();
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        platform = "ios";
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        data = iosInfo.toString();
      } else if (defaultTargetPlatform == TargetPlatform.linux) {
        platform = "linux";
        LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
        data = linuxInfo.toString();
      } else if (defaultTargetPlatform == TargetPlatform.macOS) {
        platform = "macOS";
        MacOsDeviceInfo macInfo = await deviceInfo.macOsInfo;
        data = macInfo.toString();
      } else if (defaultTargetPlatform == TargetPlatform.windows) {
        platform = "windows";
        WindowsDeviceInfo winInfo = await deviceInfo.windowsInfo;
        data = winInfo.toString();
      } else {
        platform = "unknown";
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Device Info"),
        actions: [
          InkWell(
            onTap: () => Navigator.of(context).pushNamed("/welcome"),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.home),
            ),
          ),
        ], //() => Navigator.of(context).pushNamed("/info")
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Text("Platform: $platform"),
            Text(data),
          ],
        )),
      ),
    );
  }
}
