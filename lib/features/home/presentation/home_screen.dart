import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/features/home/presentation/home_controller.dart';

// Có 2 cách làm việc với riverpod phía screen
// Thường có thể thay thế StatelessWidget và StatefulWidget
// Bằng ConsumerWidget hoặc ConsumerStatefulWidget nhé
// Nhưng ở đây a sẽ chỉ bọc Widget phụ thuộc vào State thôi nhé
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Để ý ở đây a bọc Consumer
      // Nó sẽ có ref để mình làm việc với provider
      body: Consumer(
        builder: (context, ref, child) {
          // Dùng watch thì builder sẽ được gọi lại để render lại giao diện của thành phần bên trong
          // Mỗi khi mà state mà nó watch thay đổi nhé
          final value = ref.watch(homeControllerProvider);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [],),
              // Để ý value
              Text("Đây là giá trị state : $value", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),

              ElevatedButton(
                onPressed: () {
                  // red thì nó k lắng nghe để rebuild
                  // Đùng khi chỉ cần truy cập 1 lần
                  // Notifer chính là thằng controller đó
                  // Nó cặp với provider
                  // Vì thế nên nó gọi được hàm increase
                  ref.read(homeControllerProvider.notifier).increase();
                },
                child: Text("Tăng"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Tương tự nhá, ok ấn thử đi
                  ref.read(homeControllerProvider.notifier).increase();
                },
                child: Text("Giảm"),
              ),
            ],
          );
        },
      ),
    );
  }
}
