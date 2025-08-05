class MachineActivityModel {
  MachineActivityModel({
    required this.dateTime,
    required this.status,
    this.totalUsage,
    this.electricityUsage,
  });

  final DateTime dateTime;
  final String status;
  final num? totalUsage;
  final num? electricityUsage;
}

List<MachineActivityModel> generateDummyMachineActivityModels() {
  return List.generate(
    10,
    (index) => MachineActivityModel(
      dateTime: DateTime.now().subtract(Duration(days: index)),
      status: index % 3 == 0 ? 'on' : index % 3 == 1 ? 'off' : 'overload',
      totalUsage: (index + 1) * 10,
      electricityUsage: (index + 1) * 5,
    ),
  );
}
