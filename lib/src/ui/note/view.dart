import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:offline_first/src/model/note.dart';
import 'package:offline_first/src/ui/note/view_mode.dart';

class DetailsNoteView extends StatefulWidget {
  final Note note;
  const DetailsNoteView({
    super.key,
    required this.note,
  });

  @override
  State<DetailsNoteView> createState() => _DetailsNoteViewState();
}

class _DetailsNoteViewState extends State<DetailsNoteView> {
  final _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _noteController.text = widget.note.contents;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteViewModel.instance(),
      child: Consumer<NoteViewModel>(builder: (context, viewModel, child) {
        void saveNote() {
          widget.note.contents = _noteController.text;
          viewModel.saveNote(widget.note);
        }

        void deleteNote() {
          viewModel.deleteNote(widget.note.id!);

          viewModel.deleted.listen((deleted) {
            if (deleted) {
              Navigator.of(context).pop(true);
            }
          });
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
            title: Text(
              widget.note.id.toString(),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.save),
                onPressed: () => saveNote(),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => deleteNote(),
              ),
            ],
          ),
          body: Container(
            margin: const EdgeInsets.all(20.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: _noteController,
              maxLines: 4,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Description',
              ),
            ),
          ),
        );
      }),
    );
  }
}
