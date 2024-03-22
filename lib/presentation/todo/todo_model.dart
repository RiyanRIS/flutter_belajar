class Todo {
  int? status;
  String? message;
  TodoItem? data;

  Todo({this.status, this.message, this.data});

  Todo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? TodoItem?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final res = <String, dynamic>{};
    res['status'] = status;
    res['message'] = message;
    if (data != null) {
      res['data'] = data?.toJson();
    }
    return res;
  }
}

class Todos {
  int? status;
  String? message;
  List<TodoItem>? data;

  Todos({this.status, this.message, this.data});

  Todos.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TodoItem>[];
      json['data'].forEach((v) {
        data?.add(TodoItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final res = <String, dynamic>{};
    res['status'] = status;
    res['message'] = message;
    if (data != null) {
      res['data'] = data?.map((v) => v.toJson()).toList();
    }
    return res;
  }
}

class TodoItem {
  String sId = '';
  late String kegiatan;
  late String keterangan;
  late DateTime waktu;
  late String pelaksana;
  String? createdAt;
  String? updatedAt;

  TodoItem(
      {required this.sId,
      required this.kegiatan,
      required this.keterangan,
      required this.waktu,
      required this.pelaksana,
      this.createdAt,
      this.updatedAt});

  TodoItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    kegiatan = json['kegiatan'];
    keterangan = json['keterangan'];
    waktu = DateTime.parse(json['waktu']);
    pelaksana = json['pelaksana'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['kegiatan'] = kegiatan;
    data['keterangan'] = keterangan;
    data['waktu'] = waktu;
    data['pelaksana'] = pelaksana;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
