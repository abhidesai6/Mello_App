// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// NotificationDetails get _noSound {
//   final androidChannelSpecifics = AndroidNotificationDetails(
//     'silent channel id',
//     'silent channel name',
//     'silent channel description',
//     playSound: false,
//   );
//   final iOSChannelSpecifics = IOSNotificationDetails(presentSound: false);

//   return NotificationDetails(
//       android: androidChannelSpecifics, iOS: iOSChannelSpecifics);
// }

// Future showSilentNotification(
//   FlutterLocalNotificationsPlugin notifications, {
//   @required String title,
//   @required String body,
//   int id = 0,
// }) =>
//     _showNotification(notifications,
//         title: title, body: body, id: id, type: _noSound);

// Future<NotificationDetails> get _ongoing async {
//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails('repeating channel id',
//           'repeating channel name', 'repeating description');
//   const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeating title',
//       'repeating body', RepeatInterval.everyMinute, platformChannelSpecifics,
//       androidAllowWhileIdle: true);
//   final iOSChannelSpecifics = IOSNotificationDetails();
//   return NotificationDetails(
//       android: androidPlatformChannelSpecifics, iOS: iOSChannelSpecifics);
// }

// Future showOngoingNotification(
//   FlutterLocalNotificationsPlugin notifications, {
//   @required String title,
//   @required String body,
//   int id = 0,
// }) =>
//     _showNotification(notifications,
//         title: title, body: body, id: id, type: _ongoing);

// Future _showNotification(
//   FlutterLocalNotificationsPlugin notifications, {
//   @required String title,
//   @required String body,
//   @required NotificationDetails type,
//   int id = 0,
// }) =>
//     notifications.show(id, title, body, type);
