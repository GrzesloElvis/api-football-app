import 'package:flutter/material.dart';
import '../../data/models/league_model.dart';

class LeagueTile extends StatelessWidget {
  final League league;
  final VoidCallback onTap;

  const LeagueTile({super.key, required this.league, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
      width: 48,
      height: 48,
      child: Image.network(
        league.logo,
        fit: BoxFit.contain,
      ),
    ),

    title: Text(league.name),
      subtitle: Text(league.country),
      onTap: onTap,
    );
  }
}
