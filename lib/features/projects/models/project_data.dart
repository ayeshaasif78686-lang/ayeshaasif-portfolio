import 'package:flutter/material.dart';

class ProjectData {
  final String title;
  final String category;
  final String image;
  final String body;
  final List<String> tags;
  final String github;
  const ProjectData(this.title, this.category, this.image, this.body, this.tags, this.github);
}

