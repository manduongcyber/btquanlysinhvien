
import 'dart:io';

class Product{
  String tensp;
  double giatien;
  int soluong;

  Product(this.tensp, this.giatien, this.soluong);
  
  //1.thêm sản phẩm
  void themSP(){
    stdout.write('Tên sp: ');
    tensp = stdin.readLineSync()!;
    stdout.write('Giá tiền: ');
    giatien = double.parse(stdin.readLineSync()!);
    stdout.write('Số lượng: ');
    soluong = int.parse(stdin.readLineSync()!);
  }
  //2. hiển thị danh sách
  void showSP(){
    print('Tên sp: ${this.tensp}');
    print('Giá tiền: ${this.giatien}');
    print('Tồn kho: ${this.soluong}');
  }  
}

void main(){  
  //1. khai báo danh sách sp
  List<Product>? products=[];  

  while (true) {
    print('\n===== QUẢN LÝ SP =====');
    print('1. Thêm sp');
    print('2. Hiển thị danh sách sp');
    print('3. Tìm kiếm sp theo tên');
    print('4. Bán sp');
    print('0. Thoát');
    print('======================');

    stdout.write('Chọn chức năng: ');
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
    case 1:
      //1.Nhập
      Product sp=Product('', 0.0, 0);
      sp.themSP();
      products.add(sp);
      break;
    
    case 2:
      //2.show sp
      for (Product sp in products){
        sp.showSP();
      }
    case 3:
      //3.tìm sp
      bool flag=false;
      print("Nhập tên sp cần tìm:");
      String ten=stdin.readLineSync()!;
      for (Product sp in products){
        if (sp.tensp.contains(ten)){
          flag=true;
          print("Tìm thấy sp: ${sp.tensp} giá bán: ${sp.giatien} tồn kho: ${sp.soluong}");
          break;
        }
      }
      if(!flag){
        print("Không tìm thấy sp");
      }
      break;
    case 4:
      //4.bán sp
      print("Tên sp:");
      String ten=stdin.readLineSync()!;
      print("Số lượng:");
      int sl=int.parse(stdin.readLineSync()!);
      //
      for (Product sp in products){
        if (sp.tensp.toString().contains(ten)){
          if (sl<= sp.soluong) {
            sp.soluong = sp.soluong - sl;
            print("Đã bán sp: ${sp.tensp} | tồn kho: ${sp.soluong}");
            break;
          }
          else{
            print("Không đủ tồn kho!");
            break;
          }
        }
      }
      break;
    case 0:
        print('Thoát!');
        return;
    }
  }
}