import '../models/championship.dart';
import 'api.dart';

class ChampionshipService {
  Future<List<Championship>> fetchChampionships() async {
    try {
      final response =
          await api.get("/api/v1/users/participating_championships");
      return response.data.map<Championship>((championship) {
        return Championship.fromJson(championship);
      }).toList();
    } catch (error) {
      rethrow;
    }
  }
}
