import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_with_riverpod/models/note.dart';
import 'package:notes_with_riverpod/providers/notes/notes_view_options.dart';
import 'package:notes_with_riverpod/providers/notes/view_filtered_provider.dart';

final notesRepositoryProvider =
    StateNotifierProvider<NotesRepository, List<Note>>(
        (ref) => NotesRepository());

final notesListProvider = Provider((ref) {
  final NotesViewOptions viewOption = ref.watch(filterNotesProvider).value;
  final List<Note> notes = ref.watch(notesRepositoryProvider);

  if (viewOption == NotesViewOptions.inbox) {
    return notes.where((note) => !note.arquived).toList();
  }
  return notes.where((note) => note.arquived).toList();
});

class NotesRepository extends StateNotifier<List<Note>> {
  NotesRepository() : super([]);

  addNote(Note note) {
    state = [...state, note];
  }

  archiveNote(Note note) {
    final updateNote = note.copyWith(archived: true);
    state.remove(note);
    state = [updateNote, ...state];
  }

  moveNoteToInbox(Note note) {
    final updateNote = note.copyWith(archived: false);
    state.remove(note);
    state = [updateNote, ...state];
  }
}
