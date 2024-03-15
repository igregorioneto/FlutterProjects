import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_with_riverpod/providers/notes/notes_view_options.dart';

final notesViewModeProvider = ChangeNotifierProvider(
  (ref) => NotesViewModeProvider(NotesViewOptions.grid),
);

class NotesViewModeProvider extends ValueNotifier<NotesViewOptions> {
  NotesViewModeProvider(super.mode);

  toggle() {
    value = value == NotesViewOptions.column
        ? NotesViewOptions.grid
        : NotesViewOptions.column;
  }
}
