import 'package:flutter/material.dart';
import 'package:instaclone/provider/userprovider.dart';
import 'package:instaclone/responsive/dimension.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget mobilescreen;
  final Widget webscreen;
  const ResponsiveLayout(
      {super.key, required this.mobilescreen, required this.webscreen});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    // TODO: implement initState

    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constaints) {
      if (constaints.maxWidth > webscreensize) {
        //web
        return widget.webscreen;
      } else {
        //mobile
        return widget.mobilescreen;
      }
    });
  }
}
