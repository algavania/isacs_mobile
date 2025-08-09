import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';
import 'package:isacs_mobile/features/chopper/data/machine_activity_model.dart';
import 'package:isacs_mobile/features/chopper/presentation/cubit/chopper_cubit.dart';
import 'package:isacs_mobile/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:isacs_mobile/injector/injector.dart';
import 'package:isacs_mobile/l10n/l10n.dart';
import 'package:isacs_mobile/routes/router.dart';
import 'package:isacs_mobile/util/extensions.dart';
import 'package:isacs_mobile/widgets/card_data_widget.dart';
import 'package:isacs_mobile/widgets/circular_chart_widget.dart';
import 'package:isacs_mobile/widgets/custom_alert_dialog.dart';
import 'package:isacs_mobile/widgets/custom_button.dart';
import 'package:isacs_mobile/widgets/section_widget.dart';

@RoutePage()
class ChopperPage extends StatefulWidget {
  const ChopperPage({super.key});

  @override
  State<ChopperPage> createState() => _ChopperPageState();
}

class _ChopperPageState extends State<ChopperPage> {
  final _cubit = Injector.instance<ChopperCubit>();
  final _settingCubit = Injector.instance<SettingsCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Styles.defaultPadding),
            child: Column(
              spacing: Styles.defaultPadding,
              children: [
                // _buildChopperToggleWidget(),
                _buildMachineMonitoringWidget(),
                _buildActivityWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActivityWidget() {
    return SectionWidget(
      title: context.l10n.activity,
      child: BlocBuilder<ChopperCubit, ChopperState>(
        buildWhen: (state, previous) => state.activities != previous.activities,
        builder: (context, state) {
          final list = state.activities.maybeMap(
            orElse: () => const <MachineActivityModel>[],
            data: (value) => value.data,
          );
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, i) => CardDataWidget(data: list[i]),
            separatorBuilder: (_, __) =>
            const SizedBox(
              height: Styles.defaultSpacing,
            ),
            itemCount: list.length,
          );
        },
      ),
    );
  }

  Widget _buildMachineMonitoringWidget() {
    return SectionWidget(
      title: context.l10n.machineMaintenance,
      onSubtitleTap: () {
        AutoRouter.of(context).navigate(const StatisticsRoute());
      },
      child: Column(
        spacing: Styles.largeSpacing,
        children: [
          _buildTotalUsageWidget(),
          _buildTotalElectricityConsumptionWidget(),
        ],
      ),
    );
  }

  Widget _buildTotalUsageWidget() {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (state, previous) =>
          state.machineInterval != previous.machineInterval,
      builder: (context, state) {
        return BlocBuilder<ChopperCubit, ChopperState>(
          buildWhen: (state, previous) =>
          state.totalUsage != previous.totalUsage ||
              state.chopperStatus != previous.chopperStatus,
          builder: (context, state) {
            final totalUsage = state.totalUsage.maybeMap(
              orElse: () => 0.0,
              data: (value) => value.data.toDouble(),
            );
            var maxUsage = _settingCubit.state.machineInterval.maybeMap(
              orElse: () => 50.0,
              data: (value) => value.data.toDouble(),
            );
            if (totalUsage > maxUsage) {
              maxUsage = totalUsage;
            }
            return CircularChartWidget(
              header: context.l10n.totalUsage,
              title: '$totalUsage Jam',
              max: maxUsage,
              value: totalUsage,
              child: Column(
                spacing: Styles.defaultSpacing,
                children: [
                  Text(
                    _generateMachineUsageDescription(totalUsage, maxUsage),
                  ),
                  if (totalUsage >= maxUsage)
                    CustomButton(
                      buttonText: 'Reset Total Pemakaian',
                      onPressed: () {
                        showDialog<void>(
                            context: context,
                            builder: (context) {
                              return CustomAlertDialog(
                                title: 'Konfirmasi',
                                description:
                                'Apakah Anda sudah melakukan pengecekan dan perawatan pada mesin?',
                                proceedText: 'Sudah',
                                proceedAction: () {
                                  _cubit.resetTotalUsage();
                                },
                              );
                            });
                      },
                    )
                ],
              ),
            );
          },
        );
      },
    );
  }

  String _generateMachineUsageDescription(num totalUsage, num maxUsage) {
    if (maxUsage <= 0) {
      return 'Harap atur interval perawatan mesin di halaman Pengaturan.';
    }

    final percentage = (totalUsage / maxUsage) * 100;

    if (percentage >= 100) {
      return 'PERAWATAN DIPERLUKAN. Mesin telah mencapai batas jam operasional. Untuk menjaga kualitas pakan dan keawetan mesin, segera lakukan pemeriksaan rutin dan asah pisau.';
    } else if (percentage >= 80) {
      return 'Perhatian, jam kerja mesin sudah mendekati batas perawatan. Segera jadwalkan pemeriksaan rutin untuk menjaga performa terbaik.';
    } else {
      return 'Kinerja mesin dalam kondisi terbaik. Sistem akan terus memantau dan memberikan notifikasi jika sudah waktunya untuk perawatan.';
    }
  }

  Widget _buildTotalElectricityConsumptionWidget() {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (state, previous) =>
      state.electricityPrice != previous.electricityPrice ||
          state.maxKwh != previous.maxKwh,
      builder: (context, state) {
        return BlocBuilder<ChopperCubit, ChopperState>(
          buildWhen: (state, previous) =>
          state.thisMonthElectricity != previous.thisMonthElectricity,
          builder: (context, state) {
            final electricityUsage = state.thisMonthElectricity.maybeMap(
              orElse: () => 0.0,
              data: (value) => value.data.toDouble(),
            );
            var maxUsage = _settingCubit.state.maxKwh.maybeMap(
              orElse: () => 120.0,
              data: (value) => value.data.toDouble(),
            );
            if (electricityUsage > maxUsage) {
              maxUsage = electricityUsage;
            }
            final electricityPrice =
            _settingCubit.state.electricityPrice.maybeMap(
              orElse: () => 1.0,
              data: (value) => value.data.toDouble(),
            );
            return CircularChartWidget(
              header: context.l10n.electricityConsumptionThisMonth,
              title: '$electricityUsage kWh',
              max: maxUsage,
              value: electricityUsage,
              child: Text(
                generateTotalElectricityDescription(
                  currentUsage: electricityUsage,
                  maxUsage: maxUsage,
                  pricePerKwh: electricityPrice,
                ),
              ),
            );
          },
        );
      },
    );
  }

  String generateTotalElectricityDescription({
    required double currentUsage,
    required double maxUsage,
    required double pricePerKwh,
  }) {
    if (maxUsage <= 0 || pricePerKwh <= 0) {
      return 'Harap atur batas kWh dan harga listrik di halaman Pengaturan.';
    }

    final estimatedCost = currentUsage * pricePerKwh;

    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    final formattedCost = currencyFormatter.format(estimatedCost);

    final percentage = (currentUsage / maxUsage) * 100;

    if (percentage >= 100) {
      return 'BATAS TERLAMPAUI! Penggunaan listrik telah melebihi target Anda. Total biaya saat ini adalah $formattedCost.';
    } else if (percentage >= 80) {
      return 'Perhatian, penggunaan listrik bulan ini sudah mendekati batas. Perkiraan biaya saat ini adalah $formattedCost.';
    } else {
      return 'Pemakaian listrik masih dalam batas aman yang Anda tetapkan. Perkiraan biaya hingga saat ini adalah $formattedCost.';
    }
  }

  Widget _buildChopperToggleWidget() {
    return BlocBuilder<ChopperCubit, ChopperState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(Styles.defaultPadding),
          decoration: BoxDecoration(
            color: ColorValues.primary50,
            borderRadius: BorderRadius.circular(Styles.defaultBorder),
          ),
          child: Row(
            spacing: Styles.defaultSpacing,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.chopperMachine,
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: ColorValues.white),
                    ),
                    Text(
                      state.chopperStatus.maybeMap(
                        orElse: () => context.l10n.off,
                        data: (value) =>
                        value.data ? context.l10n.on : context.l10n.off,
                      ),
                      style: const TextStyle(
                        color: ColorValues.white,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: state.chopperStatus
                    .maybeMap(orElse: () => false, data: (value) => value.data),
                onChanged: (v) {
                  _cubit.setChopperStatus(status: v);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
