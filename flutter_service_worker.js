'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"favicon.ico": "8a507900b0509efd2fb3d7c4d150dc4e",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"favicon.svg": "815687ed349abf845173160f46df2e26",
"assets/FontManifest.json": "7673897944b2809534ccbb195416952a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/profile.json": "a0e8f43aff1e04296663684306e11688",
"assets/assets/images/ic_night.png": "de4308c45d621ac4c7f43d1bf92bbaea",
"assets/assets/images/profile_photo.png": "f69f51af9074ef2daf3e8c563bff3ea2",
"assets/assets/images/personal_website_image.png": "9b4b898b4f42ece29c91e48884339084",
"assets/assets/images/ic_telegram.png": "4305c302184d07fbbb4be6bcdf9fa9b8",
"assets/assets/images/ic_share.png": "19fa8c4da5546663f0964621b10b6a81",
"assets/assets/images/ic_email.png": "431dd050e83af265cf93bf44eea22187",
"assets/assets/images/ic_link.png": "5e853f8193a8e18c79e93d1138c57b33",
"assets/assets/images/ic_linkedin.png": "569c98628421a4447a858adf9443d9df",
"assets/assets/images/ic_github.png": "0ed75617d69b1636a73afc721fe56552",
"assets/assets/images/ic_instagram.png": "7e18f87c649e8f72d18d588c3800a3fe",
"assets/assets/images/ic_sun.png": "560689d633e833d8ef7c73e72fa048a1",
"assets/assets/svg/ic_external_link.svg": "617dd64549517d772c1e243ed1ce344e",
"assets/assets/svg/ic-github.svg": "dcb4fc4eba1812af3fbec409aa1ae500",
"assets/assets/svg/ic-medium.svg": "b0f3f37255eb75bfaf1df070a95f736d",
"assets/assets/svg/ic-instagram.svg": "eca6ed9baf3bd02a3148bf9673d10d6f",
"assets/assets/svg/ic-telegram.svg": "35a26e82966306386f8d3dd3321241f1",
"assets/assets/svg/ic-linkedin.svg": "612e1e2f0a2a1d5f2cfa421c940cd5be",
"assets/assets/google_fonts/LICENSES.md": "fd33dd7b140075b18eca375b11935b24",
"assets/assets/google_fonts/Inter-Medium.ttf": "eb0312411b133c48049ac630ab7f1fec",
"assets/assets/google_fonts/JetBrainsMono-Medium.ttf": "4bbe069455d3664c677f3aed2ae52ea3",
"assets/assets/google_fonts/JetBrainsMono-Regular.ttf": "3d12b91dc3e06267b7eaead855a9276f",
"assets/assets/google_fonts/SpaceGrotesk-Medium.ttf": "4fb435f07dde99fcd0ed7c51392bdf59",
"assets/assets/google_fonts/Inter-Regular.ttf": "a32ace5dba8400232b84bc017dcc38ef",
"assets/assets/google_fonts/Inter-SemiBold.ttf": "84cf795ee940a39423fbee3dad4017c1",
"assets/AssetManifest.bin.json": "ce68949d702b6402128eb0c12dd0d097",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/AssetManifest.bin": "3f8d7d7c4e050cd0f9ff8ec9f81edc0c",
"assets/NOTICES": "3721e82c82db83fe8fcb07c89ddc5b6b",
"assets/AssetManifest.json": "f633a9d315b9a46c39a528f4c33efbdd",
"icons/android-chrome-512x512.png": "ce2dfa44d294717656a30b35dc20512a",
"icons/favicon-32x32.png": "345968e68d293db591063e4af2fbb714",
"icons/favicon-16x16.png": "07805f31225562c7139712ea93f396ef",
"icons/android-chrome-192x192.png": "3180a4c15625ff251966733abd000b37",
"icons/apple-icon-180x180.png": "ff7075ac0f08be80beea0010b9005ab4",
"flutter_bootstrap.js": "8b906518d91218fdb6a2cad2858b7acf",
"resume.pdf": "d66a7c7a44f2d45f89521a33b1d9c990",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"index.html": "d0e3dbd154369642383f85b4d5ef8b9e",
"/": "d0e3dbd154369642383f85b4d5ef8b9e",
"main.dart.js": "5acb8eaa123eafb565e17162ef62a32a",
"manifest.json": "a59ed6b88f996c3beb2b93285fe3c344",
"version.json": "03acefc4795e8573b194262cd3a4419f"};
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
