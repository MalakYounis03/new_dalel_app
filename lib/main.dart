import 'package:dalel_app/app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/app/core/service/service_locator.dart';
import 'package:dalel_app/app/core/widgets/check_state_changes.dart';
import 'package:dalel_app/app/my_app.dart';
import 'package:dalel_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  setupLocator();
  await getIt<CacheHelper>().init();
  checkStateChanges();
  runApp(const MyApp());
}
