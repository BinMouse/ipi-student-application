import 'package:flutter/material.dart';

class AboutAppInfo extends StatelessWidget {
  const AboutAppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('О приложении'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/icons/android_icon.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'ИиПИ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Версия: 1.0.0',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 32),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Описание'),
              subtitle: const Text(
                'Приложние кафедры "Информатики и Программной Инженерии"',
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Разработчик'),
              subtitle: const Text('BinMouse'),
            ),
            ListTile(
              leading: const Icon(Icons.email_outlined),
              title: const Text('Контактный email'),
              subtitle: const Text('test@gmail.com'),
              onTap: () {
                // Открыть email-клиент
              },
            ),
            ListTile(
              leading: const Icon(Icons.public),
              title: const Text('Сайт'),
              subtitle: const Text('https://github.com/BinMouse'),
              onTap: () {
                // Открыть сайт
              },
            ),
          ],
        ),
      ),
    );
  }
}

