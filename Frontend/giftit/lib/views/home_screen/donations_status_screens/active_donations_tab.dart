import 'package:flutter/material.dart';

import 'data.dart';

class ActiveDonationsTab extends StatefulWidget {
  @override
  _ActiveDonationsTabState createState() => _ActiveDonationsTabState();
}

class _ActiveDonationsTabState extends State<ActiveDonationsTab> {
  List<Map<String, dynamic>> donations = List.from(activeDonations);

  void _viewDetails(Map<String, dynamic> donation) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Donation Details"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: donation['items'].map<Widget>((item) {
            return ListTile(
              title: Text(item['name']),
              subtitle: Text("Size: ${item['size']}, Pieces: ${item['pieces']}"),
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            child: Text("Claim"),
            onPressed: () {
              setState(() {
                pendingDonations.add(donation);
                donations.remove(donation);
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: donations.length,
      itemBuilder: (_, index) {
        final item = donations[index];
        return Card(
          child: ListTile(
            title: Text(item['type']),
            subtitle: Text(item['location']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(onPressed: () => _viewDetails(item), child: Text("View")),
                TextButton(
                  onPressed: () {
                    setState(() {
                      donations.removeAt(index);
                    });
                  },
                  child: Text("Cancel", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
