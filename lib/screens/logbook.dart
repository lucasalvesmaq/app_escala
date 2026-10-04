import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../models/flight_log.dart';

class LogbookScreen extends StatefulWidget {
  const LogbookScreen({Key? key}) : super(key: key);

  @override
  State<LogbookScreen> createState() => _LogbookScreenState();
}

class _LogbookScreenState extends State<LogbookScreen> {
  int _selectedTabIndex = 0;

  final List<FlightLog> flightLogs = [
    FlightLog(
      date: '2024-10-01',
      origin: 'GIG',
      destination: 'SDU',
      departureTime: '06:30',
      arrivalTime: '07:45',
      aircraftType: 'A320',
      pilotFunctionCode: 'PF',
      diurnalHours: 1.25,
      nocturnalHours: 0.0,
    ),
    FlightLog(
      date: '2024-10-02',
      origin: 'SDU',
      destination: 'BSB',
      departureTime: '14:00',
      arrivalTime: '15:30',
      aircraftType: 'A320',
      pilotFunctionCode: 'PM',
      diurnalHours: 1.5,
      nocturnalHours: 0.0,
    ),
    FlightLog(
      date: '2024-10-03',
      origin: 'BSB',
      destination: 'GIG',
      departureTime: '22:00',
      arrivalTime: '00:15',
      aircraftType: 'A320',
      pilotFunctionCode: 'PF',
      diurnalHours: 0.0,
      nocturnalHours: 2.25,
    ),
    FlightLog(
      date: '2024-10-04',
      origin: 'GIG',
      destination: 'MIA',
      departureTime: '02:30',
      arrivalTime: '07:00',
      aircraftType: 'A350',
      pilotFunctionCode: 'PM',
      diurnalHours: 2.0,
      nocturnalHours: 2.5,
    ),
  ];

  late double totalDiurnalHours;
  late double totalNocturnalHours;

  @override
  void initState() {
    super.initState();
    _calculateTotalHours();
  }

  void _calculateTotalHours() {
    totalDiurnalHours = flightLogs.fold(0, (sum, log) => sum + log.diurnalHours);
    totalNocturnalHours = flightLogs.fold(0, (sum, log) => sum + log.nocturnalHours);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logbook'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: _buildHoursSummary(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildTabBar(),
          ),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildHoursSummary() {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Horas Diurnas',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${totalDiurnalHours.toStringAsFixed(1)}h',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.latamBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Horas Noturnas',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${totalNocturnalHours.toStringAsFixed(1)}h',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildTabButton('Visualizar', 0),
          _buildTabButton('Sincronizar', 1),
          _buildTabButton('Exportar', 2),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    final isSelected = _selectedTabIndex == index;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: isSelected ? AppTheme.latamBlue : Colors.grey,
        ),
        labelStyle: TextStyle(
          color: isSelected ? AppTheme.latamBlue : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildViewTab();
      case 1:
        return _buildSyncTab();
      case 2:
        return _buildExportTab();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildViewTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: flightLogs.length,
      itemBuilder: (context, index) {
        final log = flightLogs[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${log.origin} → ${log.destination}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          log.date,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    _buildPilotFunctionBadge(log.pilotFunctionCode),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Aeronave',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        Text(
                          log.aircraftType,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Partida',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        Text(
                          log.departureTime,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Chegada',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        Text(
                          log.arrivalTime,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(height: 1),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildHourBadge(
                      'Diurnas',
                      '${log.diurnalHours.toStringAsFixed(2)}h',
                      AppTheme.latamBlue,
                    ),
                    _buildHourBadge(
                      'Noturnas',
                      '${log.nocturnalHours.toStringAsFixed(2)}h',
                      Colors.purple,
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

  Widget _buildSyncTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_sync,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          const Text(
            'Sincronizar com iFlight',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Importar dados do mês anterior do iFlight',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.sync),
            label: const Text('Sincronizar Agora'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.latamBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Sincronização em progresso...'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExportTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.download,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          const Text(
            'Exportar Logbook',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Selecione o formato de exportação',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildExportButton(
                icon: Icons.description,
                label: 'PDF',
                onTap: () => _showExportMessage('PDF'),
              ),
              const SizedBox(width: 16),
              _buildExportButton(
                icon: Icons.table_chart,
                label: 'Excel',
                onTap: () => _showExportMessage('Excel'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExportButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.latamBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: onTap,
    );
  }

  Widget _buildPilotFunctionBadge(String code) {
    final isGreen = code == 'PF';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isGreen ? AppColors.pfGreen : AppColors.pmBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        code,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildHourBadge(String label, String hours, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: color,
            ),
          ),
          Text(
            hours,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  void _showExportMessage(String format) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Exportando em $format...'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
