import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';

import 'data.dart';

class PendingDonationsTab extends StatefulWidget {
  @override
  State<PendingDonationsTab> createState() => _PendingDonationsTabState();
}

class _PendingDonationsTabState extends State<PendingDonationsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pendingDonations.length,
      itemBuilder: (_, index) {
        final item = pendingDonations[index];
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            child: ListTile(
              tileColor: AppColors.lightGreen,
              title: Text(item['type']),
              subtitle: Text(item['location']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    child: Text("View",style: TextStyle(color: AppColors.primaryGreen),),
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
                  TextButton(
                    onPressed: () {
                      setState(() {
                        activeDonations.add(item);
                        pendingDonations.removeAt(index);
                      });
                    },
                    child: Text("Cancel", style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),

            ),
          ),
        );
      },
    );
  }
}
