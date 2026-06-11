<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{PROJECT_NAME}} | About</title>
  <link rel="stylesheet" href="assets/css/main.css">
</head>
<body>
  <header class="site-header">
    <nav class="navbar navbar-expand-lg" aria-label="Primary navigation">
      <div class="container">
        <a class="navbar-brand" href="index.html">{{PROJECT_NAME}}</a>
        <button class="navbar-toggler" type="button" data-menu-toggle aria-controls="primary-navigation" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="site-header__menu" id="primary-navigation" data-menu>
          <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
            <li class="nav-item"><a class="nav-link active" href="about.html" aria-current="page">About</a></li>
            <li class="nav-item"><a class="nav-link" href="services.html">Services</a></li>
            <li class="nav-item"><a class="nav-link" href="works.html">Works</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
          </ul>
        </div>
      </div>
    </nav>
  </header>

  <main>
    <section class="page-intro section">
      <div class="container">
        <p class="section-eyebrow">About</p>
        <h1>Describe the purpose and point of view.</h1>
        <p>Use this page to validate editorial rhythm, image placement, and supporting content blocks before integration.</p>
      </div>
    </section>

    <section class="section section--split">
      <div class="container">
        <div class="row g-5 align-items-center">
          <div class="col-lg-6">
            <h2>A flexible story section.</h2>
            <p>Keep copy generic while testing the final spacing and hierarchy. This content can later become CMS-managed fields or template partials.</p>
          </div>
          <div class="col-lg-6">
            <div class="media-placeholder" aria-label="Image placeholder"></div>
          </div>
        </div>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">
      <p>&copy; <span data-current-year></span> {{PROJECT_NAME}}. Static mockup.</p>
    </div>
  </footer>

  <script src="assets/js/main.js"></script>
</body>
</html>
