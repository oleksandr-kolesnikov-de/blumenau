/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// Model for the player.

import 'package:blumenau/features/table/domain/entities/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerModel extends Player {
  const PlayerModel({required super.name, required super.pinCode});

  factory PlayerModel.fromDocument(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return PlayerModel(
      name: data['name'] ?? '',
      pinCode: data['pinCode'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pinCode': pinCode,
    };
  }
}
