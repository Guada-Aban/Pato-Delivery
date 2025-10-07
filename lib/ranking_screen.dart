import 'package:flutter/material.dart';

const List<Map<String, dynamic>> topDrivers = [
  {
    'rank': 1,
    'name': 'Pato Veloz',
    'deliveries': 342,
    'rating': 4.9,
    'avgTime': '12 min',
    'badge': 'SUPER VELOZ',
    'trend': '+15',
  },
  {
    'rank': 2,
    'name': 'Pato Rápido',
    'deliveries': 298,
    'rating': 4.8,
    'avgTime': '14 min',
    'badge': 'MAGNÁNIMO',
    'trend': '+8',
  },
  {
    'rank': 3,
    'name': 'Pato Express',
    'deliveries': 276,
    'rating': 4.7,
    'avgTime': '15 min',
    'badge': 'FABULOZO',
    'trend': '+12',
  },
  {
    'rank': 4,
    'name': 'Pato Turbo',
    'deliveries': 245,
    'rating': 4.6,
    'avgTime': '16 min',
    'badge': 'INCREÍBLE',
    'trend': '+5',
  },
  {
    'rank': 5,
    'name': 'Pato Flash',
    'deliveries': 223,
    'rating': 4.5,
    'avgTime': '17 min',
    'badge': 'ESPECTACULAR',
    'trend': '+3',
  },
];

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  Widget _buildStatTile(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.amber),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.amber, fontSize: 12)),
      ],
    );
  }

  Widget _buildDriverCard(Map<String, dynamic> driver, Map<int, Color> rankColors) {
    final rank = driver['rank'] as int;
    final badgeColor = rankColors.containsKey(rank) ? rankColors[rank] : Colors.grey.shade800;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: rank <= 3 ? Colors.amber : Colors.grey.shade800),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          if (rank <= 3)
            BoxShadow(
              color: Colors.amber.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Avatar + trophy badge
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.amber, width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.amber.withOpacity(0.1),
                    child: Text('#${driver['rank']}', style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                  ),
                ),
                if (rank <= 3)
                  Positioned(
                    right: -6,
                    top: -6,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: badgeColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.amber, width: 1),
                      ),
                      child: Icon(Icons.emoji_events, size: 14, color: rank == 1 ? Colors.black : Colors.amber),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(driver['name'], style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold))),
                      Row(
                        children: [
                          const Icon(Icons.trending_up, size: 16, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(driver['trend'], style: const TextStyle(color: Colors.amber, fontSize: 12)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.amber.withOpacity(0.1),
                      border: Border.all(color: Colors.amber),
                    ),
                    child: Text(driver['badge'], style: const TextStyle(color: Colors.amber, fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.local_shipping, size: 14, color: Colors.amber),
                          const SizedBox(width: 6),
                          Text('${driver['deliveries']}', style: const TextStyle(color: Colors.amber)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                          const SizedBox(width: 6),
                          Text('${driver['rating']}', style: const TextStyle(color: Colors.amber)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 14, color: Colors.amber),
                          const SizedBox(width: 6),
                          Text(driver['avgTime'], style: const TextStyle(color: Colors.amber)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rankColors = {
      1: Colors.amber,
      2: Colors.amber.shade800,
      3: Colors.amber.shade700,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking Fabuloso', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.amber),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header
          Row(
            children: [
              Icon(Icons.emoji_events, size: 36, color: Colors.amber.shade400),
              const SizedBox(width: 8),
              const Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Ranking Fabuloso', style: TextStyle(color: Colors.amber, fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 2),
                  Text('¡Los repartidores más MAGNÁNIMOS del equipo!', style: TextStyle(color: Colors.amber)),
                ]),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Stats card
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.amber),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatTile(Icons.inventory_2, '1,384', 'Entregas Totales'),
                _buildStatTile(Icons.star, '4.7', 'Rating Promedio'),
                _buildStatTile(Icons.access_time, '14.8', 'Min Promedio'),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // Drivers list
          ...topDrivers.map((d) => _buildDriverCard(d, rankColors)).toList(),

          const SizedBox(height: 12),

          // CTA card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.amber),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Icon(Icons.emoji_events, size: 36, color: Colors.amber.shade400),
                const SizedBox(height: 8),
                const Text('¡Únete al equipo más FABULOSO del multiverso!',
                    style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Text('Conviértete en repartidor y compite por el primer lugar',
                    style: TextStyle(color: Colors.amber.shade300)),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
