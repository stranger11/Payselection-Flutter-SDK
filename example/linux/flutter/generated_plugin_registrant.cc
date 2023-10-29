//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <payselection_sdk/payselection_sdk_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) payselection_sdk_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PayselectionSdkPlugin");
  payselection_sdk_plugin_register_with_registrar(payselection_sdk_registrar);
}
