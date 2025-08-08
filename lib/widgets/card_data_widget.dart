import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';
import 'package:isacs_mobile/features/chopper/data/machine_activity_model.dart';
import 'package:isacs_mobile/l10n/l10n.dart';
import 'package:isacs_mobile/util/extensions.dart';

class CardDataWidget extends StatefulWidget {
  const CardDataWidget({required this.data, super.key});

  final MachineActivityModel data;

  @override
  State<CardDataWidget> createState() => _CardDataWidgetState();
}

class _CardDataWidgetState extends State<CardDataWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildCardData();
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'on':
        return context.l10n.on;
      case 'off':
        return context.l10n.off;
      case 'overload':
        return context.l10n.overload;
    }
    return '-';
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'on':
        return ColorValues.primary50;
      case 'off':
        return ColorValues.danger50;
      case 'overload':
        return Colors.orange; // Orange for overload
    }
    return Colors.grey; // Default color
  }

  Widget _buildCardData() {
    final date =
        DateFormat('E, dd MMMM yyyy HH:mm').format(widget.data.dateTime);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Styles.defaultBorder),
        border: Border.all(color: ColorValues.grey10),
      ),
      child: ExpandablePanel(
        header: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: RichText(
                    text: TextSpan(
                      text: '${context.l10n.machine} ',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: _getStatusText(widget.data.status),
                          style: context.textTheme.titleMedium?.copyWith(
                            color: _getStatusColor(widget.data.status),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  date,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: ColorValues.grey40,
                  ),
                ),
              ],
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
                    context.l10n.totalUsage,
                    '${widget.data.totalUsage ?? '-'}',
                    context.l10n.hours,
                  ),
                ),
                Flexible(
                  child: _buildTextData(
                    context.l10n.electricityConsumption,
                    '${widget.data.electricityUsage ?? '-'}',
                    context.l10n.kwh,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextData(String title, String content, String suffix) {
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
                TextSpan(
                  text: ' $suffix',
                  style: const TextStyle(
                    color: Color(0xFF6F6F6F),
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
