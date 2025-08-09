import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';
import 'package:isacs_mobile/features/chopper/data/machine_activity_model.dart';
import 'package:isacs_mobile/l10n/l10n.dart';
import 'package:isacs_mobile/util/extensions.dart';

class CardDataWidget extends StatelessWidget {
  const CardDataWidget({required this.data, super.key});

  final MachineActivityModel data;

  @override
  Widget build(BuildContext context) {
    return _buildCard(context);
  }

  Widget _buildCard(BuildContext context) {
    final startDate = DateFormat('dd MMM yyyy HH:mm').format(data.startTime);
    final endDate = DateFormat('dd MMM yyyy HH:mm').format(data.endTime);
    final durationText = _formatDuration(data.secondsDuration);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Styles.defaultBorder),
        border: Border.all(color: ColorValues.grey10),
      ),
      child: ExpandablePanel(
        header: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mesin',
              style: context.textTheme.titleMedium?.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              '$startDate - $endDate',
              style: context.textTheme.bodySmall?.copyWith(
                color: ColorValues.grey40,
              ),
            ),
          ],
        ),
        collapsed: const SizedBox.shrink(),
        expanded: Column(
          children: [
            const SizedBox(height: Styles.defaultSpacing),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: _buildTextData(
                    context,
                    'Durasi',
                    durationText,
                    '',
                  ),
                ),
                Flexible(
                  child: _buildTextData(
                    context,
                    context.l10n.electricityConsumption,
                    '${data.kwh}',
                    'kWh',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(num seconds) {
    final totalSeconds = seconds.toInt();
    if (totalSeconds < 60) {
      return '$totalSeconds detik';
    }
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    if (hours > 0) {
      return '$hours jam $minutes menit';
    }
    return '$minutes menit';
  }

  Widget _buildTextData(
      BuildContext context,
      String title,
      String content,
      String suffix,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 13),
        ),
        FittedBox(
          child: RichText(
            text: TextSpan(
              text: '',
              style: GoogleFonts.plusJakartaSans(),
              children: [
                TextSpan(
                  text: content,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: ColorValues.primary50,
                  ),
                ),
                if (suffix.isNotEmpty)
                  TextSpan(
                    text: ' $suffix',
                    style: const TextStyle(
                      color: ColorValues.grey30,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
