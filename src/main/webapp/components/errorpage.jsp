<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Page Not Found</title>

    <link
      href="https://fonts.googleapis.com/css?family=Montserrat:400,700,900"
      rel="stylesheet"
    />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/error.css" />
      <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/universal.css" />
  </head>

  <body>
    <div id="notfound">
      <div class="notfound">
        <div class="notfound-404">
          <h1>Oops!</h1>
        </div>
        <h2>404 - Page not found</h2>
        <p>
          The page you are looking for might have been removed had its name
          changed or is temporarily unavailable.
        </p>
        <a href="<%= request.getContextPath() %>/index.jsp">Go To Homepage</a>
      </div>
    </div>
  </body>
  
</html>
