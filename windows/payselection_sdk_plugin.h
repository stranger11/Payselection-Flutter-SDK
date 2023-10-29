#ifndef FLUTTER_PLUGIN_PAYSELECTION_SDK_PLUGIN_H_
#define FLUTTER_PLUGIN_PAYSELECTION_SDK_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace payselection_sdk {

class PayselectionSdkPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PayselectionSdkPlugin();

  virtual ~PayselectionSdkPlugin();

  // Disallow copy and assign.
  PayselectionSdkPlugin(const PayselectionSdkPlugin&) = delete;
  PayselectionSdkPlugin& operator=(const PayselectionSdkPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace payselection_sdk

#endif  // FLUTTER_PLUGIN_PAYSELECTION_SDK_PLUGIN_H_
