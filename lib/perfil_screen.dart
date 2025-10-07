import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil', style: TextStyle(color: Colors.amber)),
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header del perfil
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.amber,
                    child: Icon(Icons.person, size: 40, color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Pato Usuario',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.amber),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Usuario Fabulotho',
                    style: TextStyle(fontSize: 14, color: Colors.amber.shade300),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem('Pedidos', '24'),
                      _buildStatItem('Rating', '4.8'),
                      _buildStatItem('Miembro', '2024'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Opciones del perfil
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber),
              ),
              child: Column(
                children: [
                  _buildProfileOption(Icons.person, 'Editar Perfil'),
                  _buildProfileOption(Icons.history, 'Historial de Pedidos'),
                  _buildProfileOption(Icons.payment, 'Métodos de Pago'),
                  _buildProfileOption(Icons.location_on, 'Direcciones'),
                  _buildProfileOption(Icons.settings, 'Configuración'),
                  _buildProfileOption(Icons.help, 'Ayuda y Soporte'),
                  _buildProfileOption(Icons.logout, 'Cerrar Sesión', isLast: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber)),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.amber.shade300)),
      ],
    );
  }

  Widget _buildProfileOption(IconData icon, String text, {bool isLast = false}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.amber),
          title: Text(text, style: const TextStyle(color: Colors.amber)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.amber),
          onTap: () {},
        ),
        if (!isLast) Divider(color: Colors.amber.withOpacity(0.3), height: 1),
      ],
    );
  }
}