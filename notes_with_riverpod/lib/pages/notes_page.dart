import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_with_riverpod/providers/notes/notes_view_options.dart';
import 'package:notes_with_riverpod/providers/notes/view_filtered_provider.dart';
import 'package:notes_with_riverpod/providers/notes/view_toggle_provider.dart';
import 'package:notes_with_riverpod/repositories/notes_repository.dart';
import 'package:notes_with_riverpod/widgets/common/custom_floating_button.dart';
import 'package:notes_with_riverpod/widgets/notes/add_note_sheet.dart';
import 'package:notes_with_riverpod/widgets/notes/bottom_navigation_widget.dart';
import 'package:notes_with_riverpod/widgets/notes/notes_grid_view.dart';

class NotesPage extends ConsumerWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModeValue = ref.watch(notesViewModeProvider).value;
    final viewFilteredValue = ref.watch(filterNotesProvider).value;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
        title: Text(
          viewFilteredValue == NotesViewOptions.inbox ? 'Notas' : 'Arquivadas',
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          top: 36,
          left: 12,
          right: 12,
        ),
        child: NotesGridView(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: CustomFloatingButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => const AddNoteSheet(),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        buttons: [
          IconButton(
            tooltip: viewModeValue.tooltip,
            icon: viewFilteredValue.icon,
            onPressed: () => ref.read(notesViewModeProvider.notifier).toggle(),
          ),
          IconButton(
            tooltip: viewFilteredValue.tooltip,
            icon: viewFilteredValue.icon,
            onPressed: () => ref.read(filterNotesProvider.notifier).toggle(),
          ),
        ],
      ),
    );
  }
}
