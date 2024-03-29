//========= testimonial 
tns({
  container: '.testimonial-slider',
  items: 3,
  slideBy: 'page',
  autoplay: false,
  mouseDrag: true,
  gutter: 0,
  nav: true,
  controls: false,
  controlsText: ['<i class="lni lni-arrow-left"></i>', '<i class="lni lni-arrow-right"></i>'],
  responsive: {
    0: {
      items: 1,
    },
    540: {
      items: 1,
    },
    768: {
      items: 2,
    },
    992: {
      items: 2,
    },
    1170: {
      items: 2,
    }
  }
});

//====== Clients Logo Slider
tns({
  container: '.client-logo-carousel',
  slideBy: 'page',
  autoplay: true,
  autoplayButtonOutput: false,
  mouseDrag: true,
  gutter: 15,
  nav: false,
  controls: false,
  responsive: {
    0: {
      items: 1,
    },
    540: {
      items: 3,
    },
    768: {
      items: 4,
    },
    992: {
      items: 4,
    },
    1170: {
      items: 6,
    }
  }
});

//========= glightbox
GLightbox({
  'href': 'https://www.youtube.com/watch?v=r44RKWyfcFw&fbclid=IwAR21beSJORalzmzokxDRcGfkZA1AtRTE__l5N4r09HcGS5Y6vOluyouM9EM',
  'type': 'video',
  'source': 'youtube', //vimeo, youtube or local
  'width': 900,
  'autoplayVideos': true,
});

//====== counter up 
var cu = new counterUp({
  start: 0,
  duration: 2000,
  intvalues: true,
  interval: 100,
  append: " ",
});
cu.start();