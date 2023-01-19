import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:offline_first/src/model/note.dart';
import 'package:offline_first/src/ui/note/view.dart';
import 'package:offline_first/src/ui/home/view_mode.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel.instance(),
      child: Consumer<HomeViewModel>(builder: (context, viewModel, child) {
        void addNote() {
          Random random = Random();
          int randomNumber = random.nextInt(1000);
          Note note = Note(contents: 'description: $randomNumber');
          viewModel.addNote(note);
        }

        void navigateToNote(Note note) async {
          bool? update = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailsNoteView(
                note: note,
              ),
            ),
          );

          if (update == true) {
            viewModel.getListNote();
          }
        }

        if (viewModel.uiState.loading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Notes',
            ),
          ),
          body: StreamBuilder<List<Note>>(
            stream: viewModel.uiState.notes,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      'No notes',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  );
                }

                List<Note> notes = snapshot.data!;

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Note note = notes[index];

                    return ListTile(
                      onTap: () {
                        navigateToNote(note);
                      },
                      leading: const Icon(Icons.note_outlined),
                      title: SizedBox(
                        height: 40,
                        child: Text(
                          'Note ${note.id}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => addNote(),
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
