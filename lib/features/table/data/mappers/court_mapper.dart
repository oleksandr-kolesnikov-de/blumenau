/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/features/table/data/models/court_model.dart';
import 'package:blumenau/features/table/domain/entities/court.dart';

class CourtMapper {
  static List<CourtModel> toModel(List<Court> courts) {
    final List<CourtModel> modelList = [];
    for (final court in courts) {
      modelList.add(
        CourtModel(
          name: court.name,
          key: court.key,
        ),
      );
    }
    return modelList;
  }

  static List<Court> fromModel(List<CourtModel> courts) {
    final List<Court> modelList = [];
    for (final court in courts) {
      modelList.add(
        Court(
          name: court.name,
          key: court.key,
        ),
      );
    }
    return modelList;
  }
}
