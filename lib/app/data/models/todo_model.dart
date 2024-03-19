class TodoItem {
  int id;
  String kegiatan;
  String keterangan;
  DateTime waktu;
  String pelaksana;
  DateTime createdAt;
  DateTime updatedAt;

  TodoItem({
    required this.id,
    required this.kegiatan,
    required this.keterangan,
    required this.waktu,
    required this.pelaksana,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      id: json['id'],
      kegiatan: json['kegiatan'],
      keterangan: json['keterangan'],
      waktu: DateTime.parse(json['waktu']),
      pelaksana: json['pelaksana'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kegiatan': kegiatan,
      'keterangan': keterangan,
      'waktu': waktu.toIso8601String(),
      'pelaksana': pelaksana,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
