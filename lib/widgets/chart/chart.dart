// import 'package:flutter/material.dart';

// // import 'package:expense_tracker/widgets/chart/chart_bar.dart';
// // import 'package:expense_tracker/models/measurement.dart;
// import 'package:khyyatapp/models/measurement.dart';
// import 'package:khyyatapp/widgets/chart/chart_bar.dart';

// class Chart extends StatelessWidget {
//   const Chart({super.key, required this.measurements});

//   final List<Measurement> measurements;

//   List<MeasurementBucket> get buckets {
//     return [
//       MeasurementBucket.forThoubKind(measurements, ThoubKind.Saudi),
//       MeasurementBucket.forThoubKind(measurements, ThoubKind.Qatar),
//       MeasurementBucket.forThoubKind(measurements, ThoubKind.Kuwait),
//     ];
//   }

//   double get maxTotalMeasurement {
//     double maxTotalMeasurement = 0;

//     for (final bucket in buckets) {
//       if (bucket.totalMeasurements > maxTotalMeasurement) {
//         maxTotalMeasurement = bucket.totalMeasurements;
//       }
//     }

//     return maxTotalMeasurement;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isDarkMode =
//         MediaQuery.of(context).platformBrightness == Brightness.dark;
//     return Container(
//       margin: const EdgeInsets.all(16),
//       padding: const EdgeInsets.symmetric(
//         vertical: 16,
//         horizontal: 8,
//       ),
//       width: double.infinity,
//       height: 180,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         gradient: LinearGradient(
//           colors: [
//             Theme.of(context).colorScheme.primary.withOpacity(0.3),
//             Theme.of(context).colorScheme.primary.withOpacity(0.0)
//           ],
//           begin: Alignment.bottomCenter,
//           end: Alignment.topCenter,
//         ),
//       ),
//       child: Column(
//         children: [
//           Expanded(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 for (final bucket in buckets) // alternative to map()
//                   ChartBar(
//                     fill: bucket.totalMeasurements == 0
//                         ? 0
//                         : bucket.totalMeasurements / maxTotalMeasurement,
//                   )
//               ],
//             ),
//           ),
//           const SizedBox(height: 12),
//           Row(
//             children: buckets
//                 .map(
//                   (bucket) => const Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 4),
//                       child: Icon(
//                         Icons.circle,
//                         // color:  isDarkMode
//                         //     ? Theme.of(context).colorScheme.secondary
//                         //     : Theme.of(context)
//                         //         .colorScheme
//                         //         .primary
//                         //         .withOpacity(0.7),
//                       ),
//                     ),
//                   ),
//                 )
//                 .toList(),
//           )
//         ],
//       ),
//     );
//   }
// }
