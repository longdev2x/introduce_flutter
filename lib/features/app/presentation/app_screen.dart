import 'package:flutter/material.dart';
import 'package:test_project/features/home/presentation/home_screen.dart';

// đây là demo Statefull nhé
// Hàm build của Stateful sẽ có thể được gọi lại nhiều lần
// Thông qua setState (sau dùng riverpod sẽ k dùng)
// Anh demo hểu bản chất thôi
// Chú để ý nó có hàm createState nó return 1 instance là state của nó luôn

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

// Class này là State của AppScreen
class _AppScreenState extends State<AppScreen> {
  int _selectedIndex = 0;

  // Hàm này chỉ được gọi 1 lần khi widget được insert vào cây widget
  @override
  void initState() {
    super.initState();
    // Thường dùng để khởi tạo các giá trị ban đầu
  }

  // Hàm này gọi sau initState,
  // cũng gọi lại khi dependencies thay đổi
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  // Gọi khi widget cha rebuild,
  //cần update lại widget con
  // Sẽ có trường hợp khi thằng AppScreen được khởi tạo lại Instance mới
  // Flutter giữ lại State nên cần hàm này để update các value bên trong State
  @override
  void didUpdateWidget(covariant AppScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  // Widget bị huỷ, thường dùng để huỷ controller, stream,...
  @override
  void dispose() {
    super.dispose();
  }

  // Hàm dùng để đổi tab
  void _onTabSelected(int index) {
    // Cập nhật lại trạng thái dùng setState
    // Gọi hàm setState nó sẽ gọi lại hàm build
    // -> xây dựng lại giao diện
    setState(() {
      _selectedIndex = index;
    });
  }

  // Danh sách các widget tương ứng với từng tab
  // Chính màn hình tương ứng với Bottom Nav
  final List<Widget> _screens = [
    Center(child: HomeScreen()),
    Center(child: Text('Tìm kiếm')),
    Center(child: Text('Cài đặt')),
  ];

  // Hàm build render giao diện đây
  @override
  Widget build(BuildContext context) {
    //build được gọi: mỗi khi gọi setState hoặc rebuild
    return Scaffold(
      extendBody: true, // Để body chiếm tối đa không gian (vì k dùng appBar)
      body: _screens[_selectedIndex], // List (array) bên trên đó, mấy cú pháp này học Dart nhé, na ná java
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // chỉ định tab đang chọn
        onTap: _onTabSelected, // hàm xử lý khi người dùng chọn tab, nó trả về index đc chọn
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Tìm kiếm",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Cài đặt",
          ),
        ],
      ),
    );
  }
}
