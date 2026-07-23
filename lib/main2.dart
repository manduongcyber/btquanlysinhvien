void main(){
  Map<String, dynamic> order={
    'tensp':'Beer Tiger bạc',
    'soluong': 20.0,
    'dongia': 50000
  };
  tinhTien(order);
}

 void tinhTien(Map od){
  double tTien=0, CK=0, ttVAT=0, VAT=0;
  tTien= od['soluong']*od['dongia'];  
  //xét discount
  if (tTien>=1000000){
    CK=tTien*0.1 ;    
  }
  else if (tTien>=500000){
    CK=tTien*0.05;
  }
  else{
    CK=0;
  }
  //thuế vat
  VAT=(tTien-CK)*0.08;
  //thành tiền sau thuế và ck
  ttVAT=  tTien-CK +VAT;
  //In kết quả
  print('Tên sản phẩm\t\t' + 'Số lượng\t' +  'Đơn giá');
  print(od['tensp'] + '\t\t' + od['soluong'].toString() + '\t\t' +  od['dongia'].toString());
  print('Thành tiền\t\t' + 'Giảm giá\t' +  'VAT \t\t' + 'Thanh toán');
  print(tTien.toString() + '\t\t' + CK.toString() + '\t' + VAT.toString() + '\t\t' + ttVAT.toString());  
}