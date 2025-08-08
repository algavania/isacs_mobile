import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';
import 'package:isacs_mobile/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:isacs_mobile/injector/injector.dart';
import 'package:isacs_mobile/l10n/l10n.dart';
import 'package:isacs_mobile/widgets/section_widget.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _cubit = Injector.instance<SettingsCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Styles.defaultPadding),
            child: SectionWidget(
              title: context.l10n.settings,
              child: Column(
                spacing: Styles.defaultPadding,
                children: [
                  SectionWidget(
                    title: context.l10n.chopperMachine,
                    child: Column(
                      spacing: Styles.defaultSpacing,
                      children: [
                        _buildItemWidget(
                          title: context.l10n.intervalMachineMaintenance,
                          prefixIcon: Icons.timer,
                        ),
                        _buildItemWidget(
                          title: context.l10n.electricityPricePerKwh,
                          prefixIcon: Icons.attach_money,
                        ),
                        _buildItemWidget(
                          title: context.l10n.kwhLimitPerMonth,
                          prefixIcon: Icons.electric_bolt,
                        ),
                      ],
                    ),
                  ),
                  SectionWidget(
                    title: context.l10n.barn,
                    child: Column(
                      spacing: Styles.defaultSpacing,
                      children: [
                        _buildItemWidget(
                          title: context.l10n.heatLimit,
                          prefixIcon: Icons.device_thermostat,
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<SettingsCubit, SettingsState>(
                    builder: (context, state) {
                      return SectionWidget(
                        title: context.l10n.notification,
                        child: Column(
                          spacing: Styles.defaultSpacing,
                          children: [
                            _buildItemWidget(
                              title: context.l10n.machineMaintenance,
                              suffixWidget: Switch(
                                  value: state.machineMaintenance.maybeMap(
                                      orElse: () => false, data: (v) => v.data),
                                  onChanged: (v) {
                                    _cubit.setMachineMaintenance(value: v);
                                  }),
                            ),
                            _buildItemWidget(
                              title: context.l10n.electricityLimit,
                              suffixWidget: Switch(
                                  value: state.electricityLimit.maybeMap(
                                      orElse: () => false, data: (v) => v.data),
                                  onChanged: (v) {
                                    _cubit.setElectricityLimit(value: v);
                                  }),
                            ),
                            _buildItemWidget(
                              title: context.l10n.hotTemperature,
                              suffixWidget: Switch(
                                  value: state.hotTemperature.maybeMap(
                                      orElse: () => false, data: (v) => v.data),
                                  onChanged: (v) {
                                    _cubit.setHotTemperature(value: v);
                                  }),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemWidget({
    required String title,
    IconData? prefixIcon,
    Widget? suffixWidget,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:
              suffixWidget != null ? ColorValues.primary50 : ColorValues.white,
          borderRadius: BorderRadius.circular(
              suffixWidget != null ? Styles.defaultBorder : 100),
          border: Border.all(
            color: ColorValues.grey10,
          ),
        ),
        padding: const EdgeInsets.all(Styles.defaultSpacing),
        child: Row(
          spacing: Styles.defaultSpacing,
          children: [
            if (prefixIcon != null)
              Icon(
                prefixIcon,
                color: ColorValues.primary50,
              ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: suffixWidget != null ? ColorValues.white : null),
              ),
            ),
            if (suffixWidget != null) suffixWidget,
          ],
        ),
      ),
    );
  }
}
