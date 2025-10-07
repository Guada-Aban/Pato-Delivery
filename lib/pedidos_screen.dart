import 'package:flutter/material.dart';

class PedidosScreen extends StatelessWidget {
  const PedidosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
      {
        'id': 'ORD-001',
        'restaurant': 'Resaurante El Pato Dorado',
        'items': '2x Hamburguesa, 1x Papas Fritas',
        'status': 'En camino',
        'time': '15 min',
        'address': 'Calle Fabulosa 123',
        'driver': 'Pato Veloz',
        'rating': 4.9,
        'total': '\$25.99',
        'statusColor': Colors.amber,
      },
      {
        'id': 'ORD-002',
        'restaurant': 'Pizzeria La Magnánima',
        'items': '1x Pizza Familiar, 2x Refrescos',
        'status': 'Preparando',
        'time': '25 min',
        'address': 'Av. Increíble 456',
        'driver': 'Pendiente',
        'rating': 5.0,
        'total': '\$42.50',
        'statusColor': Colors.amber.shade700,
      },
      {
        'id': 'ORD-003',
        'restaurant': 'Café del Pato',
        'items': '3x Café Express, 2x Facturas',
        'status': 'Entregado',//cambiar de estado a switch
        'time': 'Completado',
        'address': 'Plaza Superior 789',
        'driver': 'Pato Rápido',
        'rating': 4.8,
        'total': '\$18.75',
        'statusColor': Colors.amber.shade400,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Pedidos'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '¡Los pedidos más fabulosos del multiverso!',
            style: TextStyle(color: Colors.amber, fontSize: 14),
          ),
          const SizedBox(height: 16),
          ...orders.map((order) => _buildOrderCard(order, context)),
          const SizedBox(height: 16),
          _buildNewOrderCard(context),
        ],
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order['restaurant'],
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amber),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text('${order['rating']}', style: const TextStyle(fontSize: 12, color: Colors.amber)),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: order['statusColor'],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    order['status'],
                    style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Divider(height: 24, color: Colors.amber),
            _buildInfoRow(Icons.shopping_bag, order['items']),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.location_on, order['address']),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.access_time, order['time']),
            const Divider(height: 24, color: Colors.amber),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Repartidor', style: TextStyle(fontSize: 12, color: Colors.amber)),
                    Text(order['driver'], style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.amber)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Total', style: TextStyle(fontSize: 12, color: Colors.amber)),
                    Text(
                      order['total'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (order['status'] != 'Entregado') ...[
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text('Seguir Pedido'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.amber),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 14, color: Colors.amber))),
      ],
    );
  }

  Widget _buildNewOrderCard(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(Icons.shopping_bag, size: 48, color: Colors.amber),
            const SizedBox(height: 16),
            const Text('¿Nuevo Pedido?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber)),
            const SizedBox(height: 8),
            const Text('¡Haz un pedido MAGNÁNIMO ahora mismo!', style: TextStyle(fontSize: 14, color: Colors.amber)),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                ),
                child: const Text('Hacer Nuevo Pedido'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
