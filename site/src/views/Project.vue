<template>
  <div>
    <body>
      <flickity class="hero-slider" ref="flickity" :options="flickityOptions">
        <div class="carousel-cell" id="slide-1">
          <div class="overlay"></div>
          <div class="inner">
            <h2 class="title">Reboothacks</h2>
            <h3 class="date">cs club<br />--- 2021 ---</h3>
            <h3 class="subtitle">
              Our hackathon oranization, established in 2021. Our team not only
              organizes hackathons, but is actively building the next generation
              of high school tech events in New England and beyond.
            </h3>
            <div class="empty"></div>
            <a href="https://www.reboothacks.com/" class="btn" target="empty"
              >reboothacks.com</a
            >
          </div>
        </div>

        <div class="carousel-cell" id="slide-2">
          <div class="overlay"></div>
          <div class="inner">
            <h2 class="title">pico<span class="ctf">CTF</span></h2>
            <h3 class="date">cs club<br />--- Spring 2021 ---</h3>

            <h3 class="subtitle">
              Members from our team actively compete in CMU's yearly
              cybersecurity competition. In the spring of 2021, one of our teams
              ("Wayland Juniors") finished 49th in the country amoung 2280 high
              school teams.
            </h3>
            <div class="empty"></div>

          </div>
            <a href="https://play.picoctf.org/events/34/scoreboards#35" class="btn" target="empty">Spring 2021 Scoreboard</a>
        </div>

        <div class="carousel-cell" id="slide-3">
          <div class="overlay"></div>
          <div class="inner">
            <h2 class="title">USACO</h2>
            <h3 class="date">cs club<br />--- Winter 2021 ---</h3>

            <h3 class="subtitle">
              Members in our club compete in the USA Computing Olympiad every
              year.
            </h3>
            <div class="empty"></div>
            <a href="http://www.usaco.org/" class="btn" target="empty"
              >usaco.org</a
            >
          </div>
        </div>
      </flickity>
    </body>
  </div>
</template>

<script>
import Flickity from "vue-flickity";

export default {
  name: "Projects",
  components: {
    Flickity,
  },

  data() {
    return {
      flickityOptions: {
        initialIndex: 0,
        prevNextButtons: true,
        pageDots: false,
        autoPlay: true,
        freeScroll: false,
        wrapAround: true,
        arrowShape: "M 0,50 L 60,00 L 50,30 L 80,30 L 80,70 L 50,70 L 60,100 Z",
      },
    };
  },

  methods: {
    next() {
      this.$refs.flickity.next();
    },

    previous() {
      this.$refs.flickity.previous();
    },
  },
};
</script>

<style scoped>
@font-face {
  font-family: Aldrich;
  src: url("../assets/Aldrich-Regular.ttf");
  font-style: normal;
  font-weight: 100;
}

@font-face {
  font-family: Open;
  src: url("../assets/OpenSans-Regular.ttf");
  font-style: normal;
  font-weight: 100;
}

.ctf {
  color: #bf9bc8;
}

.date {
  font-family: monospace;
  margin-bottom: 40px;
  font-size: 20px;
  color: #111;
  text-transform: lowercase;
}

body {
  background-color: #000;
  margin: 0;
}

.btn {
  border-radius: 25px;
}

.overlay {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0px;
  bottom: 0;
  left: 0;
  right: 0;
  background: linear-gradient(to bottom, #ff914d, #111);
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
  font-size: 1rem;
  font-family: monospace;
  line-height: 1.2em;
  font-weight: 200;
  /*font-style: italic;*/
  letter-spacing: 3px;
  color: #75e645;
  margin-bottom: 5px;
  width: 550px;
  margin: 0 auto;
  background-color: #111;
  padding: 20px;
  border: 2px dashed #75e645;
  border-radius: 25px;
  text-transform: lowercase;
}
.hero-slider .carousel-cell .inner .title {
  font-size: 8em;
  line-height: 1.2em;
  text-transform: uppercase;
  letter-spacing: 3px;
  margin-bottom: 20px;
}
.hero-slider .carousel-cell .inner .btn {
  border: 5px solid #111;
  padding: 14px 18px;
  text-transform: lowercase;
  font-size: 0.8rem;
  letter-spacing: 3px;
  color: #fff;
  text-decoration: none;
  transition: all 0.2s ease;
}
.hero-slider .carousel-cell .inner .btn:hover {
  background: #000;
  color: #ffbc57;
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
  padding-bottom: 50px;
}
#slide-1 {
  background-image: url("https://images.unsplash.com/photo-1515879218367-8466d910aaa4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGNvZGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80");
  background-size: cover;
}
#slide-1 .title {
  color: #75e645;
  font-family: Aldrich;
  font-size: 7rem;
  margin-top: 45px;
}
#slide-1 .btn {
  color: black;
  background: #75e645;
}
#slide-1 .btn:hover {
  background: #000;
  color: #75e645;
  border-color: #75e645;
}
.image {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
  margin-top: 50px;
  max-width: 200px;
}

#slide-1 .date {
  background: #111;
  color: #75e645;
}

#slide-2 {
  background-image: url("https://www.securitymagazine.com/ext/resources/cyber-1.jpg?1592517088");
  background-size: cover;
}
#slide-2 .title {
  color: #bf1031;
  font-family: Open;
  text-transform: none;
  margin-top: 35.5px;
  /*margin-bottom: 30px;*/
}
#slide-2 .btn {
  color: #c41230;
  background: #bf9bc8;
  border-color: #c41230;
}
#slide-2 .btn:hover {
  color: #bf9bc8;
  background: #c41230;
  border-color: #bf9bc8;
}

#slide-2 .subtitle {
  border: 2px dashed #bf1031;
  background: #bf9bc8;
  color: #bf1031;
}

#slide-2 .date {
  background: #bf9bc8;
  color: #bf1031;
}

#slide-3 {
  background-image: url("https://today.duke.edu/sites/default/files/styles/story_hero/public/coding_HERO.jpg?itok=F8YWeHdH");
  background-size: cover;
}
#slide-3 .title {
  color: #075296;
  font-family: Arial;
  text-transform: none;
  margin-bottom: 10px;
  margin-top: 12px;
}
#slide-3 .btn {
  color: white;
  background: #4477ff;
  border-color: white;
}
#slide-3 .btn:hover {
  color: #4477ff;
  background: white;
  border-color: #4477ff;
}

#slide-3 .subtitle {
  border: 2px dashed #4477ff;
  background: white;
  color: #4477ff;
}

#slide-3 .date {
  background: #4477ff;
  color: white;
}

@media (max-width: 1050px) {
  .hero-slider .carousel-cell .inner .title,
  #slide-1 .title {
    font-size: 100px;
  }
}

@media (max-width: 850px) {
  .hero-slider .carousel-cell .inner .title,
  #slide-1 .title {
    font-size: 75px;
  }
}

@media (max-width: 650px) {
  .hero-slider .carousel-cell .inner .title,
  #slide-1 .title {
    font-size: 50px;
  }

  .hero-slider .carousel-cell .inner .subtitle {
    width: 250px;
  }
}

@media (max-width: 450px) {
  .hero-slider .carousel-cell .inner .title,
  #slide-1 .title {
    font-size: 35px;
    /*margin-bottom: 20px;*/
  }
}
</style>
