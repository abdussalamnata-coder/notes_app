import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:notes_app/database/database_provider.dart';

class AddNotePage extends ConsumerStatefulWidget {
  const AddNotePage({super.key});

  @override
  ConsumerState<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends ConsumerState<AddNotePage> {
  final TextEditingController judulCatatan = TextEditingController();
  final TextEditingController isiCatatan = TextEditingController();

  @override
  void dispose() {
    judulCatatan.dispose();
    isiCatatan.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Catatan'),
        actions: [
          IconButton(
            onPressed: () {
              // final database = ref.read(databaseProvider);
            },
            icon: Icon(Icons.check_circle),
            iconSize: 44,
            color: Colors.green,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 10, 24, 10),
                  child: TextField(
                    controller: judulCatatan,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: 'Isi Judul Nya Disini',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: TextField(
                    maxLines: null,
                    controller: isiCatatan,
                    decoration: InputDecoration(
                      border: InputBorder.none,

                      hintText: 'Ada note apa untuk hari ini',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
