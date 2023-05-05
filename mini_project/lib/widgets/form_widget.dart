import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_project/widgets/texfield_costume.dart';
import 'package:provider/provider.dart';
import '../provider/form_provider.dart';

class FormWidget extends StatefulWidget {
  // final Function(String, String, DateTime) addFunction;
  const FormWidget({
    super.key,
    // required this.addFunction,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: const Text('New Task'),
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldCostume(
              controller: titleController,
              hintText: 'Task',
            ),
            const SizedBox(
              height: 12,
            ),
            TextFieldCostume(
              controller: subtitleController,
              hintText: 'Sub Task',
            ),
            const SizedBox(
              height: 12,
            ),
            TextFieldCostume(
              suffixIconWidget: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        formProvider.selectedTime(context);
                        formProvider.selectedDate(context);
                        setState(() {
                          timeController.text = DateFormat('dd/MM/yyyy hh:mm')
                              .format(formProvider.dateResult!);
                        });
                      },
                      icon: const Icon(Icons.calendar_month)),
                  Text(timeController.text),
                ],
              ),
              controller: timeController,
              hintText: 'Time',
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: const Color(0xff2da9ef),
            ),
            onPressed: () {
              // widget.addFunction(
              //     titleController.text, subtitleController.text, dateResult!);
              // Navigator.of(context).pop();
            },
            child: const Text(
              'add',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        )
      ],
    );
  }
}
