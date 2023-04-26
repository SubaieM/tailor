import 'package:flutter/material.dart';
import 'package:khyyatapp/models/measurement.dart';
import 'package:uuid/uuid.dart';

class NewMeasurement extends StatefulWidget {
  const NewMeasurement({super.key, required this.onAddMeasurement});
  final void Function(Measurement measurement) onAddMeasurement;

  @override
  State<NewMeasurement> createState() => _NewMeasurementState();
}

class _NewMeasurementState extends State<NewMeasurement> {
  final _chestMeasurment = TextEditingController();
  final _waistMeasurment = TextEditingController();
  final _sleeveLengthMeasurment = TextEditingController();
  // final _id = TextEditingController();
  DateTime? _selectedDate;
  ThoubKind _selectedThoubKind = ThoubKind.Saudi;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickdDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickdDate;
    });
  }

  void _submitMeasurementData() {
    final enteredMeasurement = double.tryParse(_waistMeasurment.text);
    final measurementIsInvalid =
        enteredMeasurement == null || enteredMeasurement <= 0;
    if (_chestMeasurment.text.trim().isEmpty ||
        measurementIsInvalid ||
        _sleeveLengthMeasurment.text.trim().isEmpty ||
        _selectedDate == null) {
      // show error message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('An error occured!'),
          content: const Text(
              'Please enter a valid title and measurement and category!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }
    final String id = Uuid().v1(); // generate a unique ID
    widget.onAddMeasurement(
      Measurement(
        id: id,
        chestMeasurment: _chestMeasurment.text,
        waistMeasurment: _waistMeasurment.text,
        sleeveLengthMeasurment: _sleeveLengthMeasurment.text,
        date: _selectedDate!,
        thoubKind: _selectedThoubKind.name.toString(),
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _chestMeasurment.dispose();
    _waistMeasurment.dispose();
    _sleeveLengthMeasurment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            // onChanged: _saveTitleInput,
            controller: _chestMeasurment,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('مقاس الطول'),
            ),
          ),
          Expanded(
            child: TextField(
              // onChanged: _saveTitleInput,
              controller: _waistMeasurment,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                // prefixText: '\$',
                label: Text('مقاس عرض الصدر'),
              ),
            ),
          ),
          Expanded(
            child: TextField(
              // onChanged: _saveTitleInput,
              controller: _sleeveLengthMeasurment,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                // prefixText: '\$',
                label: Text('طول الكم'),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _selectedDate == null
                      ? 'No Date Chosen!'
                      : formatter.format(_selectedDate!),
                ),
                IconButton(
                  onPressed: _presentDatePicker,
                  icon: const Icon(Icons.calendar_month),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedThoubKind,
                items: ThoubKind.values
                    .map(
                      (thoubKind) => DropdownMenuItem(
                        value: thoubKind,
                        child: Text(
                          thoubKind.name.toString(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedThoubKind = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submitMeasurementData,
                child: const Text('Save Measurement'),
              ),
            ],
          )
        ],
      ),
    );
  }
}



//add it to the line 12 if you want
// var _enteredTitle = '';

  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }