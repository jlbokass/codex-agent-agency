{
  "name": "{{PROJECT_SLUG}}",
  "version": "0.1.0",
  "private": true,
  "description": "Static Bootstrap and Sass mockup for {{PROJECT_NAME}}.",
  "author": "{{AUTHOR_NAME}}",
  "scripts": {
    "dev": "concurrently \"npm run watch:scss\" \"npm run serve\"",
    "serve": "browser-sync start --server . --startPath public/index.html --files \"public/**/*.html, assets/css/**/*.css, assets/js/**/*.js\" --no-open",
    "watch:scss": "sass --quiet-deps --load-path=node_modules --watch src/scss/main.scss:assets/css/main.css --style=expanded --source-map",
    "build": "sass --quiet-deps --load-path=node_modules src/scss/main.scss:assets/css/main.css --style=compressed --no-source-map"
  },
  "dependencies": {
    "bootstrap": "^5.3.3"
  },
  "devDependencies": {
    "browser-sync": "^3.0.2",
    "concurrently": "^8.2.2",
    "sass": "^1.77.8"
  }
}
