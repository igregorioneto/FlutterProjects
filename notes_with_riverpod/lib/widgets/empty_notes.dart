import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_with_riverpod/providers/notes/notes_view_options.dart';
import 'package:notes_with_riverpod/providers/notes/view_filtered_provider.dart';

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final viewOption = ref.watch(filterNotesProvider).value;
        final String noteType = viewOption == NotesViewOptions.archived
            ? 'Nenhuma nota arquivada.'
            : 'Crie sua primeira nota!';

        return Column(
          children: [
            Image.asset('assets/empty_notes.png'),
            Text(
              noteType,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        );
      },
    );
  }
}
