import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pato Delivery'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const OrderTrackingCard(),
            const SizedBox(height: 16),
            const DeliveryRankingCard(),
            const SizedBox(height: 16),
            const SuperVelothModeCard(),
            const SizedBox(height: 16),
            const EmergencyButtonCard(),
          ],
        ),
      ),
    );
  }
}

// Componente: OrderTrackingCard
class OrderTrackingCard extends StatelessWidget {
  const OrderTrackingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.local_shipping, color: Colors.black),
                const SizedBox(width: 8),
                const Text('Seguimiento de Pedido', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Tu pedido está en camino', style: TextStyle(fontSize: 16, color: Colors.black54)),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.7,
              backgroundColor: Colors.black,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            const Text('Tiempo estimado: 15 minutos', style: TextStyle(color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}

// Componente: DeliveryRankingCard
class DeliveryRankingCard extends StatelessWidget {
  const DeliveryRankingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.emoji_events, color: Colors.amber),
                const SizedBox(width: 8),
                const Text('Ranking de Repartidores', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
            const SizedBox(height: 16),
            _buildRankItem('🥇', 'Pato Vehloth', '4.9 ⭐', context),
            _buildRankItem('🥈', 'Pato Rápido', '4.8 ⭐', context),
            _buildRankItem('🥉', 'Pato Expreth', '4.7 ⭐', context),
          ],
        ),
      ),
    );
  }

  Widget _buildRankItem(String medal, String name, String rating, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(medal, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black))),
          Text(rating, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}

// Componente: SuperVelothModeCard
class SuperVelothModeCard extends StatelessWidget {
  const SuperVelothModeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.flash_on, color: Colors.black, size: 48),
            const SizedBox(height: 12),
            const Text(
              'MODO THUPER VEHLOTH',
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              '¡Entregas en tiempo récord!',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.amber,
              ),
              child: const Text('Activar Modo'),
            ),
          ],
        ),
      ),
    );
  }
}

// Componente: EmergencyButtonCard
class EmergencyButtonCard extends StatelessWidget {
  const EmergencyButtonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.black, size: 48),
            const SizedBox(height: 12),
            const Text(
              'Botón de Emergencia',
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Presiona en caso de emergencia',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
              ),
              child: const Text('SOS'),
            ),
          ],
        ),
      ),
    );
  }
}