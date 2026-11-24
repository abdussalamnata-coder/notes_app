import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import './tables/notes.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Notes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'catatanKu'));

  @override
  int get schemaVersion => 1;

  Future<void> tambahCatatanBaru(String title, String content) async {
    final data = NotesCompanion.insert(title: title, content: content);

    await into(notes).insert(data);
  }

  Future<List<Note>> ambilSemuaCatatan() async {
    return await select(notes).get();
  }

 
}
