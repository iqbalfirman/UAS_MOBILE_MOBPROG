class ItemMenuModel {
  int? id;
  String? nama;
  int? harga;
  int? jml;

  ItemMenuModel({this.id, this.nama, this.harga, this.jml});
  ItemMenuModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    nama = json['nama']?.toString();
    harga = json['harga']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['harga'] = harga;
    data['jml'] = jml;
    return data;
  }
}
