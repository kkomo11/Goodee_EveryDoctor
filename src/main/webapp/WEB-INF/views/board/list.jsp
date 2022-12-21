<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html class="no-js" lang="zxx">

    <head>
      <meta charset="utf-8" />
      <meta http-equiv="x-ua-compatible" content="ie=edge" />
      <title>EveryDoctor</title>
      <meta name="description" content="" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <c:import url="../temp/boot.jsp"></c:import>
      <!-- ========================= CSS here ========================= -->
    </head>

    <body>
      <!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

      <!-- Preloader -->
      <div class="preloader">
        <div class="preloader-inner">
          <div class="preloader-icon">
            <span></span>
            <span></span>
          </div>
        </div>
      </div>
      <!-- /End Preloader -->

      <!-- Start Breadcrumbs -->
      <div class="breadcrumbs">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="breadcrumbs-content">
                <h1 class="page-title">Frequently Asked Questions</h1>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
              <ul class="breadcrumb-nav">
                <li><a href="/">Home</a></li>
                <li>FAQ</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <!-- End Breadcrumbs -->

      <!-- Header -->
      <c:import url="../temp/header.jsp"></c:import>

      <!-- Start Faq Area -->
      <section class="faq section">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                      data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      <span>How do I place an ad?</span><i class="lni lni-plus"></i>
                    </button>
                  </h2>
                  <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam consectetur sit
                        amet ante nec vulputate. Nulla aliquam, justo auctor consequat tincidunt, arcu
                        erat mattis lorem, lacinia lacinia dui enim at eros. Pellentesque ut gravida
                        augue. Duis ac dictum tellus</p>
                      <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry
                        richardson ad squid. 3 wolf moon officia aute. non cupidatat skateboard dolor
                        brunch. Foosd truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                        sunt alqua put a bird on it squid single-origin coffee nulla assumenda
                        shoreditch et. Nihil anim ke ffiyeh helvetica, craft beer labore wes anderson
                        cred nesciunt sapiente ea proident.</p>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                      data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      <span>Who shouldi to contact if i Have any question?</span><i class="lni lni-plus"></i>
                    </button>
                  </h2>
                  <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry
                        richardson ad squid. 3 wolf moon officia aute. non cupidatat skateboard dolor
                        brunch. Foosd truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                        sunt alqua put a bird on it squid single-origin coffee nulla assumenda
                        shoreditch et. Nihil anim ke ffiyeh helvetica, craft beer labore wes anderson
                        cred nesciunt sapiente ea proident.</p>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam consectetur sit
                        amet ante nec vulputate. Nulla aliquam, justo auctor consequat tincidunt, arcu
                        erat mattis lorem, lacinia lacinia dui enim at eros. Pellentesque ut gravida
                        augue. Duis ac dictum tellus</p>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                      data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      <span>How can i cancel or change my order?</span><i class="lni lni-plus"></i>
                    </button>
                  </h2>
                  <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas expedita,
                        repellendus est nemo cum quibusdam optio, voluptate hic a tempora facere, nihil
                        non itaque alias similique quas quam odit consequatur.</p>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingFour">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                      data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                      <span>How can i Return A Product?</span><i class="lni lni-plus"></i>
                    </button>
                  </h2>
                  <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry
                        richardson ad squid. 3 wolf moon officia aute. non cupidatat skateboard dolor
                        brunch. Foosd truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                        sunt alqua put a bird on it squid single-origin coffee nulla assumenda
                        shoreditch et.</p>
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident iure ab nisi,
                        magnam vitae. Laboriosam laborum suscipit recusandae officia laudantium,
                        consectetur adipisci voluptates doloremque quisquam. Id rerum iusto
                        reprehenderit assumenda!</p>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingFive">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                      data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                      <span>How Long will it take to get my package?</span><i class="lni lni-plus"></i>
                    </button>
                  </h2>
                  <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry
                        richardson ad squid. 3 wolf moon officia aute. non cupidatat skateboard dolor
                        brunch. Foosd truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                        sunt alqua put a bird on it squid single-origin coffee nulla assumenda
                        shoreditch et. </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!--/ End Faq Area -->

      <!-- Start Newsletter Area -->
      <div class="newsletter section">
        <div class="container">
          <div class="inner-content">
            <div class="row align-items-center">
              <div class="col-lg-6 col-md-6 col-12">
                <div class="title">
                  <i class="lni lni-alarm"></i>
                  <h2>Newsletter</h2>
                  <p>We don't send spam so don't worry.</p>
                </div>
              </div>
              <div class="col-lg-6 col-md-6 col-12">
                <div class="form">
                  <form action="#" method="get" target="_blank" class="newsletter-form">
                    <input name="EMAIL" placeholder="Your email address" type="email">
                    <div class="button">
                      <button class="btn">Subscribe<span class="dir-part"></span></button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- End Newsletter Area -->

      <!-- Footer -->
      <c:import url="../temp/footer.jsp"></c:import>

      <!-- ========================= scroll-top ========================= -->
      <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
      </a>

      <!-- ========================= JS here ========================= -->
      <script src="/js/board/board.js"></script>
    </body>

    </html>