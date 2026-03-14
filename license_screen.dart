import 'package:flutter/material.dart';
import '../services/license_service.dart';
import 'dashboard_screen.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({super.key});

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {

  final licenseController = TextEditingController();
  String message = "";

  void activateLicense(){

    bool valid = LicenseService.validateKey(
      licenseController.text.trim(),
    );

    if(valid){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ),
      );

    }else{

      setState(() {
        message = "Invalid License Key";
      });

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Activate License"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: licenseController,
              decoration: const InputDecoration(
                labelText: "Enter License Key",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: activateLicense,
              child: const Text("Activate"),
            ),

            const SizedBox(height: 10),

            Text(message)

          ],
        ),
      ),
    );
  }
}