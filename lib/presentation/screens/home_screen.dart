import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/error_view.dart';
import '../../viewmodel/league_viewmodel.dart';
import '../../core/analytics_service.dart';
import '../widgets/search_bar.dart';
import '../widgets/league_tile.dart';
import 'league_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LeagueViewModel()..loadLeagues(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Ligi piłkarskie')),
        body: Consumer<LeagueViewModel>(
          builder: (context, vm, _) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (vm.errorMessage != null) {
              return ErrorView(
                message: vm.isOffline
                    ? 'Brak połączenia z internetem.\nWyświetlono zapisane dane.'
                    : 'Masz połączenie z internetem? :// \nWystąpił błąd podczas pobierania danych.',
                onRetry: vm.loadLeagues,
              );
            }


            return Column(
              children: [
                SearchBarWidget(
                  onChanged: (value) {
                    AnalyticsService.searchUsed(value);
                    vm.search(value);
                  },
                ),

                Row(
                  children: [
                    TextButton(
                      onPressed: vm.sortByName,
                      child: const Text('Sortuj A-Z'),
                    ),
                    TextButton(
                      onPressed: vm.sortByCountry,
                      child: const Text('Kraj'),
                    ),
                  ],
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: vm.filteredLeagues.length,
                    itemBuilder: (_, index) {
                      final league = vm.filteredLeagues[index];

                      return LeagueTile(
                        league: league,
                        onTap: () {
                          AnalyticsService.leagueSelected(league.name);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  LeagueDetailsScreen(league: league),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
