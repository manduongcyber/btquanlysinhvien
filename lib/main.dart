void main(){  
  List<Map<String, dynamic>>? students=[
    {'hoten':'Pháp', 'Toan': 8.0, 'Ly': 9.0, 'Hoa':7.0},
    {'hoten':'Hà Lan', 'Toan': 8.5, 'Ly': 7.0, 'Hoa':9.0},
    {'hoten':'Anh', 'Toan': 6.5, 'Ly': 4.0, 'Hoa':8.0},
    {'hoten':'Đức', 'Toan': 5.5, 'Ly': 6.0, 'Hoa':7.5}
  ];
  double dtb =0;
  String xl="";
  double max=0.0;
  Map<String, dynamic> stdMax={'hoten':'', 'Toan': 0.0, 'Ly': 0.0, 'Hoa':0.0};
  
  //1.in ds sinhvietn
  print('Danh sách sinh viên:');
  for (var sv in students) {
    dtb = (sv['Toan'] + sv['Ly'] + sv['Hoa']) / 3; 
    if (dtb>9){
      xl="xuất sắc";
    }
    else if (dtb>=7){
      xl="Giỏi";
    }
    else if (dtb>=5){
      xl="Khá";
    }
    else  {
      xl="Kém";
    }
     //tìm sv có điểm tb cao nhất 
    if (dtb>max){
      max=dtb;
      stdMax['hoten']=sv['hoten'];
      stdMax['Toan']=sv['Toan'];
      stdMax['Ly']=sv['Ly'];
      stdMax['Hoa']=sv['Hoa'];
    }
    // In thông tin sinh viên
    print('Họ tên: ${sv['hoten']} | ĐTB: ${dtb.toStringAsFixed(2).toString()}  | xếp loại: $xl');
  } //end for
  //in sv có điểm cao nhất
  print("-----------------------------------------------------");
  print("Sinh viên có điểm trung bình cao nhất:");
  print('Họ tên: ${stdMax['hoten']} | ĐTB: ${dtb.toStringAsFixed(2)}  | xếp loại: $xl');        

}