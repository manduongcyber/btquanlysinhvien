import 'dart:io';
 // Danh sách giỏ hàng chứa các Map sản phẩm
  List<Map<String, dynamic>> gioHang = [{'ten':'','gia':0.0,'soLuong':0}];

void main() {
  while (true) {
    print('\n================ QUẢN LÝ GIỎ HÀNG ================');
    print('1. Thêm sản phẩm');
    print('2. Xem giỏ hàng');
    print('3. Sửa số lượng');
    print('4. Xóa sản phẩm');
    print('5. Thoát');
    stdout.write('Chọn chức năng (1-5): ');
    
    int chon = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    
    switch (chon) {
      case 1: themVaoGioHang(); break;
      case 2: hienThiGioHang(); break;
      case 3: suaGioHang(); break;
      case 4: xoaKhoiGioHang(); break;
      case 5: print('Bye!'); return;
    }
  }
}

// 1. Hàm thêm sản phẩm vào giỏ hàng
void themVaoGioHang() {
  print('\n--- NHẬP THÔNG TIN SẢN PHẨM ---');
  stdout.write('Tên sản phẩm: ');
  String ten = stdin.readLineSync() ?? 'chưa phân loại';

  stdout.write('Giá tiền: ');
  double gia = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

  stdout.write('Số lượng mua: ');
  int soLuong = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  // Kiểm tra nếu sp có rồi, cộng dồn
  var spTrungTen = gioHang.firstWhere(
    (sp) => sp['ten'].toString().toLowerCase() == ten.toLowerCase(), 
    orElse: () => {}
  );

  if (spTrungTen.isNotEmpty) {
    spTrungTen['soLuong'] += soLuong;
  } else {
    // thêm mới
    gioHang.add({'ten': ten, 'gia': gia,'soLuong': soLuong,});
  }
}

// 2. Hàm hiển thị giỏ hàng và tính tổng tiền hóa đơn
void hienThiGioHang() {
  print('\n--- GIỎ HÀNG CỦA BẠN ---');
  //
  for (int i = 0; i < gioHang.length; i++) {
    var sp = gioHang[i];
    double thanhTien = sp['gia'] * sp['soLuong'];
    print('[${i + 1}] Tên: ${sp['ten']} | Giá: ${sp['gia']}đ | Số lượng: ${sp['soLuong']} | Thành tiền: ${thanhTien}đ');
  }  
  print('=> TỔNG TIỀN HÓA ĐƠN: ${tinhTongTien()}đ');
}

// Hàm tính tổng tiền
double tinhTongTien() {
  double tong = 0;
  for (var sp in gioHang) {
    tong += sp['gia'] * sp['soLuong'];
  }
  return tong;
}

// 3. Hàm sửa số lượng sản phẩm trong giỏ hàng
void suaGioHang() {
  stdout.write('Tên sản phẩm cần sửa: ');
  String tenInput = stdin.readLineSync() ?? '';

  var spTrongGio = gioHang.firstWhere(
    (sp) => sp['ten'].toString().toLowerCase() == tenInput.toLowerCase(), 
    orElse: () => {}
  );

  if (spTrongGio.isEmpty) {
    print('Không tìm thấy sản phẩm này trong giỏ hàng!');
    return;
  }
  stdout.write('Số lượng mới: ');
  int soLuongMoi = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  spTrongGio['soLuong'] = soLuongMoi;
}

// 4. Hàm xóa sản phẩm khỏi giỏ hàng
void xoaKhoiGioHang() {  
  stdout.write('Tên sản phẩm muốn xóa: ');
  String tenInput = stdin.readLineSync() ?? '';

  int doDaiTruoc = gioHang.length;
  // Xóa sản phẩm dựa theo tên (không phân biệt chữ hoa chữ thường)
  gioHang.removeWhere((sp) => sp['ten'].toString().toLowerCase() == tenInput.toLowerCase());

  if (gioHang.length < doDaiTruoc) {
    print('Đã xóa.');
  } else {
    print('Không tìm thấy sản phẩm này trong giỏ hàng!');
  }
}