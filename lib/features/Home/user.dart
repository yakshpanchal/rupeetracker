class User {
  final String name;
  final String phoneNumber;
  final String city;
  final String imagePath;
  int rupee;
  String stockStatus;

  User({
    required this.name,
    required this.phoneNumber,
    required this.city,
    required this.imagePath,
    required this.rupee,
    required this.stockStatus,
  });
}

List<User> generateUsers() {
  List<String> names = [
    "Alice",
    "Bob",
    "Charlie",
    "David",
    "Eve",
    "Frank",
    "Grace",
    "Hannah",
    "Ivy",
    "Jack",
    "Kathy",
    "Leo",
    "Mona",
    "Nina",
    "Oscar",
    "Paul",
    "Quinn",
    "Rita",
    "Sam",
    "Tina",
    "Uma",
    "Victor",
    "Wendy",
    "Xander",
    "Yara",
    "Zane",
    "Andy",
    "Betty",
    "Carlos",
    "Diana",
    "Ethan",
    "Fiona",
    "George",
    "Hilda",
    "Ian",
    "Julia",
    "Kevin",
    "Laura",
    "Mike",
    "Nancy",
    "Olivia",
    "Peter",
    "Queenie"
  ];

  List<String> cities = [
    "Mumbai",
    "Delhi",
    "Bangalore",
    "Hyderabad",
    "Ahmedabad",
    "Chennai",
    "Kolkata",
    "Surat",
    "Pune",
    "Jaipur",
    "Lucknow",
    "Kanpur",
    "Nagpur",
    "Visakhapatnam",
    "Indore",
    "Thane",
    "Bhopal",
    "Patna",
    "Vadodara",
    "Ghaziabad",
    "Ludhiana",
    "Agra",
    "Nashik",
    "Faridabad",
    "Meerut",
    "Rajkot",
    "Varanasi",
    "Srinagar",
    "Aurangabad",
    "Dhanbad",
    "Amritsar",
    "Navi Mumbai",
    "Allahabad",
    "Howrah",
    "Ranchi",
    "Gwalior",
    "Jabalpur",
    "Vijayawada",
    "Jodhpur",
    "Madurai",
    "Raipur",
    "Kota",
    "Guwahati",
    "Chandigarh",
  ];


  List<User> users = [];

  // here i am generated some diffrent values
  for (int i = 0; i < 43; i++) {
    int rupeeValue =
        (i * 3 + 10) % 101; // Just a formula to generate some varied values

    String stockStatus = rupeeValue > 50 ? "high" : "low";
    // here assign the stock status
    // Construct image path dynamically based on index
    String imagePath = 'assets/usersimage/user${(i % 20) + 1}.png';

    users.add(User(
      imagePath: imagePath,
      name: names[i],
      // here they random phone number
      phoneNumber: "9492${i.toString().padLeft(2, '0')}28${i.toString().padLeft(2, '4')}",
      city: cities[i % cities.length],
      rupee: rupeeValue,
      stockStatus: stockStatus,
    ));
  }

  return users;
}
