import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../models/match_model.dart';
import 'match_detail_screen.dart';

class MatchListScreen extends StatelessWidget {
  const MatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Match List')),
      body: StreamBuilder<List<MatchModel>>(
        stream: FirestoreService.streamMatches(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final matches = snapshot.data!;
          if (matches.isEmpty) {
            return const Center(child: Text('No matches. Add some in Firestore.'));
          }

          return ListView.separated(
            itemCount: matches.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final m = matches[index];
              return ListTile(
                title: Text('${m.home} vs ${m.away}'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => MatchDetailScreen(matchId: m.id),
                  ));
                },
              );
            },
          );
        },
      ),
    );
  }
}
