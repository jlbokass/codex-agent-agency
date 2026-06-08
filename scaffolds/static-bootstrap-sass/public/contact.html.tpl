<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{PROJECT_NAME}} | Contact</title>
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
            <li class="nav-item"><a class="nav-link" href="services.html">Services</a></li>
            <li class="nav-item"><a class="nav-link" href="works.html">Works</a></li>
            <li class="nav-item"><a class="nav-link active" href="contact.html" aria-current="page">Contact</a></li>
          </ul>
        </div>
      </div>
    </nav>
  </header>

  <main>
    <section class="page-intro section">
      <div class="container">
        <p class="section-eyebrow">Contact</p>
        <h1>Validate form layout and supporting details.</h1>
      </div>
    </section>

    <section class="section">
      <div class="container">
        <form class="contact-form" action="#" method="post">
          <div class="row g-4">
            <div class="col-md-6">
              <label for="name">Name</label>
              <input class="form-control" type="text" id="name" name="name">
            </div>
            <div class="col-md-6">
              <label for="email">Email</label>
              <input class="form-control" type="email" id="email" name="email">
            </div>
            <div class="col-12">
              <label for="message">Message</label>
              <textarea class="form-control" id="message" name="message" rows="5"></textarea>
            </div>
            <div class="col-12">
              <button class="btn btn-primary" type="submit">Send message</button>
            </div>
          </div>
        </form>
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
