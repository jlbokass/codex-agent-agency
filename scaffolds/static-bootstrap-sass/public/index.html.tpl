<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{PROJECT_NAME}} | Home</title>
  <link rel="stylesheet" href="../assets/css/main.css">
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
            <li class="nav-item"><a class="nav-link active" href="index.html" aria-current="page">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
            <li class="nav-item"><a class="nav-link" href="services.html">Services</a></li>
            <li class="nav-item"><a class="nav-link" href="works.html">Works</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
          </ul>
        </div>
      </div>
    </nav>
  </header>

  <main>
    <section class="hero section">
      <div class="container">
        <div class="hero__content">
          <p class="section-eyebrow">Static mockup</p>
          <h1>Validate the interface before integration.</h1>
          <p class="hero__lead">Use this page to test hierarchy, spacing, components, and responsive behavior with neutral placeholder content.</p>
          <a class="btn btn-primary" href="services.html">Explore sections</a>
        </div>
      </div>
    </section>

    <section class="section">
      <div class="container">
        <div class="section-heading">
          <p class="section-eyebrow">Components</p>
          <h2>Reusable blocks for early design review.</h2>
        </div>
        <div class="row g-4">
          <article class="col-md-4">
            <div class="feature-card">
              <h3>Content block</h3>
              <p>Placeholder copy keeps the structure realistic without becoming client-specific.</p>
            </div>
          </article>
          <article class="col-md-4">
            <div class="feature-card">
              <h3>Responsive layout</h3>
              <p>Grid and section patterns can be checked before CMS templates exist.</p>
            </div>
          </article>
          <article class="col-md-4">
            <div class="feature-card">
              <h3>Interaction layer</h3>
              <p>Simple JavaScript remains unbundled and easy to port into another stack.</p>
            </div>
          </article>
        </div>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">
      <p>&copy; <span data-current-year></span> {{PROJECT_NAME}}. Static mockup.</p>
    </div>
  </footer>

  <script src="../assets/js/main.js"></script>
</body>
</html>
