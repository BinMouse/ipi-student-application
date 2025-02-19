import 'package:flutter/material.dart';
import 'package:ipi_app/primitives/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  //region Билдер
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //region Шапка профиля
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Аватар
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(Profile.instance.photoUrl ?? ''),
                      backgroundColor: Colors.grey[300],
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Основная информация
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Profile.instance.fullName ?? 'Имя не указано',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),
                        _buildInfoRow(Icons.phone, Profile.instance.phoneNumber ?? 'Телефон не указан'),

                        const SizedBox(height: 8),
                        _buildInfoRow(Icons.mail, Profile.instance.emailAdress ?? 'Почта не указана'),
                      ],
                    ),
                  ),

                ],
              ),
              //endregion Шапка профиля

              const SizedBox(height: 24), // отступ

              //region Дополнительная информация
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Учебная информация',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow(
                      Icons.group,
                      Profile.instance.groupName ?? 'Группа не указана',
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      Icons.numbers,
                      Profile.instance.groupNumber ?? 'Номер группы не указан',
                    ),
                  ],
                ),
              ),
              //endregion Дополнительная информация
            ],
          ),
        ),
      ),
    );
  }

  //endregion Билдер

  // вспомогательный билдер для строки личной информации
  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.blue),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}