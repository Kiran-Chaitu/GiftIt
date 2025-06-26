import 'package:flutter/material.dart';

import 'data.dart';

class PendingDonationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pendingDonations.length,
      itemBuilder: (_, index) {
        final item = pendingDonations[index];
        return Card(
          child: ListTile(
            title: Text(item['type']),
            subtitle: Text(item['location']),
            trailing: TextButton(
              child: Text("View"),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("Pending Donation"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: item['items'].map<Widget>((i) {
                        return ListTile(
                          title: Text(i['name']),
                          subtitle: Text("Size: ${i['size']}, Pieces: ${i['pieces']}"),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
