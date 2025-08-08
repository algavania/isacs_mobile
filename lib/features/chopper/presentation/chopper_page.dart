import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';
import 'package:isacs_mobile/features/chopper/data/machine_activity_model.dart';
import 'package:isacs_mobile/features/chopper/presentation/cubit/chopper_cubit.dart';
import 'package:isacs_mobile/injector/injector.dart';
import 'package:isacs_mobile/l10n/l10n.dart';
import 'package:isacs_mobile/routes/router.dart';
import 'package:isacs_mobile/util/extensions.dart';
import 'package:isacs_mobile/widgets/card_data_widget.dart';
import 'package:isacs_mobile/widgets/circular_chart_widget.dart';
import 'package:isacs_mobile/widgets/section_widget.dart';

@RoutePage()
class ChopperPage extends StatefulWidget {
  const ChopperPage({super.key});

  @override
  State<ChopperPage> createState() => _ChopperPageState();
}

class _ChopperPageState extends State<ChopperPage> {
  final _cubit = Injector.instance<ChopperCubit>();

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
                _buildChopperToggleWidget(),
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
    final list = generateDummyMachineActivityModels();
    return SectionWidget(
      title: context.l10n.activity,
      subtitle: context.l10n.seeMore,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, i) => CardDataWidget(data: list[i]),
        separatorBuilder: (_, __) =>
        const SizedBox(
          height: Styles.defaultSpacing,
        ),
        itemCount: list.length,
      ),
    );
  }

  Widget _buildMachineMonitoringWidget() {
    return SectionWidget(
      title: context.l10n.machineMaintenance,
      subtitle: context.l10n.seeStats,
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
    return CircularChartWidget(
      header: context.l10n.totalUsage,
      title: '25 Jam',
      max: 50,
      value: 25,
      child: const Text(
        'Kinerja mesin dalam kondisi terbaik. Sistem akan terus memantau dan memberikan notifikasi jika sudah waktunya untuk perawatan.',
      ),
    );
  }

  Widget _buildTotalElectricityConsumptionWidget() {
    return CircularChartWidget(
      header: context.l10n.electricityConsumptionThisMonth,
      title: '20 kWh',
      max: 120,
      value: 20,
      child: const Text(
        'Pemakaian listrik masih dalam batas aman yang Anda tetapkan. Perkiraan biaya hingga saat ini adalah Rp18.125.',
      ),
    );
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
                      state.chopperStatus
                          .maybeMap(
                            orElse: () => context.l10n.off,
                            data: (value) => value.data
                                ? context.l10n.on
                                : context.l10n.off,
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
