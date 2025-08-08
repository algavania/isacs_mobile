import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';
import 'package:isacs_mobile/features/barn/data/barn_activity_model.dart';
import 'package:isacs_mobile/features/barn/presentation/cubit/barn_cubit.dart';
import 'package:isacs_mobile/injector/injector.dart';
import 'package:isacs_mobile/l10n/l10n.dart';
import 'package:isacs_mobile/util/enum.dart';
import 'package:isacs_mobile/widgets/circular_chart_widget.dart';
import 'package:isacs_mobile/widgets/custom_dropdown_field.dart';
import 'package:isacs_mobile/widgets/section_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

@RoutePage()
class BarnPage extends StatefulWidget {
  const BarnPage({super.key});

  @override
  State<BarnPage> createState() => _BarnPageState();
}

class _BarnPageState extends State<BarnPage> {
  final _cubit = Injector.instance<BarnCubit>();

  final num _dryLimit = 40;
  final num _idealLimit = 71;
  final num _humidLimit = 86;

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
  void initState() {
    super.initState();
  }

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
                _buildMonitoringWidget(),
                _buildStatisticsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatisticsWidget() {
    return BlocBuilder<BarnCubit, BarnState>(
      buildWhen: (previous, current) =>
          previous.statistics != current.statistics ||
          previous.selectedTime != current.selectedTime,
      builder: (context, state) {
        final list = state.statistics.maybeMap(
          orElse: () => <BarnActivityModel>[],
          data: (s) => s.data,
        );
        final selectedTime = state.selectedTime.maybeMap(
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
          title: AppLocalizations.of(context).statistics,
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
                        value: state.selectedTime.maybeMap(
                          orElse: () => DropdownTimeEnum.today,
                          data: (s) => s.data,
                        ),
                        items: _dropdownList,
                        onChanged: (value) {
                          if (value != null) {
                            _cubit.changeDropdownTime(value);
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
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMonitoringWidget() {
    return BlocBuilder<BarnCubit, BarnState>(
      buildWhen: (previous, current) =>
          previous.temperature != current.temperature ||
          previous.humidity != current.humidity ||
          previous.hotLimit != current.hotLimit ||
          previous.coolLimit != current.coolLimit ||
          previous.idealLimit != current.idealLimit,
      builder: (context, state) {
        final date = state.lastUpdated.maybeMap(
          orElse: () => null,
          data: (s) => s.data,
        );
        return SectionWidget(
          title: context.l10n.barnMonitoring,
          description:
              '${context.l10n.lastUpdatedAt} ${date != null ?
              DateFormat('d MMMM HH:mm').format(date) : '-'}',
          child: Column(
            spacing: Styles.largeSpacing,
            children: [
              _buildTemperatureWidget(),
              _buildHumidityWidget(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTemperatureWidget() {
    final temperature = _cubit.state.temperature
        .maybeMap(orElse: () => null, data: (s) => s.data);
    var maxTemperature =
        _cubit.state.hotLimit.maybeMap(orElse: () => null, data: (s) => s.data);
    debugPrint('max temperature $maxTemperature');
    if (temperature != null && maxTemperature != null) {
      if (temperature > maxTemperature) {
        maxTemperature = temperature;
      }
    }
    return CircularChartWidget(
      color: getTemperatureColor(temperature ?? 0),
      header: context.l10n.temperature,
      title: temperature == null ? '-' : '$temperature° C',
      max: maxTemperature == null ? 0 : maxTemperature.toDouble(),
      value: temperature == null ? 0 : temperature.toDouble(),
      child: Text(
        temperature == null ? '-' : getTemperatureDescription(temperature),
      ),
    );
  }

  String getHumidityDescription(num value) {
    if (value < _dryLimit) {
      return 'Kelembaban udara rendah. Kondisi ini bisa memicu debu dan sedikit mengganggu pernapasan. Pastikan lantai kandang tidak terlalu kering.';
    } else if (value >= _dryLimit && value < _idealLimit) {
      return 'Kelembaban ideal! Udara sangat nyaman untuk pernapasan sapi dan menjaga kondisi kandang tetap baik untuk mencegah pertumbuhan jamur.';
    } else if (value >= _idealLimit && value < _humidLimit) {
      return 'Udara mulai terasa lembab. Jika disertai suhu panas, ini akan membuat sapi lebih sulit mendinginkan diri. Tingkatkan sirkulasi udara.';
    } else {
      return 'Kelembaban sangat tinggi dan berisiko. Sapi akan kesulitan berkeringat, dan risiko pertumbuhan jamur pada pakan meningkat. Ventilasi maksimal sangat diperlukan.';
    }
  }

  Color getHumidityColor(num value) {
    if (value < _dryLimit) {
      return ColorValues.danger50;
    } else if (value >= _dryLimit && value < _idealLimit) {
      return ColorValues.primary50;
    } else if (value >= _idealLimit && value < _humidLimit) {
      return Colors.blue;
    } else {
      return ColorValues.danger50;
    }
  }

  String getTemperatureDescription(num value) {
    final coolLimit =
        _cubit.state.coolLimit.maybeMap(orElse: () => 0, data: (s) => s.data);
    final idealLimit =
        _cubit.state.idealLimit.maybeMap(orElse: () => 0, data: (s) => s.data);
    if (value < coolLimit) {
      return 'Suhu kandang saat ini sejuk. Pastikan sapi, terutama anakan, memiliki alas tidur yang kering untuk menjaga kehangatan tubuh dan efisiensi energi.';
    } else if (value >= coolLimit && value < idealLimit) {
      return 'Suhu sempurna! Sapi berada di zona nyaman maksimal, mendukung kesehatan dan produksi susu yang optimal. Pertahankan sirkulasi udara yang baik.';
    } else {
      return 'Suhu telah memasuki zona panas. Sapi akan mulai menggunakan energi untuk mendinginkan diri, yang dapat mengurangi produksi susu. Pastikan air minum selalu tersedia dan pertimbangkan untuk menyalakan kipas angin.';
    }
  }

  Color getTemperatureColor(num value) {
    final coolLimit =
        _cubit.state.coolLimit.maybeMap(orElse: () => 0, data: (s) => s.data);
    final idealLimit =
        _cubit.state.idealLimit.maybeMap(orElse: () => 0, data: (s) => s.data);

    if (value < coolLimit) {
      return Colors.blue;
    } else if (value >= coolLimit && value < idealLimit) {
      return ColorValues.primary50;
    } else {
      return ColorValues.danger50;
    }
  }

  Widget _buildHumidityWidget() {
    var maxHumid = _humidLimit;
    final humidity =
        _cubit.state.humidity.maybeMap(orElse: () => null, data: (s) => s.data);
    if (humidity != null) {
      debugPrint('humidity test $humidity');
      if (humidity > maxHumid) {
        maxHumid = humidity;
      }
    }
    debugPrint('max humidity $maxHumid, humidity $humidity');
    return CircularChartWidget(
      color: getHumidityColor(humidity ?? 0),
      header: context.l10n.humidity,
      title: humidity == null ? '-' : '$humidity%',
      max: maxHumid.toDouble(),
      value: humidity == null ? 0 : humidity.toDouble(),
      child: Text(
        humidity == null ? '-' : getHumidityDescription(humidity),
      ),
    );
  }
}
