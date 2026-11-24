import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/features/notes/providers/notes_providers.dart';

import './add_note_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('CatatanKu')),
      body: notes.when(
        data: (listCatatan) {
          if (listCatatan.isEmpty) {
            return const Center(child: Text('Belum ada catatan nih'));
          }
          return ListView.builder(
            itemCount: listCatatan.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(listCatatan[index].title));
            },
          );
        },
        error: ((error, stackTrace) {
          return Text('sedang error karena $error');
        }),
        loading: () {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: LinearProgressIndicator(),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (contex) => AddNotePage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
