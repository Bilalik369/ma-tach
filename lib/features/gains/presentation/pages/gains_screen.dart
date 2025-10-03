import 'package:flutter/material.dart';
import '../../models/gains_models.dart';
import '../widgets/filter_dropdown.dart';
import '../widgets/gain_item.dart';
import '../widgets/upcoming_gain_item.dart';

class GainsScreen extends StatefulWidget {
  const GainsScreen({Key? key}) : super(key: key);

  @override
  State<GainsScreen> createState() => _GainsScreenState();
}

class _GainsScreenState extends State<GainsScreen> {
  String selectedDateFilter = 'Date';
  String selectedCampaignFilter = 'Campagne';

  final List<UpcomingGain> upcomingGains = [
    UpcomingGain(
      id: '1',
      amount: 150.00,
      campaign: 'Campagne : Road Trip d\'été',
      dueDate: 'Dans limite : 15 juillet',
    ),
    UpcomingGain(
      id: '2',
      amount: 75.00,
      campaign: 'Campagne : Escapade week-end',
      dueDate: 'Dans limite : 20 juillet',
    ),
  ];

  final List<GainData> gainsHistory = [
    GainData(
      id: '1',
      amount: 200.00,
      campaign: 'Campagne : Aventure des vacances de printemps',
      date: 'Reçu 10 juin',
      status: GainStatus.received,
    ),
    GainData(
      id: '2',
      amount: 300.00,
      campaign: 'Campagne : Voyage de ski d\'hiver',
      date: 'Reçu : 25 mai',
      status: GainStatus.received,
    ),
    GainData(
      id: '3',
      amount: 250.00,
      campaign: 'Campagne : Tournée des feuillages d\'automne',
      date: 'Reçu : 12 avril',
      status: GainStatus.received,
    ),
    GainData(
      id: '4',
      amount: 275.00,
      campaign: 'Campagne : Road Trip d\'été',
      date: 'Reçu : 5 mars',
      status: GainStatus.received,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf6f7f8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Gains',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              width: double.infinity,
              color: const Color(0xFFf6f7f8),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total des gains à vie',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '1 250,00 \$',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Gains à venir',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...upcomingGains.map((gain) => UpcomingGainItem(gain: gain)).toList(),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Historique des gains',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                
                  Row(
                    children: [
                      FilterDropdown(
                        value: selectedDateFilter,
                        items: ['Date', 'Cette semaine', 'Ce mois', 'Cette année'],
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDateFilter = newValue!;
                          });
                        },
                      ),
                      const SizedBox(width: 16),
                      FilterDropdown(
                        value: selectedCampaignFilter,
                        items: ['Campagne', 'Road Trip', 'Escapade', 'Aventure'],
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCampaignFilter = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                   
                    ...gainsHistory.map((gain) => GainItem(gain: gain)).toList(),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

}

