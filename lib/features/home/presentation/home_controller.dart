import 'package:flutter_riverpod/flutter_riverpod.dart';

// Đây là 1 dạng cơ bản của Riverpod nhé
// Riverpod 7 dạng cơ nên chịu khó làm dần rồi biết nhé
// ĐỌc : https://riverpod.dev/docs/introduction/getting_started
// StateNotifier là 1 notifier, nó cặp với provider nhé
class HomeController extends StateNotifier<int> {
  // State ở đây là int, được quản lý bởi notifier
  // Sau sẽ quản lý được cả Object nhé
  // <int> thì có nghĩa state là 1 int
  // Khởi tạo giá trị ban đầu dc truyền vào trừ provider
  HomeController(super.state);

  // Hàm tăng giá trị
  void increase() {
    // Truy cập vào state
    state = state + 1;
  }
  // Hàm giảm giá trị
  void decrease() {
    state = state - 1;
  }
}

// Tìm hiểu vể ref trong riverpod nhé
// provider này quản có thể được gọi bằng ref nhé.
//
final homeControllerProvider = StateNotifierProvider.autoDispose<HomeController, int>(
  (ref) {
    // Truyền vào giá trị ban đầu của state nhé
    return HomeController(5);
  },
);
