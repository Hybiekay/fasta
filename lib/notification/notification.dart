import 'package:awesome_notifications/awesome_notifications.dart';

class Notify {
  static int _createUniquedId() {
    return DateTime.now().microsecondsSinceEpoch.remainder(100000);
  }

  static Future<void> sendNotice(
      {required String title, required String body}) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: _createUniquedId(),
            channelKey: "fasta_key",
            title: title,
            body: body));
  }
}
