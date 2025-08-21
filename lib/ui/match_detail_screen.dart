import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MatchDetailScreen extends StatelessWidget {
  final String matchId;

  const MatchDetailScreen({super.key, required this.matchId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(matchId),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('matches')
            .doc(matchId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final match = snapshot.data!;
          final home = match['home'];
          final away = match['away'];
          final homeGoals = match['homeGoals'];
          final awayGoals = match['awayGoals'];
          final runningSecs = match['runningSecs'];
          final totalSecs = match['totalSecs'];

          final minutes = (runningSecs ~/ 60).toString().padLeft(2, '0');
          final seconds = (runningSecs % 60).toString().padLeft(2, '0');
          final totalMinutes = (totalSecs ~/ 60).toString().padLeft(2, '0');
          final totalSeconds = (totalSecs % 60).toString().padLeft(2, '0');

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                margin: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        '$home vs $away',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$homeGoals : $awayGoals',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Time : $minutes:$seconds',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Total Time : $totalMinutes:$totalSeconds',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
