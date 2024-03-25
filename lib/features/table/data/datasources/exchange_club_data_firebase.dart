/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/features/table/data/datasources/exchange_club_data.dart';
import 'package:blumenau/features/table/data/models/court_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

// Implementation of the [ExchangeClubData] interface.
// with hardocoded data.

class ExchangeClubDataFirebaseImpl implements ExchangeClubData {
  ExchangeClubDataFirebaseImpl();

  @override
  Future<Either<Failure, List<CourtModel>>> loadCourts() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot querySnapshot = await firestore.collection('courts').get();
      return Future.value(Right(querySnapshot.docs
          .map((doc) => CourtModel.fromDocument(doc))
          .toList()));
    } catch (e) {
      return Future.value(Left(GeneralFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> tryPin(String pin) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot querySnapshot = await firestore.collection('player').get();
      // Iterate through documents to check if PIN exists
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        // Assuming there's a field called "pin" in each document
        if (doc['pin'] == pin) {
          return Future.value(const Right(true)); // PIN found
        }
      }
      return Future.value(const Right(false));
    } catch (e) {
      return Future.value(Left(GeneralFailure()));
    }
  }

  @override
  Future<Either<Failure, String>> getPlayerName(String pin) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot querySnapshot = await firestore.collection('player').get();
      // Iterate through documents to find the player name associated with the PIN
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        // Assuming there's a field called "pin" in each document
        if (doc['pin'] == pin) {
          // Assuming there's a field called "name" containing the player's name
          String playerName = doc['name'];
          return Future.value(Right(playerName));
        }
      }
      return Future.value(const Right("")); // PIN not found
    } catch (e) {
      return Future.value(Left(GeneralFailure()));
    }
  }
}
