import 'package:flutter/material.dart';

class StatPokemon extends StatelessWidget {
  final String statName;
  final int baseStat;
  final double porcentagem;
  final Color backgroundColor;

  const StatPokemon({
    super.key,
    required this.statName,
    required this.baseStat,
    required this.porcentagem,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            statName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: porcentagem,
                height: 25,
                decoration: BoxDecoration(
                  color: backgroundColor.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    color: backgroundColor,
                    width: 2,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.bottomRight,
                width: 25,
                child: Text(
                  baseStat.toString(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
