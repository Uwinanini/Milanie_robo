import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String pair = 'EURUSD';
  String risk = 'Low';
  final lotController = TextEditingController(text: '0.01');
  final slController = TextEditingController(text: '20');
  final tpController = TextEditingController(text: '40');

  @override
  void dispose() {
    lotController.dispose();
    slController.dispose();
    tpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bot Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          DropdownButtonFormField<String>(
            value: pair,
            items: const [
              DropdownMenuItem(value: 'EURUSD', child: Text('EURUSD')),
              DropdownMenuItem(value: 'GBPUSD', child: Text('GBPUSD')),
              DropdownMenuItem(value: 'XAUUSD', child: Text('XAUUSD')),
            ],
            onChanged: (value) {
              setState(() {
                pair = value!;
              });
            },
            decoration: const InputDecoration(labelText: 'Trading Pair'),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: risk,
            items: const [
              DropdownMenuItem(value: 'Low', child: Text('Low')),
              DropdownMenuItem(value: 'Medium', child: Text('Medium')),
              DropdownMenuItem(value: 'High', child: Text('High')),
            ],
            onChanged: (value) {
              setState(() {
                risk = value!;
              });
            },
            decoration: const InputDecoration(labelText: 'Risk Level'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: lotController,
            decoration: const InputDecoration(labelText: 'Lot Size'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: slController,
            decoration: const InputDecoration(labelText: 'Stop Loss'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: tpController,
            decoration: const InputDecoration(labelText: 'Take Profit'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings saved')),
              );
            },
            child: const Text('Save Settings'),
          ),
        ],
      ),
    );
  }
}