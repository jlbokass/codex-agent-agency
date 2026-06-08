<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{PROJECT_NAME}} | Services</title>
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
            <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
            <li class="nav-item"><a class="nav-link active" href="services.html" aria-current="page">Services</a></li>
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
        <p class="section-eyebrow">Services</p>
        <h1>Test offer cards and comparison layouts.</h1>
      </div>
    </section>

    <section class="section">
      <div class="container">
        <div class="row g-4">
          <article class="col-md-4">
            <div class="service-card">
              <h2>Service area</h2>
              <p>Short, scannable copy for validating card density and call-to-action placement.</p>
              <a href="contact.html">Start a conversation</a>
            </div>
          </article>
          <article class="col-md-4">
            <div class="service-card">
              <h2>Specialized support</h2>
              <p>Use repeated components to test rhythm without committing to final business content.</p>
              <a href="contact.html">Ask a question</a>
            </div>
          </article>
          <article class="col-md-4">
            <div class="service-card">
              <h2>Ongoing work</h2>
              <p>Keep structure portable for later conversion into backend-managed entries.</p>
              <a href="works.html">See examples</a>
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
