import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:navigater/widgets/menuItem.dart';

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
        title: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: const Text("Device Info")),
        actions: [
          InkWell(
            onTap: () => Navigator.of(context).pushNamed("/anaekran"),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/turnleft.svg",
                    height: 15,
                    colorFilter:
                        ColorFilter.mode(Colors.blueGrey, BlendMode.srcIn),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),
                    ),
                    /*child: Text(
                      'Back',
                      style: TextStyle(color: Colors.white),
                    ),*/
                  ),
                ],
              ),
            ),
          ),
        ], //() => Navigator.of(context).pushNamed("/info")
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin:EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(25),
                            ),
                  child: MenuItem(
                    icon: Icon(Icons.devices),
                    title: "Platform: $platform",
                    onTap: () {},
                  ),
                ),
                Gap(5),
                Container(
                  padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(25),
                            ),
                  child: MenuItem(
                    icon: Icon(Icons.data_usage),
                    title: (data),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
