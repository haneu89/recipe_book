package com.example.recipe_book;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity implements PluginRegistry.PluginRegistrantCallback {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
  }

  @Override
  public void registerWith(PluginRegistry pluginRegistry) {
    GeneratedPluginRegistrant.registerWith(pluginRegistry);
  }
}
