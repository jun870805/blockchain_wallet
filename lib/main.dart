import 'package:blockchain_wallet/app.dart';
import 'package:blockchain_wallet/core/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化持久化工具
  await SharedPreferencesUtil.instance.init();

  runApp(const ProviderScope(child: MyApp()));
}
