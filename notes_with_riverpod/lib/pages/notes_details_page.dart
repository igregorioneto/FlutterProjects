import 'package:flutter/material.dart';
import 'package:notes_with_riverpod/models/note.dart';

class NotesDetailsPage extends StatefulWidget {
  final Note note;
  const NotesDetailsPage({
    super.key,
    required this.note,
  });

  @override
  State<NotesDetailsPage> createState() => _NotesDetailsPageState();
}

class _NotesDetailsPageState extends State<NotesDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
