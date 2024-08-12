import 'dart:developer';

import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class DropPage extends StatefulWidget {
  const DropPage({super.key});

  @override
  State<DropPage> createState() => _DropPageState();
}

class _DropPageState extends State<DropPage> {
  late DropzoneViewController controller;
  String message = 'Solte o arquivo aqui';
  bool highlighted = false;
  final Color colors = Colors.transparent;
  bool isFileSelected = false;
  String url = '';

  void displayImage(dynamic filePicked) async {
    url = await controller.createFileUrl(filePicked);
    setState(() {
      isFileSelected = true;
    });
  }

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
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final event = await controller.pickFiles();
                    displayImage(event.first);
                  },
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: highlighted
                          ? const Color.fromARGB(255, 136, 132, 131)
                          : colors,
                    ),
                    child: Stack(
                      children: [
                        DropzoneView(
                          onCreated: (ctrl) => controller = ctrl,
                          cursor: CursorType.grab,
                          onHover: () {
                            setState(() => highlighted = true);
                          },
                          onLeave: () {
                            setState(() => highlighted = false);
                          },
                          onDrop: (ev) async {
                            log('Zone 1 drop: ${ev.name}');
                            setState(() {
                              message = '${ev.name} dropped';
                              highlighted = false;
                              colors;
                            });
                            final bytes = await controller.getFileData(ev);
                            displayImage(ev);
                            log('${bytes.sublist(0, 20)}');
                          },
                        ),
                        Center(
                          child: Text(
                            message,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                (isFileSelected)
                    ? Image.network(
                        url,
                        fit: BoxFit.cover,
                        width: 400,
                        height: 300,
                      )
                    : const SizedBox.shrink()
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 70,
              width: 120,
              child: FilledButton(
                onPressed: () => setState(() {
                  message = 'Arraste o arquivo';

                  isFileSelected = false;
                }),
                child: const Text('Reset'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
