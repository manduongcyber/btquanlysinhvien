import 'dart:io';

class Student {
  String Hoten;
  double Toan;
  double Ly;
  double Hoa;

  Student({required this.Hoten, required this.Toan, required this.Ly, required this.Hoa});
  
  double diemTB(){
    return (Toan+Ly+Hoa)/3;
  }

  String xepLoai(){
    double dtb = diemTB(); 
    if (dtb>9){
      return "xuất sắc";
    }
    else if (dtb>=7){
      return "Giỏi";
    }
    else if (dtb>=5){
      return "Khá";
    }
    else  {
      return "Kém";
    }
  }

  //1. nhập sinhvien
  void input() {
    stdout.write('Họ tên sinh viên: ');
    Hoten = stdin.readLineSync()!;
    stdout.write('Toán: ');
    Toan = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0; //double.parse(stdin.readLineSync()!);
    stdout.write('Lý: ');
    Ly = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0; //double.parse(stdin.readLineSync()!);
    stdout.write('Hoá: ');
    Hoa = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0; //double.parse(stdin.readLineSync()!);
  }
  //2.Hiển thị ds sv
  void display() {
    print('Họ tên: ${this.Hoten}');
    print('Toán: ${this.Toan}');
    print('Lý: ${this.Ly}');
    print('Hoá: ${this.Hoa}');
    print('Điểm tb: ${this.diemTB()}');
    print('Xếp loại: ${this.xepLoai()}');
    print('-------------------');
  }

  //3.Điểm tb max
  void timSV(List<Student> students){
     var student = students.reduce((a, b) => a.diemTB() > b.diemTB() ? a : b);
      print("Học sinh có điểm trung bình cao nhất là: ${student.Hoten} | ${student.diemTB()}");      
  }
}

void main() {
  List<Student> students = [];
  while (true) {
    print('\n===== QUẢN LÝ SINH VIÊN =====');
    print('1. Thêm sinh viên');
    print('2. Hiển thị danh sách sinh viên');
    print('3. Tìm kiếm sinh viên có điểm cao nhất');
    print('0. Thoát');

    stdout.write('Chọn chức năng: ');
    int choice = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    switch (choice) {
      //1. Nhập sv
      case 1:
        Student? student=Student(Hoten: '', Toan: 0.0, Ly: 0.0, Hoa: 0.0);
        student.input();
        students.add(student);
        break;

      case 2:
        //2.Hiển thị ds sv
        if (students.isEmpty) {
          print('Không có sinh viên!.');
        } else {
          print('\nDanh sách sinh viên:');
          for (Student student in students) {
            student.display();            
          }
        }
        break;

      case 3:
        //3.tìm sv có điểm tb cao nhất
        Student student=Student(Hoten: '', Toan: 0.0, Ly: 0.0, Hoa: 0.0); 
        student.timSV(students);
        /*
        double max=0.0;
        Student svMax=Student(Hoten: '', Toan: 0.0, Ly: 0.0, Hoa: 0.0);        
        for (Student student in students) {
          if (student.diemTB() >= max) {
            max=student.diemTB();
            svMax=student;
          }
        }
        if (students.isNotEmpty) {
          print('Sinh viên có điểm cao nhất:');
          svMax.display();         
          break;
        }*/
        break;
      case 0:
        print('Thoát!');
        return;

      default:
        print('Lựa chọn không hợp lệ.');
    }
  }
}