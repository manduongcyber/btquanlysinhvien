
import 'dart:io';
void main(){  
  //1. khai báo danh sách sp
  List<Map<String, dynamic>>? products=[
    {'tensp':'Loa bluetooth', 'giatien': 500000.0, 'soluong': 5},
    {'tensp':'Sạc Anker 45w', 'giatien': 400000.0, 'soluong': 10},
    {'tensp':'Power banker', 'giatien': 1200000.0, 'soluong': 2},
    {'tensp':'Apple watch', 'giatien': 3000000.0, 'soluong': 3},
  ];
  String name="";
  bool flag=false;
  int soluong=0;
  int tonkho=0;

  //Hiển thị danh sách sp
  print("2. Danh sách sản phẩm tồn kho");
  //gọi hàm
  inSanpham(products);

  //3.tìm kiếm sp theo tên
  print("------------------------------------------");
  print("3. Tìm kiếm sản phẩm");
  print("Nhập sản phẩm cần tìm:");
  name = stdin.readLineSync()!;
  //gọi hàm
  timSanpham(products, name);

  //4.Bán sản phẩm
  flag=false;
  print("--------------------------------------------");
  print("4. Bán sản phẩm");
  print("Tên sản phẩm:");
  name = stdin.readLineSync()!;
  print("Số lượng:");
  soluong = int.parse(stdin.readLineSync()!);
  //gọi hàm
  xuatSanpham(products,name,soluong);
}

void inSanpham(List<Map<String, dynamic>> product){
  if (product.isNotEmpty){
    print("Tên sản phẩm\t\t | Giá tiền\t | Số lượng");
    for (var sp in product){
      print("${sp['tensp']}\t\t" + "| ${sp['giatien']}\t" + "| ${sp['soluong']}");
    }
  }
}

//hàm tìm sản phẩm
void timSanpham(List<Map<String, dynamic>> product,String tensp){
  bool flag=false;
  for (var sp in product){
    if (sp['tensp'].toString().contains(tensp)){
      print("Tìm thấy sản phẩm: ${sp['tensp']}\t\t" + "| ${sp['giatien']}\t" + "| ${sp['soluong']}");
      flag=true;
      break;
    }
  }
  if (flag==false){
    print("Không tìm thấy sản phẩm cần tìm!");
  }
}

//bán sản phẩm
void xuatSanpham(List<Map<String, dynamic>> product, String tensp, int soluong ){
  int tonkho=0;
  bool flag=false;

  if (!product.isEmpty){    
    for (var sp in product){
      if (sp['tensp'].toString().contains(tensp)){
        tonkho=sp['soluong'];
        if (tonkho >= soluong){
          sp['soluong']=sp['soluong']-soluong;
          print("Tồn kho ${sp['tensp']}" + " còn lại là: ${sp['soluong']}");
        }
        else{
          print("Không đủ hàng tồn kho!");
        }      
        flag=true;
        break;
      } //endif
    } //endfor
  }
  if (flag==false){  
    print("Không tìm thấy sản phẩm!");
  }  
}