'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"index.html": "097ee4ad1bcd3bb9728878f04e3461c2",
"/": "097ee4ad1bcd3bb9728878f04e3461c2",
"assets/NOTICES": "2b27879f7f4e7da95049908333feea3b",
"assets/assets/profile.json": "1e7772833dcb4ad18fe1fe1a5c899f32",
"assets/assets/images/ic_telegram.png": "4305c302184d07fbbb4be6bcdf9fa9b8",
"assets/assets/images/ic_linkedin.png": "569c98628421a4447a858adf9443d9df",
"assets/assets/images/ic_night.png": "de4308c45d621ac4c7f43d1bf92bbaea",
"assets/assets/images/ic_email.png": "431dd050e83af265cf93bf44eea22187",
"assets/assets/images/ic_sun.png": "560689d633e833d8ef7c73e72fa048a1",
"assets/assets/images/ic_link.png": "5e853f8193a8e18c79e93d1138c57b33",
"assets/assets/images/profile_photo.png": "f69f51af9074ef2daf3e8c563bff3ea2",
"assets/assets/images/ic_instagram.png": "7e18f87c649e8f72d18d588c3800a3fe",
"assets/assets/images/ic_share.png": "19fa8c4da5546663f0964621b10b6a81",
"assets/assets/images/personal_website_image.png": "9b4b898b4f42ece29c91e48884339084",
"assets/assets/images/ic_github.png": "0ed75617d69b1636a73afc721fe56552",
"assets/assets/svg/ic_external_link.svg": "617dd64549517d772c1e243ed1ce344e",
"assets/assets/svg/ic-linkedin.svg": "612e1e2f0a2a1d5f2cfa421c940cd5be",
"assets/assets/svg/ic-medium.svg": "b0f3f37255eb75bfaf1df070a95f736d",
"assets/assets/svg/ic-github.svg": "dcb4fc4eba1812af3fbec409aa1ae500",
"assets/assets/svg/ic-telegram.svg": "35a26e82966306386f8d3dd3321241f1",
"assets/assets/svg/ic-instagram.svg": "eca6ed9baf3bd02a3148bf9673d10d6f",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "18d4e46fa3b45b600e4d51901abf4644",
"assets/fonts/MaterialIcons-Regular.otf": "0b1ccca8a3cea9f17f8751cbaa59cc06",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "492a1c5333135f15fe4187de4cf64981",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.json": "4ec86cf2cfb2bca460a8d7829a20d58e",
"version.json": "03acefc4795e8573b194262cd3a4419f",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.ico": "a4b8b195310e1af3c4ffa9efaf8ed2dc",
"main.dart.js": "9b2ea94ea36e8ddb465e4c8daf98c21a",
"icons/apple-icon-180x180.png": "53bc78e92c58aa3c2fa4952e21f6841f",
"icons/android-chrome-512x512.png": "55857e9d815837e000ba4e30530a2d8e",
"icons/favicon-32x32.png": "b63686be771ee0cc32349d98ffdf53a4",
"icons/favicon-16x16.png": "9a468560c73e8c1b8b9d4bb15968b3dc",
"icons/android-chrome-192x192.png": "3571533b45ce784305755bc7436cd268",
"manifest.json": "30f76aa6df71a42a4f8f8319e828f5d6",
"resume.pdf": "bf5b2bfb196a12444595c3ac7a0b9b07",
"flutter_bootstrap.js": "77d5224647ca07103868780cff574255"};
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
