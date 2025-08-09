import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';
import 'package:isacs_mobile/features/barn/data/barn_activity_model.dart';
import 'package:isacs_mobile/features/statistics/presentation/cubit/statistics_cubit.dart';
import 'package:isacs_mobile/injector/injector.dart';
import 'package:isacs_mobile/l10n/l10n.dart';
import 'package:isacs_mobile/util/enum.dart';
import 'package:isacs_mobile/util/extensions.dart';
import 'package:isacs_mobile/widgets/custom_button.dart';
import 'package:isacs_mobile/widgets/custom_dropdown_field.dart';
import 'package:isacs_mobile/widgets/section_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

@RoutePage()
class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final _cubit = Injector.instance<StatisticsCubit>();
  late final List<DropdownMenuItem<DropdownTimeEnum>> _dropdownList = [
    DropdownMenuItem(
      value: DropdownTimeEnum.today,
      child: Text(context.l10n.today),
    ),
    DropdownMenuItem(
      value: DropdownTimeEnum.yesterday,
      child: Text(context.l10n.yesterday),
    ),
    DropdownMenuItem(
      value: DropdownTimeEnum.thisWeek,
      child: Text(context.l10n.thisWeek),
    ),
  ];

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
                // _buildChipsWidget(),
                _buildStatisticsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatisticsWidget() {
    return BlocBuilder<StatisticsCubit, StatisticsState>(
      buildWhen: (previous, current) =>
          previous.isChopperSelected != current.isChopperSelected,
      builder: (context, state) {
        final isChopperSelected = state.isChopperSelected
            .maybeMap(orElse: () => false, data: (s) => s.data);
        return Column(
          children: [
            if (isChopperSelected) Container(),
            if (!isChopperSelected) _buildBarnStatisticsWidget(),
          ],
        );
      },
    );
  }

  Widget _buildChipsWidget() {
    return BlocBuilder<StatisticsCubit, StatisticsState>(
      builder: (context, state) {
        final isChopperSelected = state.isChopperSelected
            .maybeMap(orElse: () => false, data: (s) => s.data);
        return SectionWidget(
          title: context.l10n.statistics,
          child: Wrap(
            spacing: Styles.defaultSpacing,
            children: [
              _buildChipWidget(context.l10n.barn, isChopperSelected, false),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChipWidget(
    String title,
    bool isChopperSelected,
    bool isChopper,
  ) {
    final backgroundColor =
        (isChopperSelected && isChopper || !isChopperSelected && !isChopper)
            ? ColorValues.primary50
            : ColorValues.grey30;
    return GestureDetector(
      onTap: () {
        _cubit.setIsChopperSelected(
          isChopperSelected: isChopper && !isChopperSelected,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: Styles.smallSpacing,
          horizontal: Styles.defaultSpacing,
        ),
        child: Text(
          title,
          style: context.textTheme.titleMedium
              ?.copyWith(color: ColorValues.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildBarnStatisticsWidget() {
    return BlocBuilder<StatisticsCubit, StatisticsState>(
      buildWhen: (previous, current) =>
          previous.barnActivities != current.barnActivities ||
          previous.barnTimeDropdown != current.barnTimeDropdown,
      builder: (context, state) {
        final list = state.barnActivities.maybeMap(
          orElse: () => <BarnActivityModel>[],
          data: (s) => s.data,
        );
        final selectedTime = state.barnTimeDropdown.maybeMap(
          orElse: () => DropdownTimeEnum.today,
          data: (s) => s.data,
        );
        var intervalType = DateTimeIntervalType.hours;
        var date = DateTime.now();
        var endDate = DateTime.now();
        switch (selectedTime) {
          case DropdownTimeEnum.today:
            date = DateTime.now();
          case DropdownTimeEnum.yesterday:
            date = DateTime.now().subtract(const Duration(days: 1));
          case DropdownTimeEnum.thisWeek:
            date = DateTime.now()
                .subtract(Duration(days: DateTime.now().weekday - 1));
            endDate =
                DateTime.now().add(Duration(days: 7 - DateTime.now().weekday));
            intervalType = DateTimeIntervalType.days;
        }
        var dateText = DateFormat('d MMMM').format(date);
        if (selectedTime == DropdownTimeEnum.thisWeek) {
          dateText =
              '${DateFormat('d MMM').format(date)} - ${DateFormat('d MMM').format(endDate)}';
        }
        return SectionWidget(
          title: 'Statistik Kandang',
          child: Container(
            padding: const EdgeInsets.all(Styles.defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: ColorValues.grey10),
            ),
            child: Column(
              spacing: Styles.defaultSpacing,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(dateText),
                    ),
                    Flexible(
                      child: CustomDropdownField<DropdownTimeEnum>(
                        value: state.barnTimeDropdown.maybeMap(
                          orElse: () => DropdownTimeEnum.today,
                          data: (s) => s.data,
                        ),
                        items: _dropdownList,
                        onChanged: (value) {
                          if (value != null) {
                            _cubit.setBarnTimeDropdown(barnTimeDropdown: value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SfCartesianChart(
                  tooltipBehavior: TooltipBehavior(enable: true),
                  primaryXAxis: DateTimeAxis(
                    dateFormat: DateFormat('d MMM HH:mm'),
                    intervalType: intervalType,
                  ),
                  legend: const Legend(
                    overflowMode: LegendItemOverflowMode.wrap,
                    isVisible: true,
                    position: LegendPosition.bottom,
                    iconBorderWidth: 15,
                  ),
                  series: [
                    LineSeries<BarnActivityModel, DateTime>(
                      name: context.l10n.temperature,
                      color: Theme.of(context).primaryColor,
                      markerSettings: MarkerSettings(
                        color: Theme.of(context).primaryColor,
                      ),
                      dataSource: list,
                      xValueMapper: (BarnActivityModel data, _) =>
                          data.dateTime,
                      yValueMapper: (BarnActivityModel data, _) =>
                          data.temperature,
                    ),
                    LineSeries<BarnActivityModel, DateTime>(
                      name: context.l10n.humidity,
                      color: Colors.blue,
                      markerSettings: const MarkerSettings(
                        color: Colors.blue,
                      ),
                      dataSource: list,
                      xValueMapper: (BarnActivityModel data, _) =>
                          data.dateTime,
                      yValueMapper: (BarnActivityModel data, _) =>
                          data.humidity,
                    ),
                  ],
                ),
                _buildBarnAnalysisWidget(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBarnAnalysisWidget() {
    return BlocBuilder<StatisticsCubit, StatisticsState>(
      buildWhen: (previous, current) =>
          previous.barnAnalysis != current.barnAnalysis,
      builder: (context, state) {
        final analysis = state.barnAnalysis.maybeMap(
          orElse: () => null,
          data: (s) => s.data,
        );
        final isLoading = state.barnAnalysis.maybeMap(
          orElse: () => false,
          loading: (s) => true,
        );
        if (analysis == null) {
          return CustomButton(
            buttonText: isLoading ? 'Loading...' : context.l10n.analyzeData,
            onPressed: isLoading ? null : _cubit.generateBarnAnalysis,
          );
        } else {
          return SectionWidget(
            title: context.l10n.analysis,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Styles.defaultSpacing,
              children: [
                Text(analysis),
                CustomButton(
                  buttonText:
                      isLoading ? 'Loading...' : context.l10n.analyzeAgain,
                  onPressed: isLoading ? null : _cubit.generateBarnAnalysis,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
