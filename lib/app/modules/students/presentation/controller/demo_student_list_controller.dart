import 'package:rxdart/rxdart.dart';

// trying to see how I can get my stream value (state) here

class StudentListController {
  final Sink<List<String>> _sink;
  final Stream<List<String>> stream;

  StudentListController._({
    required Sink<List<String>> studentListSink,
    required this.stream,
  }) : _sink = studentListSink;

  factory StudentListController() {
    final subject = BehaviorSubject<List<String>>();
    final studentListStream = subject.distinct();
    return StudentListController._(
      studentListSink: subject,
      stream: studentListStream,
    );
  }

  void addStudent(String student) {
    _sink.add([]);
  }
}
