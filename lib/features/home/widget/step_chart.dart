import 'package:flutter/material.dart';

class StateStepChart extends StatelessWidget {
  final List<int> values;
  final List<String> xLabels;

  final double cellWidth;
  final double cellHeight;

  const StateStepChart({
    Key? key,
    required this.values,
    required this.xLabels,
    this.cellWidth = 30,
    this.cellHeight = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double leftMargin = 50;
    const double bottomMargin = 30;
    const double topMargin = 10;

    return SizedBox(
      width: xLabels.length * cellWidth + leftMargin,
      height: 4 * cellHeight + bottomMargin + topMargin,
      child: CustomPaint(
        painter: _StateStepChartPainter(
          values,
          xLabels,
          cellWidth,
          cellHeight,
          leftMargin,
          bottomMargin,
          topMargin,
        ),
      ),
    );
  }
}

class _StateStepChartPainter extends CustomPainter {
  final List<int> values;
  final List<String> xLabels;
  final double cellWidth;
  final double cellHeight;
  final double leftMargin;
  final double bottomMargin;
  final double topMargin;

  _StateStepChartPainter(
    this.values,
    this.xLabels,
    this.cellWidth,
    this.cellHeight,
    this.leftMargin,
    this.bottomMargin,
    this.topMargin,
  );

  final yLabels = ["OFF", "SB", "D", "ON"];

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1;

    final pathPaint = Paint()
      ..color = Colors.cyan
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    double chartWidth = size.width - leftMargin;
    double chartHeight = size.height - bottomMargin - topMargin;

    for (int i = 0; i < yLabels.length; i++) {
      double y = topMargin + i * cellHeight;
      canvas.drawLine(Offset(leftMargin, y), Offset(size.width, y), gridPaint);

      textPainter.text = TextSpan(
        text: yLabels[i],
        style: const TextStyle(color: Colors.black, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(leftMargin - textPainter.width - 8, y - 6),
      );
    }

    double baseY = topMargin + chartHeight;
    for (int i = 0; i < xLabels.length; i++) {
      double x = leftMargin + i * cellWidth;

      canvas.drawLine(Offset(x, baseY), Offset(x, baseY - 6), gridPaint);

      textPainter.text = TextSpan(
        text: xLabels[i],
        style: const TextStyle(color: Colors.black, fontSize: 10),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x - textPainter.width / 2, baseY + 2));
    }

    final path = Path();
    path.moveTo(leftMargin, topMargin + values[0] * cellHeight);

    for (int i = 1; i < values.length; i++) {
      double prevX = leftMargin + (i - 1) * cellWidth;
      double prevY = topMargin + values[i - 1] * cellHeight;
      double currX = leftMargin + i * cellWidth;
      double currY = topMargin + values[i] * cellHeight;

      path.lineTo(currX, prevY);
      path.lineTo(currX, currY);
    }

    canvas.drawPath(path, pathPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
