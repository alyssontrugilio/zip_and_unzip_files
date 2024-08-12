import 'package:flutter/material.dart';
import 'package:zip_and_unzip_files/core/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              child: const Text(
                'Compactar',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 50),
            FilledButton(
              onPressed: () {},
              child: const Text('Descompactar'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () => Navigator.pushNamed(
          context,
          AppRoute.dropPage,
        ),
        child: const Icon(Icons.archive),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
