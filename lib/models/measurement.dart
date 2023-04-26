// ignore_for_file: constant_identifier_names

import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

enum ThoubKind {
  Saudi,
  Qatar,
  Kuwait,
}

class Measurement {
  Measurement({
    required this.id,
    required this.chestMeasurment,
    required this.waistMeasurment,
    required this.sleeveLengthMeasurment,
    required this.date,
    required this.thoubKind,
  });

  final String id;
  final String chestMeasurment;
  final String waistMeasurment;
  final String sleeveLengthMeasurment;
  final DateTime date;
  final String thoubKind;
  String get formattedDate {
    return formatter.format(date);
  }
}

// class MeasurementBucket {
//   const MeasurementBucket({
//     required this.thoubKind,
//     required this.measurements,
//   });

//   MeasurementBucket.forThoubKind(
//       List<Measurement> allMeasurements, this.thoubKind)
//       : measurements = allMeasurements
//             .where(
//               (measurement) => measurement.thoubKind == thoubKind,
//             )
//             .toList();

//   final ThoubKind thoubKind;
//   final List<Measurement> measurements;

//   double get totalMeasurements {
//     double sum = 0;

//     for (final measurement in measurements) {
//       sum += double.parse(measurement.chestMeasurment);
//       sum += double.parse(measurement.waistMeasurment);
//       sum += double.parse(measurement.sleeveLengthMeasurment);
//     }
//     return sum;
//   }
// }
