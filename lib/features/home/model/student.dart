import 'package:freezed_annotation/freezed_annotation.dart';
part 'student.freezed.dart';
part 'student.g.dart';

@freezed
class Student with _$Student {
  factory Student({
    required int id,
    required String email,
    required String first_name,
    required String last_name,
    required String avatar,
  }) = _Student;

  factory Student.fromJson(Map<String, Object?> json)
      => _$StudentFromJson(json);
}
