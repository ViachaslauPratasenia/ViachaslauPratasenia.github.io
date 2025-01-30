'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.ico": "a4b8b195310e1af3c4ffa9efaf8ed2dc",
"icons/favicon-32x32.png": "b63686be771ee0cc32349d98ffdf53a4",
"icons/apple-icon-180x180.png": "53bc78e92c58aa3c2fa4952e21f6841f",
"icons/android-chrome-512x512.png": "55857e9d815837e000ba4e30530a2d8e",
"icons/favicon-16x16.png": "9a468560c73e8c1b8b9d4bb15968b3dc",
"icons/android-chrome-192x192.png": "3571533b45ce784305755bc7436cd268",
"version.json": "03acefc4795e8573b194262cd3a4419f",
"manifest.json": "30f76aa6df71a42a4f8f8319e828f5d6",
"subz_terms_and_conditions.pdf": "f0cebd35bdd03b81abad6b09036fdb46",
"main.dart.js": "6d4bea1e0e85b0c48fa6552e1423a33d",
"resume.pdf": "c4f21f330bec01d9cd05b8d5962b3cdd",
"index.html": "6c482fe829297aab87163a2b2f56d88b",
"/": "6c482fe829297aab87163a2b2f56d88b",
"assets/AssetManifest.json": "4ec86cf2cfb2bca460a8d7829a20d58e",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/fonts/MaterialIcons-Regular.otf": "0b1ccca8a3cea9f17f8751cbaa59cc06",
"assets/AssetManifest.bin": "18d4e46fa3b45b600e4d51901abf4644",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "492a1c5333135f15fe4187de4cf64981",
"assets/NOTICES": "843885fa2d9d49ba15ef8ce8a127c4ac",
"assets/assets/images/ic_share.png": "19fa8c4da5546663f0964621b10b6a81",
"assets/assets/images/profile_photo.png": "f69f51af9074ef2daf3e8c563bff3ea2",
"assets/assets/images/ic_telegram.png": "4305c302184d07fbbb4be6bcdf9fa9b8",
"assets/assets/images/ic_sun.png": "560689d633e833d8ef7c73e72fa048a1",
"assets/assets/images/ic_link.png": "5e853f8193a8e18c79e93d1138c57b33",
"assets/assets/images/ic_github.png": "0ed75617d69b1636a73afc721fe56552",
"assets/assets/images/ic_night.png": "de4308c45d621ac4c7f43d1bf92bbaea",
"assets/assets/images/personal_website_image.png": "9b4b898b4f42ece29c91e48884339084",
"assets/assets/images/ic_instagram.png": "7e18f87c649e8f72d18d588c3800a3fe",
"assets/assets/images/ic_email.png": "431dd050e83af265cf93bf44eea22187",
"assets/assets/images/ic_linkedin.png": "569c98628421a4447a858adf9443d9df",
"assets/assets/profile.json": "1e7772833dcb4ad18fe1fe1a5c899f32",
"assets/assets/svg/ic-linkedin.svg": "612e1e2f0a2a1d5f2cfa421c940cd5be",
"assets/assets/svg/ic-telegram.svg": "35a26e82966306386f8d3dd3321241f1",
"assets/assets/svg/ic_external_link.svg": "617dd64549517d772c1e243ed1ce344e",
"assets/assets/svg/ic-instagram.svg": "eca6ed9baf3bd02a3148bf9673d10d6f",
"assets/assets/svg/ic-github.svg": "dcb4fc4eba1812af3fbec409aa1ae500",
"assets/assets/svg/ic-medium.svg": "b0f3f37255eb75bfaf1df070a95f736d",
"subz_privacy_policy.pdf": "d2127e9db8b24918007c9f95adf42180",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
