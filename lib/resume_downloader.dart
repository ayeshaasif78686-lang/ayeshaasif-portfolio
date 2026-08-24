// Picks the web implementation (real browser download) when compiled for
// the web, and falls back to a simple stub on other platforms.
export 'resume_downloader_stub.dart'
    if (dart.library.html) 'resume_downloader_web.dart';
