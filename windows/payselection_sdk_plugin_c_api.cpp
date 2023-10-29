#include "include/payselection_sdk/payselection_sdk_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "payselection_sdk_plugin.h"

void PayselectionSdkPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  payselection_sdk::PayselectionSdkPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
