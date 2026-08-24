'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "47970f284e91ee5a4ad88ce617ea935f",
"assets/AssetManifest.bin.json": "b1c31bdf41e3c23aad25228bcc5a0429",
"assets/AssetManifest.json": "bdaad40a244a68cacb43c326cfe471cf",
"assets/FontManifest.json": "72f64804ce76b68c5f517435aea7d18d",
"assets/fonts/MaterialIcons-Regular.otf": "8eb29f6cb2af14e1be81150f44982213",
"assets/lib/assets/certificates/agent_skills.png": "a853a538761e0697d91ad3a6616b7e96",
"assets/lib/assets/certificates/ai_capabilities.png": "ed84e098ab72f2b01b019ed00af1cc63",
"assets/lib/assets/certificates/ai_fluency_builders.png": "733d7087e39dbcc46e80cc34a161a0a0",
"assets/lib/assets/certificates/ai_fluency_educators.png": "079a4d8841ba4b0eb5b93bfc88c58fdd",
"assets/lib/assets/certificates/ai_fluency_framework.png": "f913b19edd5f28e9984e320f8002c64d",
"assets/lib/assets/certificates/ai_fluency_nonprofits.png": "6607737cc2ecd82a79acd6446870bc66",
"assets/lib/assets/certificates/ai_fluency_smallbiz.png": "44ed3e287c965cc4ab1a52f8a66ff3d8",
"assets/lib/assets/certificates/ai_fluency_students.png": "164c8615ac8f5c7406abdef5bbfab692",
"assets/lib/assets/certificates/alison_ai.jpg": "c7aa0e0e2706684ff1c2392ab5c5f25d",
"assets/lib/assets/certificates/claude_101.png": "6e581281bfa72e8cc24da58b3c42efe4",
"assets/lib/assets/certificates/claude_api.png": "f74be87a94404f596f3a6662ccf048a4",
"assets/lib/assets/certificates/claude_code_101.png": "b1cfbbee452490c238ae5522ada2b8c2",
"assets/lib/assets/certificates/claude_code_action.png": "90c31733e4e6f7d825f1698cc549a976",
"assets/lib/assets/certificates/claude_cowork.png": "3b578ce8a863fa079dbce23335f1f427",
"assets/lib/assets/certificates/claude_platform_101.png": "6bfd7432c6a81977a4f60068cf5b227a",
"assets/lib/assets/certificates/subagents.png": "f6455ff3e6383c3a6849a5160283a6e7",
"assets/lib/assets/images/avatar.png": "34c389c9466e67eded179690c0623ecd",
"assets/lib/assets/images/avatar_cropped.png": "a8cd4bc3c1b48a09bd0b960ece8e5015",
"assets/lib/assets/images/breast_cancer.png": "435019506223c39cb1289d2cc93ffc03",
"assets/lib/assets/images/coffee_shop.png": "38c39903df859fa4f6d36858c26ae4f4",
"assets/lib/assets/images/connect_workspace.png": "2db31601519d776e28a4b71cee646932",
"assets/lib/assets/images/contact_avatar.png": "519d9788d302fae9ad22d2c7eb6cb7fa",
"assets/lib/assets/images/github.png": "8703cb74608633aeebc585bb2bf4b391",
"assets/lib/assets/images/github1.png": "2f1f8e8ca7e74c44aa6cbb1e71ed62c2",
"assets/lib/assets/images/heart_disease.png": "8799e1741ff06e77a237fcf4f64b26e9",
"assets/lib/assets/images/hero_avatar.png": "519d9788d302fae9ad22d2c7eb6cb7fa",
"assets/lib/assets/images/hero_workspace.png": "42c8142e77451dc4ab82387dfed1d029",
"assets/lib/assets/images/img.png": "3cde7474934c26cdd2c81d697a5ce598",
"assets/lib/assets/images/img_1.png": "9f2ce3b33ed82b9cc319e89e8cc3aa4b",
"assets/lib/assets/images/img_2.png": "4a665839c20592d6a197ff649e32c6be",
"assets/lib/assets/images/img_3.png": "013faafeb68c5fa30c40eb7c113093f1",
"assets/lib/assets/images/img_4.png": "3e60e6ef20f8e50fc043c270987a5844",
"assets/lib/assets/images/img_5.png": "8cc9741b282d75c262fe170543486618",
"assets/lib/assets/images/img_6.png": "1ffcf73fe7c3452b874150752c801ef4",
"assets/lib/assets/images/img_7.png": "7540f271bcfcd7a5e9413a45d5806886",
"assets/lib/assets/images/img_8.png": "316d07c644cc1a938584bcb473275272",
"assets/lib/assets/images/img_9.png": "db9453791ae114c4ac6c69cf523acdf7",
"assets/lib/assets/images/instagram.png": "ac06040a22abb53d8efb72a523f90d60",
"assets/lib/assets/images/instagram1.png": "43e9fec0f717167ba84f6bec22101b60",
"assets/lib/assets/images/legal_lens.png": "96d1194d7bc05e39082607a2d3777e08",
"assets/lib/assets/images/linkedin.png": "d0a82910c8e92428449768b66e3e44a9",
"assets/lib/assets/images/linkedin1.png": "2bf87ce0ba8961b46cb56341f42c2bc4",
"assets/lib/assets/images/logo.png": "dd5cd49df64ef53c31a5ada9b6860d93",
"assets/lib/assets/images/logo_mark.png": "b0670e5073aac068a2f86f804250ccba",
"assets/lib/assets/images/pet_app.png": "8f9613c951f4252d6382c2ab2d89368e",
"assets/lib/assets/images/phishshield.png": "d6f656ba867008ca1408847f8f19983d",
"assets/lib/assets/images/profile.jpeg": "454405c3afdd74cb8018ee846ae07c6d",
"assets/lib/assets/images/profile.png": "d301d2484b7380a68164e8b48dd32b8d",
"assets/lib/assets/images/shaheen_mobile_store.png": "3e2e2a594405e3963056e9b6268c5999",
"assets/lib/assets/images/student_marks.png": "51d780828fabe165a346b9a5faf8a4f3",
"assets/lib/assets/resume/Ayesha_Asif_Resume.pdf": "61442b6b15f2123c6843e925b5779d42",
"assets/NOTICES": "443e72fe7f21ea243ef9c2f048977820",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/simple_icons/fonts/SimpleIcons.ttf": "a3af96b4d79dffa20f5ef82d8e60eeae",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "2f6db20eb5ef436893012c3f359f7384",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "de0eec99b1d201e9eaba845f5374794e",
"/": "de0eec99b1d201e9eaba845f5374794e",
"main.dart.js": "fe1338fd473ad588433d0a67a25ec896",
"manifest.json": "5150a1c8524d268183ac08d00a64e3be",
"version.json": "5cc9695ee3e8c1f86234c524152ea8f8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
