<template>
<div>
    <body>
<flickity class="hero-slider" ref="flickity" :options="flickityOptions">

	<div class="carousel-cell" style="background-image: url(http://s1.picswalls.com/wallpapers/2017/12/11/hd-nature-wallpaper_123026234_313.jpg);">
		<div class="overlay"></div>
		<div class="inner">
			<h2 class="title">Reboothacks</h2>
            <h3 class="subtitle">Last year the CS Club designed their own website to advertise for their annual hackathon. 
                More than 100 people signed up and there were many amazing submissions. 
                Winners were given amazing prizes and all participants received free stuff!
                For more information check out the link below:
            </h3>
			<div class="empty"></div>
            <a href="https://www.reboothacks.com/" class="btn" target="empty">Check out the website</a>
		</div>
	</div>

	<div class="carousel-cell" style="background-image: url(https://www.pixelstalk.net/wp-content/uploads/2016/06/Best-HD-Backgrounds-Photos-Download.jpg);">
		<div class="overlay"></div>
		<div class="inner">
			<h3 class="subtitle">Slide 2</h3>
			<h2 class="title">Flickity parallax</h2>
			<a href="#" class="btn">Tell me more</a>
		</div>
	</div>

	<div class="carousel-cell" style="background-image: url(http://s1.picswalls.com/wallpapers/2016/06/10/4k-desktop-background_065226855_309.jpg);">
		<div class="overlay"></div>
		<div class="inner">
			<h3 class="subtitle">Slide 3</h3>
			<h2 class="title">Flickity parallax</h2>
			<a href="#" class="btn">Tell me more</a>
		</div>
	</div>
</flickity>
</body>
</div>
</template>

<script>
import Flickity from 'vue-flickity';
 
export default {
name: "Projects",
  components: {
    Flickity
  },
  
  data() {
    return {
      flickityOptions: {
        initialIndex: 0,
        prevNextButtons: true,
        pageDots: false,
        wrapAround: false
        
      }
    }
  },
  
  methods: {
    next() {
      this.$refs.flickity.next();
    },
    
    previous() {
      this.$refs.flickity.previous();
    }
  }
};
</script>

<style scoped>
body {
    background-color: #000;
    margin: 0;
}
.overlay {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background: linear-gradient(to bottom, rgba(14, 29, 51, 0.8), rgba(14, 29, 51, 0.2));
}
.hero-slider {
    width: 100%;
    height: 100vh;
    overflow: hidden;
}
.hero-slider .carousel-cell {
    width: 100%;
    height: 100%;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
}
.hero-slider .carousel-cell .inner {
    position: relative;
    top: 50%;
    transform: translateY(-50%);
    color: white;
    text-align: center;
}
.hero-slider .carousel-cell .inner .subtitle {
    font-family: 'Roboto Slab', serif;
    font-size: 2.2rem;
    line-height: 1.2em;
    font-weight: 200;
    font-style: italic;
    letter-spacing: 3px;
    color: rgba(255, 255, 255, 0.5);
    margin-bottom: 5px;
}
.hero-slider .carousel-cell .inner .title {
    font-family: 'Montserrat', sans-serif;
    font-size: 3rem;
    line-height: 1.2em;
    text-transform: uppercase;
    letter-spacing: 3px;
    margin-bottom: 40px;
}
.hero-slider .carousel-cell .inner .btn {
    border: 1px solid #fff;
    padding: 14px 18px;
    text-transform: uppercase;
    font-family: 'Montserrat', sans-serif;
    font-size: 0.8rem;
    letter-spacing: 3px;
    color: #fff;
    text-decoration: none;
    transition: all 0.2s ease;
}
.hero-slider .carousel-cell .inner .btn:hover {
    background: #fff;
    color: #000;
}
.hero-slider .flickity-prev-next-button {
    width: 80px;
    height: 80px;
    background: transparent;
}
.hero-slider .flickity-prev-next-button:hover {
    background: transparent;
}
.hero-slider .flickity-prev-next-button .arrow {
    fill: white;
}
.hero-slider .flickity-page-dots {
    bottom: 30px;
}
.hero-slider .flickity-page-dots .dot {
    width: 30px;
    height: 4px;
    opacity: 1;
    background: rgba(255, 255, 255, 0.5);
    border: 0 solid white;
    border-radius: 0;
}
.hero-slider .flickity-page-dots .dot.is-selected {
    background: #f00;
    border: 0 solid #f00;
}
.empty {
    padding-bottom: 100px;
}
</style>
