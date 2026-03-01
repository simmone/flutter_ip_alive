import 'package:flutter_ip_alive/app/app.dart';
import 'package:flutter_ip_alive/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
