import 'package:url_launcher/url_launcher.dart';

/// Opens a URL, mailto:, or tel: link in the appropriate external app.
///
/// Named `openLink` (not `launch`) on purpose: `package:url_launcher`
/// itself still exports a deprecated top-level `launch()` function for
/// backwards compatibility, and having both in scope at once causes an
/// "ambiguous import" compile error in any file that needs both this
/// helper and `launchUrl`/`canLaunchUrl`/`LaunchMode` directly.
Future<void> openLink(String raw) async {
  final uri = Uri.parse(raw);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}
