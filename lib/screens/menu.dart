import 'package:flutter/material.dart';
import '../utils/theme.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool _showSalary = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mostrar Salário',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Exibe valores de salário nos voos',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: _showSalary,
                          onChanged: (value) {
                            setState(() {
                              _showSalary = value;
                            });
                          },
                          activeColor: AppTheme.latamBlue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Contato',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildContactTile(
              icon: Icons.email,
              title: 'Email',
              value: 'lucas.alves@latam.com',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            _buildContactTile(
              icon: Icons.phone,
              title: 'Telefone',
              value: '+55 (11) 99999-9999',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            _buildContactTile(
              icon: Icons.chat,
              title: 'WhatsApp',
              value: '+55 (11) 99999-9999',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: AppTheme.latamBlue,
        ),
        title: Text(title),
        subtitle: Text(value),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
