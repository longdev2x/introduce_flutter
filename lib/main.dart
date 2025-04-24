import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/features/login/presentation/login_screen.dart';

// Luồng chạy
void main() {
  // Cứ hiểu đây là cú pháp cơ bản là dc
  // ProviderScope là của Riverpod, nó bọc toàn bộ cây Widget
  // Làm việc với Riverpod sẽ tránh phụ thuộc vào context
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( // Theme mode cho ứng dụng
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Demo thì vậy, sau dùng go Router sẽ có sự đổi khác nhé
      // Hiểu cơ bản thì LoginScreen sẽ được bật lên đầu tiên
      home: LoginScreen(),
    );
  }
}