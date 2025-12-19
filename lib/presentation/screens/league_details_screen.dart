import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/league_model.dart';
import '../../viewmodel/league_details_viewmodel.dart';

class LeagueDetailsScreen extends StatelessWidget {
  final League league;

  const LeagueDetailsScreen({super.key, required this.league});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LeagueDetailsViewModel()..loadDetails(league.id),
      child: Scaffold(
        appBar: AppBar(title: Text(league.name)),
        body: Consumer<LeagueDetailsViewModel>(
          builder: (context, vm, _) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (vm.error != null) {
              return Center(child: Text(vm.error!));
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      league.logo,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('ID: ${league.id}'),
                  Text('Typ: ${league.type}'),
                  Text('Kraj: ${league.country}'),
                  Text('Sezon: ${league.season}'),
                  const SizedBox(height: 12),
                  Text(
                    'Liczba drużyn w lidze: ${vm.teamsCount}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
