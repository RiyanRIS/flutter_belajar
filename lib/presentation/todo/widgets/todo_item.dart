import 'package:latihan_getx/app/data/models/todo_model.dart';

List<TodoItem> todoItems = [
  TodoItem(
    id: 1,
    kegiatan: 'Belajar Flutter',
    keterangan: 'Mempelajari dasar-dasar Flutter',
    waktu: DateTime.now(),
    pelaksana: 'John Doe',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  TodoItem(
    id: 2,
    kegiatan: 'Olahraga',
    keterangan: 'Jogging selama 30 menit',
    waktu: DateTime.now().add(const Duration(days: 1)),
    pelaksana: 'Jane Doe',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];
