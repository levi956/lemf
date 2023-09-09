import 'package:flutter/material.dart';
import 'package:lemfy_task_in_flutter/app/modules/students/data/models/student_model.dart';

class StudentTileComponent extends StatelessWidget {
  final StudentModel studentModel;
  const StudentTileComponent(
    this.studentModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final idAsInt = int.tryParse(studentModel.id) ?? 0;

    List<Widget> buildStudentTile = [
      ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.network(
          studentModel.avatar,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(width: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            studentModel.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                studentModel.age.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: grey,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                studentModel.department,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: grey,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                studentModel.profileId,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: grey,
                ),
              ),
            ],
          )
        ],
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            idAsInt.isEven ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: idAsInt.isEven
            ? buildStudentTile.reversed.toList()
            : buildStudentTile,
      ),
    );
  }
}

const grey = Color(0xFF7E7E7E);
