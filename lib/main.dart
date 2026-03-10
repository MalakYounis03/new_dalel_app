import 'package:dalel_app/app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/app/core/service/service_locator.dart';
import 'package:dalel_app/app/core/widgets/check_state_changes.dart';
import 'package:dalel_app/app/my_app.dart';
import 'package:dalel_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  await getIt<CacheHelper>().init();
  checkStateChanges();
  runApp(const MyApp());
}
