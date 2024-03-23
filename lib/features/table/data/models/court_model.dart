/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// Model for the court.

import 'package:blumenau/features/table/domain/entities/court.dart';

class CourtModel implements Court {
  @override
  final String name;
  @override
  final String key;
  const CourtModel({required this.name, required this.key});
}
