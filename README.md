# test_project

A new Flutter project.

## Getting Started

Vào chạy lệnh "flutter pub get" cho anh trước khi chạy dự án nhé


// Tạm để ý mỗi folder lib thôi nhé
// Mính vẽ viết code ở đây

Đọc từ file

main.dart -> login_screen.dart -> app_screen.dart -> home_seen.dart(đọc song song với home_controller.dart)

// Ngoài lib thì còn có 1 vài chỗ quan trọng

- folder assets chứa icon, images, fonts....
- pubspec.yaml chứ toàn bộ thông tin project, package ...
- core kia là cấu trúc dự án theo chuẩn clean architecture nhé
- ApiClient → RemoteDataSource → Repository → Usecase ( có thể bỏ qua ) → Controller → UI