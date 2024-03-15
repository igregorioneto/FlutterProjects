import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_with_riverpod/providers/notes/notes_view_options.dart';

final filterNotesProvider = ChangeNotifierProvider(
  (ref) => NotesFilterProvider(NotesViewOptions.inbox),
);

class NotesFilterProvider extends ValueNotifier<NotesViewOptions> {
  NotesFilterProvider(super.filter);

  toggle() {
    value = value == NotesViewOptions.inbox
        ? NotesViewOptions.archived
        : NotesViewOptions.inbox;
  }
}
