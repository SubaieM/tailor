import 'package:flutter/material.dart';
import 'package:khyyatapp/models/measurement.dart';
import 'package:khyyatapp/widgets/measurements_list/measurement_item.dart';

class MeasurementsList extends StatelessWidget {
  const MeasurementsList({
    super.key,
    required this.measurements,
    required this.onRemoveMeasurement,
  });
  final List<Measurement> measurements;
  final void Function(Measurement measurement) onRemoveMeasurement;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: measurements.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(measurements[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveMeasurement(measurements[index]);
        },
        child: MeasurementItem(
          measurement: measurements[index],
        ),
      ),
    );
  }
}
