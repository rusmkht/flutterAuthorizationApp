import 'package:authorization/app/app.dart';
import 'package:authorization/feature/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:authorization/services/locator_service.dart' as di_locator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di_locator.initLocator();
  runApp(const AuthorizationApp());
}
