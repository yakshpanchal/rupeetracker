import 'package:flutter/material.dart';
import 'package:rupeetracker/features/Auth/Widgets/Textformfield.dart';
import 'user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<User> users = generateUsers();
  List<User> displayedUsers = [];
  int currentPage = 1;
  int itemsPerPage = 20;

  @override
  void initState() {
    super.initState();
    displayedUsers = getUsersForPage(currentPage);
  }

  List<User> getUsersForPage(int page) {
    int start = (page - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    return users.sublist(start, end > users.length ? users.length : end);
  }

  void loadMore() {
    setState(() {
      currentPage++;
      displayedUsers.addAll(getUsersForPage(currentPage));
    });
  }

  void filterUsers(String query) {
    setState(() {
      displayedUsers = users.where((user) {
        return user.name.toLowerCase().contains(query.toLowerCase()) ||
            user.phoneNumber.contains(query) ||
            user.city.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Future<void> _showEditRupeeDialog(User user) async {
    TextEditingController rupeeController =
        TextEditingController(text: user.rupee.toString());

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Rupee Value'),
            content :CustomTextFormFiled(
              controller: rupeeController,
              labelText: 'Rupee',
              prefixIcon: Icons.currency_rupee,
              validator: (value){},
              enabled: true,
              keyboardType: TextInputType.number,
              obscureText: false,
              onChanged: (value){},
            ),

          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  user.rupee = int.parse(rupeeController.text);
                  user.stockStatus = user.rupee > 50 ? "high" : "low";
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Homepage',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: UserSearchDelegate(users, filterUsers),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          // here create a filer feature that can we filter by name/phone/city
          Expanded(
            child: ListView.builder(
              itemCount: displayedUsers.length + 1,
              itemBuilder: (context, index) {
                if (index == displayedUsers.length) {
                  if (displayedUsers.length < users.length) {
                    return ElevatedButton(
                      onPressed: loadMore,
                      child: Text('Load More'),
                    );
                  } else {
                    return Container();
                  }
                }
                final user = displayedUsers[index];
                return Card(
                  // color: Colors.transparent,
                  elevation: 4.0,
                  // margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(user.imagePath),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    title: Text(
                      user.name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4.0),
                        Text(user.city, style: TextStyle(color: Colors.grey[600])),
                        Text(user.phoneNumber,
                            style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '₹${user.rupee}',
                          style: TextStyle(
                            color: user.stockStatus == "high"
                                ? Colors.green
                                : Colors.red,
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          user.stockStatus == "high"
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          size: 30,
                          color:
                              user.stockStatus == "high" ? Colors.green : Colors.red,
                        ),
            
                      ],
                    ),
                    onTap: () {
                      _showEditRupeeDialog(user);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserSearchDelegate extends SearchDelegate {
  final List<User> users;
  final Function(String) filterUsers;

  UserSearchDelegate(this.users, this.filterUsers);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    filterUsers(query);
    close(context, null);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    //  here we can filter this using name , city, phine number and city all
    final suggestions = users.where((user) {
      return user.name.toLowerCase().contains(query.toLowerCase()) ||
          user.phoneNumber.contains(query) ||
          user.city.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final user = suggestions[index];
        return ListTile(
          title: Text(user.name),
          subtitle: Text('${user.city} - ${user.phoneNumber}'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('₹${user.rupee}'),
              Icon(
                user.stockStatus == "high"
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
                size: 30,
                color: user.stockStatus == "high" ? Colors.green : Colors.red,
              ),
            ],
          ),
        );
      },
    );
  }
}
