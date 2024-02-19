class Student {
  String? message;
  List<Data>? data;

  Student({this.message, this.data});

  Student.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? namaLengkap;
  String? kelas;
  String? noAbsen;
  String? tanggalLahir;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Data(
      {this.id,
      this.namaLengkap,
      this.kelas,
      this.noAbsen,
      this.tanggalLahir,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaLengkap = json['nama_lengkap'];
    kelas = json['kelas'];
    noAbsen = json['no_absen'];
    tanggalLahir = json['tanggal_lahir'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_lengkap'] = this.namaLengkap;
    data['kelas'] = this.kelas;
    data['no_absen'] = this.noAbsen;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
