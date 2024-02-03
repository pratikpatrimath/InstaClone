import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/screen/add_post.dart';
import 'package:instaclone/screen/feed_Screen.dart';
import 'package:instaclone/screen/profile_screen.dart';
import 'package:instaclone/screen/search_screen.dart';

const webscreensize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('notifications'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
