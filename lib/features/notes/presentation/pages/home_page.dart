import 'package:material_ui/material_ui.dart';

import './add_note_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CatatanKu')),
      body: const Center(child: Text('Belum ada catatan')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => AddNotePage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
