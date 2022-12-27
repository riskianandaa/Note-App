import 'package:flutter/foundation.dart';

class Config {
  static const baseUrl = 'http://34.128.80.67/api/';
  static const apiKey = 'rahasia';
  static const notificationChannelId = 'noteapp_channel_id';
  static const notificationChannelName = 'noteapp notification';
  static const notificationChannelDesc = 'noteapp notification';
  static const savedNotification = 'FCM_MESSAGE';
  static const timeout = kDebugMode ? 90 * 1000 : 10 * 1000;
}
