package com.example.recipe_book;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.os.Build;
import android.os.Bundle;

import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class MainActivity extends FlutterActivity implements PluginRegistry.PluginRegistrantCallback {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            String id = "default";
            String name = "22";
            String description = "33";

            NotificationChannel mChannel = new NotificationChannel(id, name, NotificationManager.IMPORTANCE_HIGH);
            mChannel.setDescription(description);

            NotificationManager notificationManager = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);

            notificationManager.createNotificationChannel(mChannel);

            Notification notification = new NotificationCompat.Builder(getApplicationContext(), "channel01")
                    .setSmallIcon(android.R.drawable.ic_dialog_info)
                    .setContentTitle("Test")
                    .setContentText("You see me!")
                    .setDefaults(Notification.DEFAULT_ALL)
                    .setPriority(NotificationCompat.PRIORITY_MAX)   // heads-up
                    .build();

            notificationManager.notify(0, notification);

        } else {
            // No-op
        }


        new MethodChannel(getFlutterView(), "notification").setMethodCallHandler(
                new MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, Result result) {
                        if (call.method.equals("registerChannel")) {
                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                                String id = call.argument("id");
                                String name = call.argument("name");
                                String description = call.argument("description");

                                NotificationChannel mChannel = new NotificationChannel(id, name, NotificationManager.IMPORTANCE_HIGH);
                                mChannel.setDescription(description);

                                NotificationManager notificationManager = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);

                                notificationManager.createNotificationChannel(mChannel);

                                Notification notification = new NotificationCompat.Builder(getApplicationContext(), "channel01")
                                        .setSmallIcon(android.R.drawable.ic_dialog_info)
                                        .setContentTitle("Test")
                                        .setContentText("You see me!")
                                        .setDefaults(Notification.DEFAULT_ALL)
                                        .setPriority(NotificationCompat.PRIORITY_MAX)   // heads-up
                                        .build();

                                notificationManager.notify(0, notification);

                                result.success("Notification channel " + name + " created");
                            } else {
                                // No-op
                                result.success("Android version is less than Oreo");
                            }
                        }
                    }
                }
        );
}

    @Override
    public void registerWith(PluginRegistry pluginRegistry) {
        GeneratedPluginRegistrant.registerWith(pluginRegistry);
    }
}
