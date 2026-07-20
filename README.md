[build]
command = "flutter build web --release"
publish = "build/web"

[[headers]]
for = "/service-worker.js"
[headers.values]
Cache-Control = "no-cache"

[[redirects]]
from = "/*"
to = "/index.html"
status = 200
