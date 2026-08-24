import 'package:url_launcher/url_launcher.dart';

/// Non-web fallback: this portfolio is primarily deployed as a web app, so on
/// mobile/desktop builds we simply open the GitHub profile instead of
/// triggering a native file save (which would need extra platform plumbing).
Future<bool> downloadResume() async {
  final uri = Uri.parse('https://github.com/ayeshaasif50');
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
    return true;
  }
  return false;
}
