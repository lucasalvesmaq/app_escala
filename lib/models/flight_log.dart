class FlightLog {
  final String date;
  final String origin;
  final String destination;
  final String departureTime;
  final String arrivalTime;
  final String aircraftType;
  final String pilotFunctionCode;
  final double diurnalHours;
  final double nocturnalHours;

  FlightLog({
    required this.date,
    required this.origin,
    required this.destination,
    required this.departureTime,
    required this.arrivalTime,
    required this.aircraftType,
    required this.pilotFunctionCode,
    required this.diurnalHours,
    required this.nocturnalHours,
  });
}
