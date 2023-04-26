import 'package:flutter/material.dart';
import 'package:khyyatapp/widgets/chart/chart.dart';
import 'package:khyyatapp/widgets/measurements_list/measurements_list.dart';
import 'package:khyyatapp/models/measurement.dart';
import 'package:khyyatapp/widgets/new_measurement.dart';

class Measurements extends StatefulWidget {
  const Measurements({super.key});
  @override
  State<Measurements> createState() {
    return _MeasurementsState();
  }
}

class _MeasurementsState extends State<Measurements> {
  final List<Measurement> _registeredMeasurements = [
    Measurement(
      id: '33',
      chestMeasurment: '44',
      waistMeasurment: '55',
      sleeveLengthMeasurment: '66',
      date: DateTime.now(),
      thoubKind: '',
    ),
    Measurement(
      id: '44',
      chestMeasurment: '55',
      waistMeasurment: '66',
      sleeveLengthMeasurment: '77',
      date: DateTime.now(),
      thoubKind: '',
    ),
  ];
  void _openAddMeasurement() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewMeasurement(onAddMeasurement: _addMeasurement),
    );
  }

  void _addMeasurement(Measurement measurement) {
    setState(() {
      _registeredMeasurements.add(measurement);
    });
  }

  void _removeMeasurement(Measurement measurement) {
    final measurementIndex = _registeredMeasurements.indexOf(measurement);
    setState(() {
      _registeredMeasurements.remove(measurement);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // content: Text('Measurmnet ${measurement.id} deleted'),
        duration: const Duration(seconds: 3),
        content: const Text('Measurmnet deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredMeasurements.insert(measurementIndex, measurement);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No measurements yet'),
    );
    if (_registeredMeasurements.isNotEmpty) {
      mainContent = MeasurementsList(
        measurements: _registeredMeasurements,
        onRemoveMeasurement: _removeMeasurement,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Measurements'),
        actions: [
          IconButton(
            onPressed: _openAddMeasurement,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('مقاس الطول'),
          // Chart(measurements: _registeredMeasurements),
          Expanded(
            // child: MeasurementsList(
            //   measurements: _registeredMeasurements,
            //   onRemoveMeasurement: _removeMeasurement,
            // ),
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
