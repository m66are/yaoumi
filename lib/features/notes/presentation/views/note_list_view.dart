import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaoumi/features/notes/domain/entities/note_entity.dart';
import 'package:yaoumi/features/notes/presentation/bloc/notes/notes_bloc.dart';
import 'package:yaoumi/features/notes/presentation/widgets/note_card.dart';

class NoteListView extends StatefulWidget {
  const NoteListView({super.key});

  @override
  State<NoteListView> createState() => _NoteListViewState();
}

class _NoteListViewState extends State<NoteListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        elevation: 1,
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNoteSheet(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> _addNoteSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Title"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(),
                SizedBox(
                  height: 20,
                ),
                Text("Content"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(),
                SizedBox(
                  height: 25,
                ),
                TextButton(
                    onPressed: () {
                      BlocProvider.of<NotesBloc>(context).add(AddNote(
                          note: NoteEntity(
                              id: 5,
                              note: "note",
                              title: "titleLarge",
                              createdTime: DateTime.now(),
                              lastUpdatedTime: DateTime.now())));
                    },
                    child: Container(
                        alignment: Alignment.center, child: Text("Add")))
              ],
            ),
          );
        });
  }

  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          BlocBuilder<NotesBloc, NotesState>(
            builder: (BuildContext context, NotesState state) {
              if (state is NotesLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: List.generate(state.notes.length, (int index) {
                        final NoteEntity element = state.notes[index];
                        return NoteCard(note: element);
                      }),
                    ),
                  ],
                );
              }
              if (state is NotesLoading) {
                return Container(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
