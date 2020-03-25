// import 'dart:math';

// class BackendService {
//   static Future<List> getSuggestions(String query) async {
//     await Future.delayed(Duration(seconds: 1));

//     return List.generate(3, (index) {
//       return {'name': query };
//     });
//   }
// }

class CitiesService {
  static final List<String> cities = [
    'branch1',
    'branch2',
    'branch3',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(cities);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}