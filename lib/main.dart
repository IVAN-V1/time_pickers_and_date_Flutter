
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autocomplete',
      home: Time_pickers(),
    );
  }
}

class Time_pickers extends StatefulWidget {
  @override
  _Time_pickersState createState() => _Time_pickersState();
}


class _Time_pickersState extends State<Time_pickers> {



  TimeOfDay? selectedTime;

  String _Hora = ''; // Declarar la variable para almacenar la hora

// Método para seleccionar la hora
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        _Hora = '${picked.hour}:${picked.minute}'; // Actualizar la variable _Hora
      });
    }
  }



  DateTime? _selectedDate;

  String _Fecha = ''; // Declarar la variable para almacenar la fecha

// Método para seleccionar la fecha
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _Fecha = '${picked.day}/${picked.month}/${picked.year}'; // Actualizar la variable _Fecha
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Time pickers and Date',
          style: TextStyle(fontFamily: 'sans-serif-light'),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),


        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [





              TextFormField(
                decoration: InputDecoration(
                  labelText: "Seleccionar Hora",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  suffixIcon: Icon(Icons.access_time),
                ),
                readOnly: true, // Para que el campo sea de solo lectura
                controller: TextEditingController(
                  text: selectedTime?.format(context),
                ),
                onTap: () => _selectTime(context),
                validator: (value) {
                  // Add validation logic here if needed
                  return null;
                },
              ),

              SizedBox(height: 16.0),


              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true, // Para que el campo sea de solo lectura

                controller: TextEditingController(
                  text: _selectedDate != null
                      ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                      : 'Seleccionar fecha',
                ),

                onTap: () => _selectDate(context),
                validator: (value) {
                  // Add validation logic here if needed
                  return null;
                },
              ),







            ],
      ),


      )


    );


  }
}
