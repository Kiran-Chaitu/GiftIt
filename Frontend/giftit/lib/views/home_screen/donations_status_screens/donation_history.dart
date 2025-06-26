import 'package:flutter/material.dart';

import 'data.dart';

class HistoryDonationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: historyDonations.length,
      itemBuilder: (_, index) {
        final item = historyDonations[index];
        return Card(
          child: ListTile(
            title: Text(item['type']),
            subtitle: Text(item['location']),
          ),
        );
      },
    );
  }
}
