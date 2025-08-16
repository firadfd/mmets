import 'package:flutter/material.dart';
import 'package:mmets/features/home/model/log_data.dart';

class LogTimelinePainter extends CustomPainter {
  final List<LogData> logData;
  final List<String> statuses = ['OFF', 'SB', 'D', 'ON'];
  final List<String> hours = [
    '1', '2', '3', '4', '5', '6', '7', '8', '9',
    '10', '11', '12', '13', '14', '15', '16',
    '17', '18', '19', '20', '21', '22', '23', '24'
  ];

  LogTimelinePainter(this.logData);

  @override
  void paint(Canvas canvas, Size size) {
    final paintGrid = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final paintPath = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    double xStep = size.width / hours.length;
    double yStep = size.height / statuses.length;

    // Draw vertical hour lines
    for (int i = 0; i <= hours.length; i++) {
      double x = i * xStep;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paintGrid);
    }

    // Draw horizontal status lines
    for (int i = 0; i <= statuses.length; i++) {
      double y = i * yStep;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paintGrid);
    }

    // Draw path from logData
    if (logData.isNotEmpty) {
      Path path = Path();

      for (int i = 0; i < logData.length; i++) {
        int yIndex = statuses.indexOf(logData[i].status);
        if (yIndex >= 0) {
          double x = logData[i].hour * xStep;
          double y = yIndex * yStep + yStep / 2;

          if (i == 0) {
            path.moveTo(x, y);
          } else {
            path.lineTo(x, y);
          }
        }
      }

      canvas.drawPath(path, paintPath);
    }

    final textStyle = TextStyle(color: Colors.grey[600], fontSize: 10);

    // Hour labels at the top
    for (int i = 0; i < hours.length; i++) {
      final textSpan = TextSpan(text: hours[i], style: textStyle);
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      double x = i * xStep - textPainter.width / 2;
      double y = -textPainter.height - 2;
      textPainter.paint(canvas, Offset(x, y));
    }

    // Status labels on the left
    for (int i = 0; i < statuses.length; i++) {
      final textSpan = TextSpan(text: statuses[i], style: textStyle);
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      double x = -textPainter.width - 5;
      double y = i * yStep + yStep / 2 - textPainter.height / 2;
      textPainter.paint(canvas, Offset(x, y));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
