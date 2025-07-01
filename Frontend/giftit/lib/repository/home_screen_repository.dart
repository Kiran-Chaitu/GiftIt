import 'package:giftit/utils/app_urls.dart';
import '../data/Network/base_api_services.dart';
import '../data/Network/network_api_services.dart';
import '../models/home_screen_models/available_donations_model.dart';
import '../models/home_screen_models/donations_status.dart'; // Add this import

class DonationRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  final bool useDummyData = true;

  Future<List<DonationStatusModel>> fetchDonationStatus() async {
    if (useDummyData) {
      return [
        DonationStatusModel(
          item: 'Books',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/3771/3771518.png',
          status: 'Active',
        ),
        DonationStatusModel(
          item: 'Clothes',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/1853/1853743.png',
          status: 'Claimed',
        ),
        DonationStatusModel(
          item: 'Food',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/1046/1046754.png',
          status: 'Cancelled',
        ),
      ];
    }

    final response = await _apiServices.getApi(AppUrls.DonationsStatusUrl());
    final List data = response['data'];
    return data.map((e) => DonationStatusModel.fromJson(e)).toList();
  }

  Future<List<AvailableDonationModel>> fetchAvailableDonations() async {
    if (useDummyData) {
      return [
        AvailableDonationModel(
          id: '1',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAJSEKHRO5Xr0JGPJ9jAFQg_CLm7rprJJqDajtUe4vdjltVCKETMFalm4Xm_L-jrLoAV0&usqp=CAU',
          name: 'Ankit Sharma',
          item: 'Clothes',
          address: 'Delhi, India',
          items: [
            {'name': 'Shirt', 'pieces': 2},
            {'name': 'Pant', 'pieces': 1},
          ],
        ),
        AvailableDonationModel(
          id: '2',
          imageUrl:
              'https://i.pinimg.com/736x/9d/37/e4/9d37e4c5998d7e0290900bd2b05e372c.jpg',
          name: 'Rina Patel',
          item: 'Food',
          address: 'Ahmedabad, India',
          items: [
            {'name': 'Shirt', 'pieces': 2},
            {'name': 'Pant', 'pieces': 1},
          ],
        ),
        AvailableDonationModel(
          id: '3',
          imageUrl:
              'https://thumbs.dreamstime.com/b/book-icon-black-background-flat-style-vector-illustration-168420237.jpg',
          name: 'Mohit Raj',
          item: 'Books',
          address: 'Patna, India',
          items: [
            {'name': 'Shirt', 'pieces': 2},
            {'name': 'Pant', 'pieces': 1},
          ],
        ),
      ];
    }

    final response = await _apiServices.getApi(AppUrls.availableDonationsUrl());
    final List data = response['data'];
    return data.map((e) => AvailableDonationModel.fromJson(e)).toList();
  }

  Future<int> fetchDonationCount() async {
    final response = await _apiServices.getApi(AppUrls.donationCountUrl());
    return response['data']['count'] ?? 0;
  }

  Future<void> claimDonation(String donationId) async {
    final body = {'donationId': donationId};
    await _apiServices.postApi(AppUrls.claimDonationUrl(), body);
  }
}
