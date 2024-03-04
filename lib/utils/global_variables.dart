import "package:flutter/material.dart";
import "package:zen_app/screens/home_screen.dart";
import "package:zen_app/screens/qrcode_screen.dart";
import "package:zen_app/screens/settings_screen.dart";

const webscreenSize = 600;

List<Widget> homeScreenItems = [
  HomeScreen(), 
  QrcodeScreen(), 
  SettingsScreen()
  ];
