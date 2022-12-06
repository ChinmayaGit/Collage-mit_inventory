import 'package:get/get.dart';
import 'package:mitwpuinventory/constants/colorSet.dart';
import 'package:flutter/material.dart';
import 'package:mitwpuinventory/constants/global.dart';
import 'package:mitwpuinventory/login.dart';
import 'package:mitwpuinventory/pages/admin.dart';
import 'package:mitwpuinventory/pages/draft_page.dart';
import 'package:mitwpuinventory/pages/inbox_page.dart';
import 'package:mitwpuinventory/pages/sent_page.dart';
import 'package:mitwpuinventory/pages/setting_page.dart';
import 'package:mitwpuinventory/pages/starred_page.dart';
import 'app_route_observer.dart';

/// The navigation drawer for the app.
/// This listens to changes in the route to update which page is currently been shown
class AppDrawer extends StatefulWidget {
  const AppDrawer({required this.permanentlyDisplay, Key? key})
      : super(key: key);

  final bool permanentlyDisplay;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with RouteAware {
  String? _selectedRoute;
  AppRouteObserver? _routeObserver;

  @override
  void initState() {
    super.initState();
    _routeObserver = AppRouteObserver();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   _routeObserver!.subscribe(this, ModalRoute.of(context));
  // }

  @override
  void dispose() {
    _routeObserver!.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _updateSelectedRoute();
  }

  @override
  void didPop() {
    _updateSelectedRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: backGroundColor,
        ),
      ),
      backgroundColor: backGroundColor,
      child: Row(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
                  height: 55,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: const UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,

                    // decoration: BoxDecoration(
                    //   color:  Color(0xff7c94b6),
                    //   image:  DecorationImage(
                    //     image: NetworkImage(
                    //         'https://community.cloudflare.steamstatic.com/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxH5rd9eDAjcFyv45SRYAFMIcKL_PArgVSL403ulRUWEndVKv8jpiLBQwkalYBsuKjKF85h6eZKD4Rv9i0xtWJxfGtMr3XkDhQuMQm3eiWo972igH6oQM7LlwVl88/300x'),
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    accountName: Text('User'),
                    accountEmail: Text('user@email.com'),
                    currentAccountPicture: CircleAvatar(
                      child: Icon(Icons.android),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.white),
                    child: ListTile(
                      leading: const Icon(Icons.inbox_outlined),
                      title: const Text("Inbox"),
                      onTap: () async {
                        Get.to(const InboxPage());
                      },
                      // selected: _selectedRoute == RouteNames.inbox,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.white),
                    child: ListTile(
                      leading: const Icon(Icons.star_border_purple500_outlined),
                      title: const Text("starred"),
                      onTap: () async {

                        Get.to(const StarredPage());
                      },
                      // selected: _selectedRoute == RouteNames.starred,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.white),
                    child: ListTile(
                      leading: const Icon(Icons.send_rounded),
                      title: const Text("Sent"),
                      onTap: () {

                        Get.to(const SentPage());
                      },
                      // selected: _selectedRoute == RouteNames.sent,
                    ),
                  ),
                ),
                // const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.white),
                    child: ListTile(
                      leading: const Icon(Icons.drafts_outlined),
                      title: const Text("drafts"),
                      onTap: () {
                        Get.to(const DraftPage());
                      },
                      // selected: _selectedRoute == RouteNames.draft,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.white),
                    child: ListTile(
                      leading: const Icon(Icons.settings_rounded),
                      title: const Text("setting"),
                      onTap: () async {
                        Get.to(const SettingPage());
                      },
                      // selected: _selectedRoute == RouteNames.draft,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.white),
                    child: ListTile(
                      leading: const Icon(Icons.person_add_alt_1_outlined),
                      title: const Text("Admin"),
                      onTap: () {
                        Get.to(const Admin());
                      },
                      // selected: _selectedRoute == Admin(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.white),
                    child: ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text("LogOut"),
                      onTap: () async {
                        Get.to(Login());
                        box.remove("token");
                      },
                      // selected: _selectedRoute == Admin(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // if (widget.permanentlyDisplay)
          //   const VerticalDivider(
          //     width: 1,
          //   )
        ],
      ),
    );
  }

  /// Closes the drawer if applicable (which is only when it's not been displayed permanently) and navigates to the specified route
  /// In a mobile layout, the a modal drawer is used so we need to explicitly close it when the user selects a page to display
  Future<void> _navigateTo(BuildContext context, String routeName) async {
    if (widget.permanentlyDisplay) {
      Navigator.pop(context);
    }
    await Navigator.pushNamed(context, routeName);
  }

  void _updateSelectedRoute() {
    setState(() {
      _selectedRoute = ModalRoute.of(context)!.settings.name;
    });
  }
}
