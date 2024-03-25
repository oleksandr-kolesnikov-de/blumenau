/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/features/table/data/datasources/exchange_schedule.dart';
import 'package:blumenau/features/table/data/models/schedule_item_firebase_model.dart';
import 'package:blumenau/features/table/domain/entities/schedule_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

// [ExchangeSchedule] interface implementation.
// with Firebase database.

class ExchangeScheduleFirebaseImpl implements ExchangeSchedule {
  ExchangeScheduleFirebaseImpl();

  @override
  Future<Either<Failure, List<ScheduleItemFirestoreModel>>> loadSchedule(
      String courtKey) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore.collection(courtKey).get();
      return Future.value(Right(querySnapshot.docs
          .map((doc) => ScheduleItemFirestoreModel.fromDocument(doc))
          .toList()));
    } catch (e) {
      return Future.value(Left(FirebaseFailure())); // Handle error accordingly
    }
  }

  @override
  Future<Either<Failure, void>> addEntry(
      String courtKey, ScheduleItem scheduleItem) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection(courtKey).doc(scheduleItem.key).set({
        'title': scheduleItem.title,
        'startTime': scheduleItem.startTime,
        'endTime': scheduleItem.endTime,
      });
      return Future.value(const Right(null));
    } catch (e) {
      return Future.value(Left(FirebaseFailure())); // Handle error accordingly
    }
  }

  @override
  Future<Either<Failure, void>> deleteEntry(
      String courtKey, String key, String name) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentSnapshot documentSnapshot =
          await firestore.collection(courtKey).doc(key).get();
      if (documentSnapshot['title'] == name) {
        await firestore.collection(courtKey).doc(key).delete();
      }

      return Future.value(const Right(null));
    } catch (e) {
      return Future.value(Left(FirebaseFailure())); // Handle error accordingly
    }
  }
}
