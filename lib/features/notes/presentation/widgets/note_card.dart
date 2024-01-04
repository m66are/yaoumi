import 'package:flutter/material.dart';
import 'package:yaoumi/core/utils/extensions/context_ext.dart';
import 'package:yaoumi/core/utils/extensions/date_time_ext.dart';
import 'package:yaoumi/features/notes/domain/entities/note_entity.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});
  final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            note.title,
            style: context.textTheme.bodyLarge,
          ),
          Text(
            note.note,
            //  style: context.textTheme.bodyLarge,
          ),
          Text.rich(TextSpan(children: <InlineSpan>[
            WidgetSpan(
              child: Icon(
                Icons.watch_later_outlined,
                size: 17,
              ),
            ),
            WidgetSpan(
                child: SizedBox(
              width: 5,
            )),
            TextSpan(text: note.createdTime.readableFormat),
          ]))
        ],
      ),
    );
  }
}
