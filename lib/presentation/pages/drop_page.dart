import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zip_and_unzip_files/core/core.dart';

class DropPage extends StatelessWidget {
  const DropPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushNamed(context, AppRoute.homePage),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => log('Clicou no "Selecionar arquivo"'),
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF555151),
                ),
                child: const Center(
                  child: Text('Selecionar arquivo'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
