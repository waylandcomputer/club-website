<template>
  <div id="canvas"></div>
</template>

<script>
import P5 from "p5"; // Package from npm
import Inconsolata from "./fonts/Inconsolata.otf";

export default {
  name: "App",
  mounted() {
    const script = (p5) => {
      let myFont;
      let particles = [];
      let a = 10;
      let aDir = 0; //Change to add a bit of animation h

      p5.preload = function () {
        myFont = p5.loadFont(Inconsolata);
      };

      p5.setup = function () {
        p5.createCanvas(window.innerWidth, window.innerHeight);
        for (var i = 0; i < 5; i++) {
          particles.push(
            new Particle(p5.random(0, p5.width), p5.random(0, p5.height))
          );
        }
      };

      p5.draw = function () {
        p5.background(51);
        p5.fill(0);
        p5.textSize(20);
        p5.text(Math.floor(p5.frameRate()), 100, 100);
        particles.forEach((particle) => {
          particle.show();
          particle.update();
        });

        p5.textSize(p5.width / 6);
        p5.textFont("Monospace");
        p5.noStroke();
        p5.textAlign(p5.CENTER);
        for (var i = 0; i < a; i++) {
          p5.fill(17 + (255 / a) * i, 17 + (145 / a) * i, 17 + (62 / a) * i);
          p5.text(
            "CS CLUB",
            p5.width / 2 + i - a / 2,
            p5.height / 2 + i - a / 2
          );
        }

        a += aDir;
        if (a < 10 || a > 20) {
          aDir *= -1;
        }
      };

      p5.keyPressed = function () {};

      p5.mousePressed = function () {
        particles.forEach((particle) => {
          particle.velocity.add(
            p5
              .createVector(
                Math.pow(Math.floor(20 / (particle.position.x - p5.mouseX)), 3),
                Math.pow(Math.floor(20 / (particle.position.y - p5.mouseY)), 3)
              )
              .limit(20)
          );
        });

        if (particles.length < 50) {
          particles.push(new Particle(p5.mouseX, p5.mouseY));
        }
      };

      function Particle(x, y) {
        this.position = p5.createVector(x, y);
        this.velocity = p5.createVector(0, 0);
        this.acceleration = p5.createVector(1, 0);
        this.size = 20;
        this.show = function () {
          // p5.noStroke();
          // p5.fill(200, 140, 20);
          // p5.fill(255);
          // p5.ellipse(
          //   this.position.x + (this.position.x - p5.width / 2) / 400,
          //   this.position.y + (this.position.y - p5.height / 2) / 400,
          //   this.size * 1.1,
          //   this.size * 1.1
          // );
          p5.fill(255, 193, 79);
          p5.stroke(255, 193, 79);
          p5.strokeWeight(this.size / 4);
          let distFromMid = this.dist(
            this.position,
            p5.createVector(p5.width / 2, p5.height / 2)
          );
          p5.ellipse(this.position.x, this.position.y, this.size, this.size);

          let nearest = particles[0];
          if (this.dist(this.position, nearest.position) == 0) {
            nearest = particles[1];
          }
          for (var i = 1; i < particles.length; i++) {
            if (
              this.dist(this.position, particles[i].position) != 0 &&
              this.dist(this.position, particles[i].position) <
                this.dist(this.position, nearest.position)
            ) {
              nearest = particles[i];
            }
          }
          p5.line(
            this.position.x + p5.random(5),
            this.position.y + p5.random(5),
            nearest.position.x - nearest.velocity.x + p5.random(5),
            nearest.position.y - nearest.velocity.y + p5.random(5)
          );

          // let random = particles[Math.floor(p5.random(particles.length))];
          // p5.line(
          //   this.position.x + p5.random(5),
          //   this.position.y + p5.random(5),
          //   random.position.x,
          //   random.position.y
          // );
        };
        this.lerp = function (start, end, amt) {
          return (1 - amt) * start + amt * end;
        };

        this.dist = function (a, b) {
          //Takes in vectors
          let c = a.x - b.x;
          let d = a.y - b.y;
          return Math.sqrt(c * c + d * d);
        };

        this.update = function () {
          this.position.add(this.velocity);
          this.velocity.add(
            p5.createVector(
              -(this.position.x - p5.width / 2) / p5.width / 2,
              -(this.position.y - p5.height / 2) / p5.height / 2
            )
          );
          this.acceleration = this.acceleration.rotate(p5.random(0, 2 * p5.PI));
          this.velocity.add(this.acceleration);
          this.velocity.limit(10);
          // this.velocity.limit(2);
        };
      }

      // function FallingText(char, x) {
      //   this.x = x;
      //   this.y = -10;
      //   this.yv = 0;
      //   this.char = char;
      //   this.bounces = 2;
      //   this.restitution = p5.random(0.3, 0.7);
      //   this.rotV = p5.random(-0.2, 0.2);
      //   this.rot = 0;

      //   this.show = function () {
      //     let ascii = char.charCodeAt(0);
      //     let c = p5.map(ascii, 32, 126, 0, 255);
      //     p5.colorMode(p5.HSB);
      //     p5.fill(c, 255, 255);
      //     p5.noStroke();
      //     p5.textSize(50);
      //     p5.push();
      //     p5.translate(this.x, this.y);
      //     p5.rotate(this.rot);
      //     p5.textAlign(p5.CENTER, p5.CENTER);
      //     p5.text(this.char, 0, 0);
      //     p5.pop();
      //   };

      //   this.update = function () {
      //     this.y += this.yv;
      //     this.rot += this.rotV;
      //   };
      // }
    };
    // Attach the canvas to the div

    // eslint-disable-next-line no-unused-vars
    const p5canvas = new P5(script, "canvas");
  },
};
</script>
<style>
</style>
