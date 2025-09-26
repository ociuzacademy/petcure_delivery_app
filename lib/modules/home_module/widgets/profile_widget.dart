// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_delivery_app/modules/home_module/widgets/profile_info_row.dart';
import 'package:petcure_delivery_app/modules/home_module/widgets/profile_stat_card.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  // Sample delivery executive data
  final String executiveName = 'Rajesh Kumar';
  final String phoneNumber = '+91 9876543210';
  final String email = 'rajesh.kumar@petexpress.com';
  final String address = 'Sector 15, Noida, Uttar Pradesh, 201301';

  // Delivery statistics
  final int totalDeliveries = 1247;
  final int todaysDeliveries = 18;
  final int pendingDeliveries = 5;
  final double rating = 4.7;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.05,
        vertical: screenSize.height * 0.01,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05,
            vertical: screenSize.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with avatar and basic info
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.orange[100],
                    child: Icon(
                      Icons.delivery_dining,
                      size: 30,
                      color: Colors.orange[800],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          executiveName,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '$rating • Pet Express Delivery Partner',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Contact Information Section
              const Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 12),

              ProfileInfoRow(
                icon: Icons.location_on,
                iconColor: Colors.red,
                label: 'Delivery Area:',
                value: address,
              ),

              const SizedBox(height: 8),

              ProfileInfoRow(
                icon: Icons.phone,
                iconColor: Colors.green,
                label: 'Mobile:',
                value: phoneNumber,
              ),

              const SizedBox(height: 8),

              ProfileInfoRow(
                icon: Icons.email,
                iconColor: Colors.orange,
                label: 'Email:',
                value: email,
              ),

              const SizedBox(height: 20),

              // Delivery Statistics
              const Text(
                'Delivery Statistics',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 12),

              // Statistics Cards
              Row(
                children: [
                  Expanded(
                    child: ProfileStatCard(
                      title: 'Total Deliveries',
                      value: totalDeliveries.toString(),
                      bgColor: Colors.blue[100]!,
                      color: Colors.blue[800]!,
                      icon: Icons.local_shipping,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ProfileStatCard(
                      title: "Today's Deliveries",
                      value: todaysDeliveries.toString(),
                      bgColor: Colors.green[100]!,
                      color: Colors.green[800]!,
                      icon: Icons.today,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: ProfileStatCard(
                      title: 'Pending Deliveries',
                      value: pendingDeliveries.toString(),
                      bgColor: Colors.orange[100]!,
                      color: Colors.orange[800]!,
                      icon: Icons.pending_actions,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ProfileStatCard(
                      title: 'Customer Rating',
                      value: rating.toString(),
                      bgColor: Colors.purple[100]!,
                      color: Colors.purple[800]!,
                      icon: Icons.star,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // View today's deliveries
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      icon: const Icon(Icons.list_alt),
                      label: const Text('Today\'s Route'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Update status
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: const BorderSide(color: Colors.blue),
                      ),
                      icon: const Icon(Icons.update),
                      label: const Text('Update Status'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
