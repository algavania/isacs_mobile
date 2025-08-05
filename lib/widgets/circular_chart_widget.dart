import 'package:flutter/material.dart';
import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';
import 'package:isacs_mobile/util/extensions.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularChartWidget extends StatelessWidget {
  const CircularChartWidget({
    required this.header,
    required this.title,
    required this.child,
    required this.max,
    required this.value,
    super.key,
  });

  final String header;
  final String title;
  final Widget child;
  final double max;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Styles.contentPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Styles.defaultBorder),
        border: Border.all(color: ColorValues.grey10),
      ),
      child: Row(
        spacing: Styles.defaultSpacing,
        children: [
          Expanded(flex: 2, child: _buildCircularWidget(context)),
          Expanded(flex: 3, child: child),
        ],
      ),
    );
  }

  Widget _buildCircularWidget(BuildContext context) {
    return Column(
      spacing: Styles.defaultSpacing,
      children: [
        Text(header, textAlign: TextAlign.center,),
        CircularPercentIndicator(
          radius: 60,
          lineWidth: 12,
          percent: value / max,
          center: Text(title, style: context.textTheme.titleMedium,),
          progressColor: ColorValues.primary50,
          backgroundColor: Color(0xFFF1F1F1),
        ),
      ],
    );
  }
}
