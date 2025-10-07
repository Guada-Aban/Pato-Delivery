import 'package:flutter/material.dart';
import 'dart:math' as math;


// --- Modelo de Datos para el Repartidor ---
class Repartidor {
  final int rank;
  final String nombre;
  final int entregas;
  final double rating;
  final int tiempoPromedio;
  final String avatarUrl;


  const Repartidor({
    required this.rank,
    required this.nombre,
    required this.entregas,
    required this.rating,
    required this.tiempoPromedio,
    required this.avatarUrl,
  });
}


// --- Datos de Ejemplo (ahora son constantes globales) ---
const List<Repartidor> _repartidoresData = [
  Repartidor(rank: 1, nombre: 'Pato Veloz', entregas: 342, rating: 4.9, tiempoPromedio: 12, avatarUrl: ''),
  Repartidor(rank: 2, nombre: 'Pato Rápido', entregas: 298, rating: 4.8, tiempoPromedio: 14, avatarUrl: ''),
  Repartidor(rank: 3, nombre: 'Pato Express', entregas: 276, rating: 4.7, tiempoPromedio: 15, avatarUrl: ''),
  Repartidor(rank: 4, nombre: 'Pato Turbo', entregas: 245, rating: 4.6, tiempoPromedio: 16, avatarUrl: ''),
  Repartidor(rank: 5, nombre: 'Pato Flash', entregas: 221, rating: 4.5, tiempoPromedio: 18, avatarUrl: ''),
  Repartidor(rank: 6, nombre: 'Pato Correcaminos', entregas: 198, rating: 4.4, tiempoPromedio: 19, avatarUrl: ''),
  Repartidor(rank: 7, nombre: 'Pato Sónico', entregas: 175, rating: 4.8, tiempoPromedio: 15, avatarUrl: ''),
  Repartidor(rank: 8, nombre: 'Pato Usuario', entregas: 156, rating: 4.8, tiempoPromedio: 14, avatarUrl: ''),
];

const Repartidor _usuarioActualData = Repartidor(rank: 8, nombre: 'Pato Usuario', entregas: 156, rating: 4.8, tiempoPromedio: 14, avatarUrl: '');


// --- Pantalla Principal del Ranking ---
class RankingPage extends StatelessWidget {
  const RankingPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    const goldColor = Color(0xFFFFD700);
    final backgroundColor = Colors.black54;


    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const _RankingHeader(goldColor: goldColor),
            _PodiumWidget(repartidores: _repartidoresData),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _repartidoresData.length - 3,
                itemBuilder: (context, index) {
                  final repartidor = _repartidoresData[index + 3];
                  return _RankingListItem(repartidor: repartidor);
                },
              ),
            ),
            const _YourPositionBar(usuarioActual: _usuarioActualData, goldColor: goldColor),
          ],
        ),
      ),
    );
  }
}


// --- Widget para el Header ---
class _RankingHeader extends StatelessWidget {
  final Color goldColor;
  const _RankingHeader({Key? key, required this.goldColor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Ranking Fabuloso',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w900,
          color: goldColor,
          letterSpacing: -0.5,
        ),
      ),
    );
  }
}


// --- Widget para el Podio ---
class _PodiumWidget extends StatelessWidget {
  final List<Repartidor> repartidores;
  const _PodiumWidget({Key? key, required this.repartidores}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _PodiumPlaceWidget(
            repartidor: repartidores[1],
            borderColor: const Color(0xFFC0C0C0),
            podiumHeight: 80,
            avatarRadius: 30,
          ),
          const SizedBox(width: 10),
          _PodiumPlaceWidget(
            repartidor: repartidores[0],
            borderColor: const Color(0xFFFFD700),
            podiumHeight: 110,
            avatarRadius: 38,
            isFirstPlace: true,
          ),
          const SizedBox(width: 10),
          _PodiumPlaceWidget(
            repartidor: repartidores[2],
            borderColor: const Color(0xFFCD7F32),
            podiumHeight: 60,
            avatarRadius: 30,
          ),
        ],
      ),
    );
  }
}


// --- Widget para cada lugar del Podio ---
class _PodiumPlaceWidget extends StatelessWidget {
  final Repartidor repartidor;
  final Color borderColor;
  final double podiumHeight;
  final double avatarRadius;
  final bool isFirstPlace;


  const _PodiumPlaceWidget({
    Key? key,
    required this.repartidor,
    required this.borderColor,
    required this.podiumHeight,
    required this.avatarRadius,
    this.isFirstPlace = false,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isFirstPlace)
          Transform.rotate(
            angle: -math.pi / 20,
            child: const Icon(Icons.emoji_events, color: Color(0xFFFFD700), size: 32),
          ),
        if (!isFirstPlace) const SizedBox(height: 32),
        const SizedBox(height: 4),
        CircleAvatar(
          radius: avatarRadius + 3,
          backgroundColor: borderColor,
          child: CircleAvatar(
            radius: avatarRadius,
            backgroundColor: Colors.grey[800],
            child: Text(
              repartidor.nombre.substring(0, 2).toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: avatarRadius * 0.6),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          repartidor.nombre,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          '${repartidor.entregas} Entregas',
          style: TextStyle(
            color: isFirstPlace ? const Color(0xFFFFD700) : Colors.grey[400],
            fontWeight: FontWeight.w600,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: podiumHeight,
          width: 85,
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            border: Border.all(color: borderColor, width: 2),
          ),
          child: Center(
              child: Text(
                '#${repartidor.rank}',
                style: TextStyle(
                    color: borderColor, fontSize: 32, fontWeight: FontWeight.w900),
              )),
        ),
      ],
    );
  }
}


// --- Widget para cada item de la lista de ranking ---
class _RankingListItem extends StatelessWidget {
  final Repartidor repartidor;
  const _RankingListItem({Key? key, required this.repartidor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900]?.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[800]!, width: 1),
      ),
      child: Row(
        children: [
          Text(
            '#${repartidor.rank}',
            style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[700],
            child: Text(
              repartidor.nombre.substring(0, 2).toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  repartidor.nombre,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${repartidor.entregas} Entregas',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${repartidor.rating} ★',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                '${repartidor.tiempoPromedio} min',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// --- Widget para la barra inferior de "Tu Posición" ---
class _YourPositionBar extends StatelessWidget {
  final Repartidor usuarioActual;
  final Color goldColor;

  const _YourPositionBar({Key? key, required this.usuarioActual, required this.goldColor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        border: Border(
          top: BorderSide(color: goldColor.withOpacity(0.5), width: 2),
        ),
      ),
      child: Row(
        children: [
          Text(
            '#${usuarioActual.rank}',
            style: TextStyle(
              color: goldColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 20,
            backgroundColor: goldColor,
            child: Text(
              usuarioActual.nombre.substring(0, 2).toUpperCase(),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tu Puesto',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${usuarioActual.entregas} Entregas',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${usuarioActual.rating} ★',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                '${usuarioActual.tiempoPromedio} min',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}