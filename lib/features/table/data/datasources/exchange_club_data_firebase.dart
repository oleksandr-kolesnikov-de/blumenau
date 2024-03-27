/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/core/literals/literals.dart';
import 'package:blumenau/features/table/data/datasources/exchange_club_data.dart';
import 'package:blumenau/features/table/data/models/court_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

// Implementation of the [ExchangeClubData] interface.
// with hardcoded data.

class ExchangeClubDataFirebaseImpl implements ExchangeClubData {
  final FirebaseFirestore firestore;
  ExchangeClubDataFirebaseImpl(this.firestore);

  @override
  Future<Either<Failure, List<CourtModel>>> loadCourts() async {
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection(Literals.firebaseCourtsCollection).get();
      return Future.value(Right(querySnapshot.docs
          .map((doc) => CourtModel.fromDocument(doc))
          .toList()));
    } catch (e) {
      return Future.value(Left(FirebaseFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> tryPin(String pin) async {
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection(Literals.firebasePlayerCollection).get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        if (doc['pin'] == pin) {
          return Future.value(const Right(true));
        }
      }
      return Future.value(const Right(false));
    } catch (e) {
      return Future.value(Left(FirebaseFailure()));
    }
  }

  @override
  Future<Either<Failure, String>> getPlayerName(String pin) async {
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection(Literals.firebasePlayerCollection).get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        if (doc['pin'] == pin) {
          String playerName = doc['name'];
          return Future.value(Right(playerName));
        }
      }
      return Future.value(const Right(""));
    } catch (e) {
      return Future.value(Left(FirebaseFailure()));
    }
  }
}
