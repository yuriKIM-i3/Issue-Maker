<%@ include file="/WEB-INF/jsp/commonization/jstl.jsp" %>
<!doctype html>
<html>
  <%@ include file="/WEB-INF/jsp/commonization/html_head.jsp" %>
  <body class="wrap">
    <header> 
      <nav class="navbar header">
        <a class="navbar-brand font_C_white" href="/index">Issue Maker</a>            
        <ul class="nav justify-content-end">
            <li class="nav-item">
              <a class="btn btn-secondary d-lg-inline-block mb-3 mb-md-0 ml-md-3" href="/signUp">Sign Up</a>                  
            </li>
            <li class="nav-item">                  
              <a class="btn btn-secondary d-lg-inline-block mb-3 mb-md-0 ml-md-3" href="/login">Sign In</a>  
            </li>
        </ul>           
      </nav>
    </header>
    <div class="jumbotron">
      <h1 class="display-4">Hello, Issue Maker!</h1>
        <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
      <hr class="my-4">
        <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
        <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>        
    </div>  
    <%@ include file="/WEB-INF/jsp/commonization/html_footer.jsp" %>
  </body>
</html>