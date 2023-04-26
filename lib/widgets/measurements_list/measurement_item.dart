import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

import '../../models/measurement.dart';

class MeasurementItem extends StatelessWidget {
  const MeasurementItem({super.key, required this.measurement});

  final Measurement measurement;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              measurement.id,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  'قياس الصدر'
                  '${measurement.chestMeasurment}.cm',
                  // '${measurement.chestMeasurment.toStringAsFixed(2)}'
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      'مقاس الخصر'
                      '${measurement.waistMeasurment}.cm',
                      // '${measurement.chestMeasurment.toStringAsFixed(2)}'
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  'طول القياس'
                  '${measurement.sleeveLengthMeasurment}.cm',
                  // '${measurement.chestMeasurment.toStringAsFixed(2)}'
                ),
                const Spacer(),
                Row(
                  children: [
                    // Text(
                    //'${measurement.date}',
                    // '${measurement.chestMeasurment.toStringAsFixed(2)}'
                    // ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(measurement.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
