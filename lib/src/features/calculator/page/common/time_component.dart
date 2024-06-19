import 'package:flutter/material.dart';

class TimeComponent extends StatelessWidget {
  const TimeComponent({
    super.key,
    required this.time,
    required this.initialTime,
    required this.setTime,
    this.enabled = true,
  });

  final String time;
  final TimeOfDay initialTime;
  final void Function(TimeOfDay) setTime;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: TextField(
              enabled: false,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
              controller: TextEditingController(text: time),
            ),
          ),
        ),
        IconButton.filled(
          onPressed: enabled
              ? () async {
                  final TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: initialTime,
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          alwaysUse24HourFormat: true,
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (time != null) {
                    setTime(time);
                  }
                }
              : null,
          icon: const Icon(
            Icons.timelapse,
          ),
        ),
      ],
    );
  }
}
