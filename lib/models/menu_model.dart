List<MenuModel> menuFromJson(dynamic res) {
  final data = res["result"]["data"];
  return List<MenuModel>.from(data.map((x) => MenuModel.fromJson(x)));
}

class MenuModel {
  int? id;
  String? nama;
  int? harga;
  String? gambar;
  int? jml;

  MenuModel({this.id, this.nama, this.harga, this.gambar, this.jml});
  MenuModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    nama = json['nama']?.toString();
    harga = json['harga']?.toInt();
    gambar = json['gambar']?.toString();
    jml = 0;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['harga'] = harga;
    data['gambar'] = gambar;
    data['jml'] = jml;
    return data;
  }
}
