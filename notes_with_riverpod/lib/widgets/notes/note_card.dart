import 'package:flutter/material.dart';
import 'package:notes_with_riverpod/models/note.dart';
import 'package:notes_with_riverpod/pages/notes_details_page.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  const NoteCard({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NotesDetailsPage(note: note),
          ),
        ),
        borderRadius: BorderRadius.circular(16.0),
        splashColor: note.color.shade100,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(height: 16),
              Container(
                constraints: const BoxConstraints(
                  maxHeight: 150,
                  minHeight: 0,
                ),
                clipBehavior: Clip.none,
                child: Text(
                  note.description,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
