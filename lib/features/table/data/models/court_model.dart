/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// Model for the court.

import 'package:blumenau/features/table/domain/entities/court.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourtModel extends Court {
  const CourtModel({required super.name, required super.key});

  factory CourtModel.fromDocument(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return CourtModel(
      name: data['name'] ?? '',
      key: data['key'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'key': key,
    };
  }
}
