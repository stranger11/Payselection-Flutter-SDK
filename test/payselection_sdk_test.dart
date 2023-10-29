// import 'package:flutter_test/flutter_test.dart';
// import 'package:payselection_sdk/payselection_sdk.dart';
// import 'package:payselection_sdk/payselection_sdk_platform_interface.dart';
// import 'package:payselection_sdk/payselection_sdk_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockPayselectionSdkPlatform
//     with MockPlatformInterfaceMixin
//     implements PayselectionSdkPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final PayselectionSdkPlatform initialPlatform = PayselectionSdkPlatform.instance;
//
//   test('$MethodChannelPayselectionSdk is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelPayselectionSdk>());
//   });
//
//   test('getPlatformVersion', () async {
//     PayselectionSdk payselectionSdkPlugin = PayselectionSdk();
//     MockPayselectionSdkPlatform fakePlatform = MockPayselectionSdkPlatform();
//     PayselectionSdkPlatform.instance = fakePlatform;
//
//     expect(await payselectionSdkPlugin.getPlatformVersion(), '42');
//   });
// }
