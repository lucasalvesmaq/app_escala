import 'package:flutter/material.dart';
import '../utils/theme.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({Key? key}) : super(key: key);

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  // Dados de exemplo
  final double flightHours = 142.5;
  final double flightRate = 100.0;
  final double reserveHours = 20.0;
  final double reserveRate = 50.0;
  final double standbyHours = 16.0;
  final double standbyRate = 30.0;
  final int perDiemDays = 16;
  final double perDiemRate = 230.0;

  late double flightSalary;
  late double reserveSalary;
  late double standbySalary;
  late double perDiemSalary;
  late double totalSalary;

  @override
  void initState() {
    super.initState();
    _calculateSalary();
  }

  void _calculateSalary() {
    flightSalary = flightHours * flightRate;
    reserveSalary = reserveHours * reserveRate;
    standbySalary = standbyHours * standbyRate;
    perDiemSalary = perDiemDays * perDiemRate;
    totalSalary = flightSalary + reserveSalary + standbySalary + perDiemSalary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Salário'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSalarySection(
              title: 'Voos Programados',
              hours: flightHours,
              rate: flightRate,
              total: flightSalary,
              color: Colors.blue,
            ),
            const SizedBox(height: 12),
            _buildSalarySection(
              title: 'Reserva',
              hours: reserveHours,
              rate: reserveRate,
              total: reserveSalary,
              color: Colors.orange,
            ),
            const SizedBox(height: 12),
            _buildSalarySection(
              title: 'Standby',
              hours: standbyHours,
              rate: standbyRate,
              total: standbySalary,
              color: Colors.purple,
            ),
            const SizedBox(height: 12),
            _buildPerDiemSection(
              title: 'Diárias',
              days: perDiemDays,
              rate: perDiemRate,
              total: perDiemSalary,
              color: Colors.green,
            ),
            const SizedBox(height: 24),
            _buildTotalCard(),
            const SizedBox(height: 24),
            _buildWeeklyBreakdown(),
            const SizedBox(height: 24),
            _buildMonthProjection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSalarySection({
    required String title,
    required double hours,
    required double rate,
    required double total,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildCalculationRow('Horas:', '${hours.toStringAsFixed(1)}h'),
            _buildCalculationRow(
              'Tarifa:',
              'R\$ ${rate.toStringAsFixed(2)}',
              textAlign: TextAlign.right,
            ),
            const Divider(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'R\$ ${total.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerDiemSection({
    required String title,
    required int days,
    required double rate,
    required double total,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildCalculationRow('Dias:', '$days dias'),
            _buildCalculationRow(
              'Tarifa/dia:',
              'R\$ ${rate.toStringAsFixed(2)}',
              textAlign: TextAlign.right,
            ),
            const Divider(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'R\$ ${total.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalculationRow(String label, String value, {TextAlign textAlign = TextAlign.left}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 13)),
        Text(
          value,
          style: const TextStyle(fontSize: 13),
          textAlign: textAlign,
        ),
      ],
    );
  }

  Widget _buildTotalCard() {
    return Card(
      color: AppTheme.latamBlue,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Salário Total Mês',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'R\$ ${totalSalary.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyBreakdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Resumo Semanal',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            final weekSalary = totalSalary / 4;
            return Card(
              child: ListTile(
                title: Text('Semana ${index + 1}'),
                trailing: Text(
                  'R\$ ${weekSalary.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.latamBlue,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMonthProjection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Projeção Mensal',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildProjectionRow(
                  'Salário Base',
                  (flightSalary + reserveSalary + standbySalary).toStringAsFixed(2),
                ),
                const SizedBox(height: 8),
                _buildProjectionRow(
                  'Diárias',
                  perDiemSalary.toStringAsFixed(2),
                ),
                const Divider(height: 16),
                _buildProjectionRow(
                  'Total Estimado',
                  totalSalary.toStringAsFixed(2),
                  isBold: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectionRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        Text(
          'R\$ $value',
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            color: isBold ? AppTheme.latamBlue : null,
          ),
        ),
      ],
    );
  }
}
