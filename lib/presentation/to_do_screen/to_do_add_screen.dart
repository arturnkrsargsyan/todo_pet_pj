import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/presentation/auth/widget/text_field_style.dart';
import 'package:todo_app/presentation/home/widget/button.dart';

@RoutePage()
class ToDoAddScreen extends StatefulWidget {
  const ToDoAddScreen({super.key});

  @override
  State<ToDoAddScreen> createState() => _ToDoAddScreenState();
}

final _formKey = GlobalKey<FormState>();
TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
DateTime _startDate = DateTime.now();
DateTime? _endDate;

class _ToDoAddScreenState extends State<ToDoAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFieldStyle(
                  labelText: 'Title',
                  prefixIconAdd: const Icon(Icons.abc),
                  fildValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  textFildController: titleController),
              TextFieldStyle(
                  labelText: 'Description',
                  prefixIconAdd: const Icon(Icons.abc),
                  fildValidator: (p0) {},
                  textFildController: descriptionController),
              Text('Start Date: ${_startDate}'),
              Button(
                buttonText: ' Start Date',
                buttonFunction: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: _startDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (newDate != null) {
                    setState(() {
                      _startDate = newDate;
                    });
                  }
                },
              ),
              Text('End Date: ${_endDate ?? "Not Set"}'),
              Button(
                buttonText: 'Set End Date',
                buttonFunction: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: _startDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (newDate != null) {
                    setState(() {
                      _endDate = newDate;
                    });
                  }
                },
              ),
              Button(
                buttonText: 'Send',
                buttonFunction: () {
                  if (_formKey.currentState!.validate()) {
                    final todo = {
                      'title': titleController.text,
                      'startDate': _startDate,
                      'endDate': _endDate,
                      'description': descriptionController.text,
                    };
                    Navigator.pop(context, todo);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
