import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/database/app_database.dart';
import 'package:notes_app/database/database_provider.dart';

final notesStreamProvider = StreamProvider<List<Note>>((ref) {
  final database = ref.watch(databaseProvider);

  return database.select(database.notes).watch();
});
