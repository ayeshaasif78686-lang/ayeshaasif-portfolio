import 'dart:async';
import 'dart:html' as html;
import 'package:flutter/services.dart' show rootBundle;

/// Path Flutter registers the asset under (matches the `assets:` section of
/// pubspec.yaml). Kept as a constant so both the primary and fallback paths
/// always agree.
const String _resumeAssetKey = 'lib/assets/resume/Ayesha_Asif_Resume.pdf';

/// Triggers a real browser file download for the resume PDF.
///
/// Returns `true` on success so the caller can show feedback to the user.
/// Uses the byte-accurate `rootBundle` first (works in both debug `flutter
/// run -d chrome` and release `flutter build web`), then falls back to
/// opening the built asset URL directly if that ever fails.
Future<bool> downloadResume() async {
  try {
    final data = await rootBundle.load(_resumeAssetKey);
    final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    if (bytes.isEmpty) {
      throw StateError('Resume asset loaded with 0 bytes.');
    }

    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.AnchorElement(href: url)
      ..target = '_blank'
      ..download = 'Ayesha_Asif_Resume.pdf';

    html.document.body?.append(anchor);
    anchor.click();
    anchor.remove();

    // Revoke on the next microtask instead of immediately — revoking the
    // object URL synchronously can race the download start in some browsers
    // (notably Firefox), which is what produced the corrupted 0‑byte PDFs.
    Future.delayed(const Duration(seconds: 5), () {
      html.Url.revokeObjectUrl(url);
    });

    return true;
  } catch (e) {
    // Fallback: open the asset the same way the browser would resolve any
    // other Flutter web asset — via the generated `assets/` manifest path —
    // so at minimum the resume opens in a new tab for the user to save
    // manually with Ctrl/Cmd+S.
    try {
      final base = html.window.location.href.split('#').first;
      final assetsBase = base.endsWith('/') ? base : '$base/';
      html.window.open('${assetsBase}assets/$_resumeAssetKey', '_blank');
      return true;
    } catch (_) {
      return false;
    }
  }
}
