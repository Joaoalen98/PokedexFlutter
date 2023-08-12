import 'package:flutter/material.dart';

class CardTipoPokemon extends StatelessWidget {
  const CardTipoPokemon({
    super.key,
    required this.backgroundCard,
    required this.tipo,
  });

  final String tipo;
  final Color? backgroundCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: backgroundCard?.withOpacity(0.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          width: 2,
          color: backgroundCard!.withOpacity(0.8),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Text(
        tipo,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
