import 'package:flutter/material.dart';
import 'package:test_project/features/app/presentation/app_screen.dart';

//Đây là 1 Widget
//Mọi Widget trong flutter đều extends abstract class StatelessWidget hoặc StatefulWidget
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // Hàm build của class cha để Render giao diện
  // Với stateless hàm build sẽ không bao giờ được gọi lại
  // -> đây là màn hình tĩnh.
  // Màn App anh sẽ ví dụ với Stateful
  // Màn Home anh sẽ dùng Riverpod (StateManagement)
  // Khi dùng Riverpod thì nó sẽ cập nhật giao diện bằng cách khác
  @override
  Widget build(BuildContext context) {
    // Layer screen nào cũng cần bọc thằng này, nó là 1 khung sườn
    // Còn các Widget bên trong screen không cần
    // Flutter chồng các layer màn hình lên nhau khi navigate
    // Pop thì sẽ bỏ layer phía trên đi, kiểu vậy.
    return Scaffold(
      // Tất nhiên là nó sẽ có các thuộc tính phía trong
      // Khá giống Kotlin, đọc cũng hiểu nó làm gì ha
      // appBar là phần phía trên, appBar
      // Cơ bản mình sẽ dùng AppBar, custom hơn thì có PreferredSize
      appBar: AppBar(
        // Chạy để biết nó là gì nhé
        leading: Icon(Icons.star),
        title: Text("Đây là appBar"),
        actions: [
          IconButton(
            onPressed: () {
              // Check ở console log nhé.
              print("Nút này bấm dc");
            },
            icon: Icon(Icons.abc),
          ),
          Icon(Icons.add_card),
        ],
      ),
      // Đây là phần thân nhé
      // Tìm hiểu về các Widget cơ bản trong flutter nhé
      body: Column(
        // Căn chỉnh, main là theo chiều của Column dọc (Row thì ngang)
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end, // Căn chiều vuông góc với main
        children: [
          // Column chứa được nhiều Widget khác, giống Kotlin
          CircleAvatar(
            backgroundColor: Colors.yellow,
            radius: 100,
            child: Text("Widget CircleAvatar bọc WidgetText"),
          ),
          SizedBox(height: 50), // Dùng tạo khoảng cách
          TextField(
            // TextField
            decoration: InputDecoration(
              hintText: "Tài khoản",
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            // Giống textField nhưng nhiều cái mạnh hơn, đặc biệt là validate
            decoration: InputDecoration(
              hintText: "Tài khoản",
            ),
          ),
          // 1 loại nút, nhưng trong dự án sẽ dùng CustomButton
          ElevatedButton(
            onPressed: () {
              //trong flutter mấy cái có chữ on ở đầu
              // nó là callback function nhé, nhận sự kiện từ người dùng
              // TextField và TextFormFiled có controller để lấy và xử lý text
              // Tự tìm hiểu thêm nhé, có nhiều cách nhưng thường sẽ dùng controller
              // còn dưới là navigate lại cơ bản, sau sẽ dùng GoRouter, cần tự tìm hiểu sau anh demo

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    //Navigate tới AppScreen
                    // Dùng gorouter thì sẽ quản lý khá giống kotlin
                    return AppScreen();
                  },
                ),
              );
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
