import 'package:blumenau/features/table/domain/entities/schedule_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleItemFirestoreModel extends ScheduleItem {
  const ScheduleItemFirestoreModel(
      {required super.key,
      required super.title,
      required super.startTime,
      required super.endTime});

  factory ScheduleItemFirestoreModel.fromDocument(QueryDocumentSnapshot doc) {
    return ScheduleItemFirestoreModel(
      key: doc.id,
      title: doc['title'] ?? '',
      startTime: doc['startTime'].toDate(),
      endTime: doc['endTime'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'startTime': Timestamp.fromDate(startTime),
      'endTime': Timestamp.fromDate(endTime),
    };
  }
}
