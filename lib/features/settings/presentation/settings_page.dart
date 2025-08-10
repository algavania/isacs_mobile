import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';
import 'package:isacs_mobile/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:isacs_mobile/injector/injector.dart';
import 'package:isacs_mobile/l10n/l10n.dart';
import 'package:isacs_mobile/routes/router.dart';
import 'package:isacs_mobile/util/extensions.dart';
import 'package:isacs_mobile/util/validator.dart';
import 'package:isacs_mobile/widgets/custom_dialog.dart';
import 'package:isacs_mobile/widgets/custom_text_field.dart';
import 'package:isacs_mobile/widgets/section_widget.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _cubit = Injector.instance<SettingsCubit>();
  final _machineIntervalController = TextEditingController();
  final _electricityPriceController = TextEditingController();
  final _kwhLimitController = TextEditingController();
  final _heatLimitCoolController = TextEditingController();
  final _heatLimitIdealController = TextEditingController();
  final _heatLimitHotController = TextEditingController();
  final _telegramController = TextEditingController();
  final _machineIntervalFormKey = GlobalKey<FormState>();
  final _electricityPriceFormKey = GlobalKey<FormState>();
  final _maxKwhFormKey = GlobalKey<FormState>();
  final _heatLimitFormKey = GlobalKey<FormState>();
  final _telegramFormKey = GlobalKey<FormState>();

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
                          onTap: _onMachineIntervalTap,
                        ),
                        _buildItemWidget(
                          title: context.l10n.electricityPricePerKwh,
                          prefixIcon: Icons.attach_money,
                          onTap: _onElectricityPriceTap,
                        ),
                        _buildItemWidget(
                          title: context.l10n.kwhLimitPerMonth,
                          prefixIcon: Icons.electric_bolt,
                          onTap: _onMaxKwhTap,
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
                          onTap: _onHeatLimitTap,
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
                              title: context.l10n.setTelegramForNotification,
                              prefixIcon: Icons.notifications,
                              onTap: _onTelegramTap,
                            ),
                            _buildItemWidget(
                              title: context.l10n.machineMaintenance,
                              suffixWidget: Switch(
                                value: state.machineMaintenance.maybeMap(
                                  orElse: () => false,
                                  data: (v) => v.data,
                                ),
                                onChanged: (v) {
                                  _cubit.setMachineMaintenance(value: v);
                                },
                              ),
                            ),
                            _buildItemWidget(
                              title: context.l10n.electricityLimit,
                              suffixWidget: Switch(
                                value: state.electricityLimit.maybeMap(
                                  orElse: () => false,
                                  data: (v) => v.data,
                                ),
                                onChanged: (v) {
                                  _cubit.setElectricityLimit(value: v);
                                },
                              ),
                            ),
                            _buildItemWidget(
                              title: context.l10n.hotTemperature,
                              suffixWidget: Switch(
                                value: state.hotTemperature.maybeMap(
                                  orElse: () => false,
                                  data: (v) => v.data,
                                ),
                                onChanged: (v) {
                                  _cubit.setHotTemperature(value: v);
                                },
                              ),
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

  void _onHeatLimitTap() {
    _heatLimitCoolController.text = _cubit.state.coolLimit.maybeMap(
      orElse: () => '',
      data: (s) => s.data.toString(),
    );

    _heatLimitIdealController.text = _cubit.state.idealLimit.maybeMap(
      orElse: () => '',
      data: (s) => s.data.toString(),
    );

    _heatLimitHotController.text = _cubit.state.hotLimit.maybeMap(
      orElse: () => '',
      data: (s) => s.data.toString(),
    );

    showDialog<void>(
        context: context,
        builder: (context) {
          return CustomDialog(
            title: context.l10n.heatLimit,
            description: context.l10n.heatLimitDescription,
            child: Form(
              key: _heatLimitFormKey,
              child: Column(
                spacing: Styles.defaultSpacing,
                children: [
                  CustomTextField(
                    controller: _heatLimitCoolController,
                    validator: Validator(context: context).emptyValidator,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    label: context.l10n.coolTemperature,
                    description: context.l10n.coolTemperatureDescription,
                  ),
                  CustomTextField(
                    controller: _heatLimitIdealController,
                    validator: Validator(context: context).emptyValidator,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    label: context.l10n.idealTemperature,
                    description: context.l10n.idealTemperatureDescription,
                  ),
                  CustomTextField(
                    controller: _heatLimitHotController,
                    validator: Validator(context: context).emptyValidator,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    label: context.l10n.hotTemperature,
                    description: context.l10n.hotTemperatureDescription,
                  ),
                ],
              ),
            ),
            proceedAction: () {
              if (_heatLimitFormKey.currentState?.validate() ?? false) {
                _cubit.setTemperatureLimits(
                  coolLimit: num.parse(_heatLimitCoolController.text),
                  idealLimit: num.parse(_heatLimitIdealController.text),
                  hotLimit: num.parse(_heatLimitHotController.text),
                );
                Navigator.of(context).pop();
              }
            },
          );
        });
  }

  void _onTelegramTap() {
    _telegramController.text = _cubit.state.telegramUsername.maybeMap(
      orElse: () => '',
      data: (s) => s.data,
    );
    showDialog<void>(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: context.l10n.setTelegramForNotification,
          descriptionWidget: RichText(
            text: TextSpan(
              style: context.textTheme.bodySmall,
              text: '${context.l10n.callMeBotTelegramDescription} di bit.ly/isacs-setup',
              children: [
                TextSpan(text: '. ${context.l10n.ignoreIfDone}')
              ],
            ),
          ),
          child: Form(
            key: _telegramFormKey,
            child: CustomTextField(
              controller: _telegramController,
              validator: Validator(context: context).telegramValidator,
            ),
          ),
          proceedAction: () {
            if (_telegramFormKey.currentState?.validate() ?? false) {
              _cubit.setTelegramUsername(_telegramController.text);
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }

  void _onMachineIntervalTap() {
    _machineIntervalController.text = _cubit.state.machineInterval.maybeMap(
      orElse: () => '',
      data: (s) => s.data.toString(),
    );
    showDialog<void>(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: context.l10n.intervalMachineMaintenance,
          description: context.l10n.machineIntervalDescription,
          child: Form(
            key: _machineIntervalFormKey,
            child: CustomTextField(
              validator: Validator(context: context).emptyValidator,
              controller: _machineIntervalController,
              textInputType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          proceedAction: () {
            if (_machineIntervalFormKey.currentState?.validate() ?? false) {
              _cubit.setMachineInterval(
                num.parse(_machineIntervalController.text),
              );
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }

  void _onElectricityPriceTap() {
    _electricityPriceController.text = _cubit.state.electricityPrice.maybeMap(
      orElse: () => '',
      data: (s) => s.data.toString(),
    );
    showDialog<void>(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: context.l10n.electricityPricePerKwh,
          description: context.l10n.electricityPriceDescription,
          child: Form(
            key: _electricityPriceFormKey,
            child: CustomTextField(
              validator: Validator(context: context).emptyValidator,
              controller: _electricityPriceController,
              textInputType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          proceedAction: () {
            if (_electricityPriceFormKey.currentState?.validate() ?? false) {
              _cubit.setElectricityPrice(
                num.parse(_electricityPriceController.text),
              );
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }

  void _onMaxKwhTap() {
    _kwhLimitController.text = _cubit.state.maxKwh.maybeMap(
      orElse: () => '',
      data: (s) => s.data.toString(),
    );
    showDialog<void>(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: context.l10n.kwhLimitPerMonth,
          description: context.l10n.kwhLimitDescription,
          child: Form(
            key: _maxKwhFormKey,
            child: CustomTextField(
              validator: Validator(context: context).emptyValidator,
              controller: _kwhLimitController,
              textInputType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          proceedAction: () {
            if (_maxKwhFormKey.currentState?.validate() ?? false) {
              _cubit.setMaxKwh(
                num.parse(_kwhLimitController.text),
              );
              Navigator.of(context).pop();
            }
          },
        );
      },
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
            suffixWidget != null ? Styles.defaultBorder : 100,
          ),
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
                  color: suffixWidget != null ? ColorValues.white : null,
                ),
              ),
            ),
            if (suffixWidget != null) suffixWidget,
          ],
        ),
      ),
    );
  }
}
