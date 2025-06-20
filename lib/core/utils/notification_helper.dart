// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

Future<void> showNotification(String title, String body) async {
  // Minta izin jika belum
  if (html.Notification.permission != 'granted') {
    await html.Notification.requestPermission();
  }

  if (html.Notification.permission == 'granted') {
    html.Notification(title,
        body: body, icon: 'icons/icon-512.png'); // ganti icon sesuai aset kamu
  }
}
