// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petcure_delivery_app/core/theme/app_palette.dart';

import 'package:petcure_delivery_app/modules/home_module/widgets/profile_info_row.dart';

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
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: 'https://avatar.iran.liara.run/public',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) =>
                          CircularProgressIndicator(
                            value: progress.progress,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppPalette.firstColor,
                            ),
                          ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
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

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Update status
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: const BorderSide(color: AppPalette.firstColor),
                        backgroundColor: AppPalette.firstColor,
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.update),
                      label: const Text('Update Profile'),
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
