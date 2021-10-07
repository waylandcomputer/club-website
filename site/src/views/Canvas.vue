<template>
  <div id="canvas"></div>
</template>

<script>
import P5 from "p5"; // Package from npm

export default {
  name: "App",
  mounted() {
    const script = (p5) => {
      let particles = [];
      let buttons = [];
      let title = "";
      let a;
      let aDir = 0; //Change to add a bit of animation h
      let typeBar;
      let selectedButton = 1;
      let shiftPressed = false;
      let maxDist = 500;

      let r = 0;

      p5.setup = function () {
        p5.createCanvas(window.innerWidth, window.innerHeight);
        a = p5.width / 90;
        typeBar = {
          x: p5.width / 2 + p5.width / 100,
          y: p5.height / 2.5 - p5.width / 18,
        };
        for (let i = 0; i < 5; i++) {
          particles.push(
            new Particle(p5.random(0, p5.width), p5.random(0, p5.height))
          );
        }

        p5.windowResized = function () {
          p5.createCanvas(window.innerWidth, window.innerHeight);
          // canvas.position(0, 0);
        }

        

        buttons.push(
          new Button(
            (p5.width * 8.5) / 12,
            p5.height / 24,
            p5.width / 30,
            'c'
          ));
        for (let i = 0; i < 4; i++) {
          buttons.push(
            new Button(
              (p5.width * 8.5) / 12 + ((i+1) * p5.width) / 18,
              p5.height / 24,
              p5.width / 30,
              i
            )
          );
        }
      };

      p5.draw = function () {
        p5.background(17);
        particles.forEach((particle) => {
          particle.show();
          particle.update();
        });
        p5.rectMode(p5.CORNER);
        p5.noStroke();
        for (let i = -2; i < p5.height; i += 2) {
          p5.fill(17 + 100 - Math.abs(100 - 100 * (i / (p5.height / 2))), 100);
          p5.rect(0, i, p5.width, 2);
        }
        p5.fill(0);
        p5.textSize(20);
        // p5.text(Math.floor(p5.frameRate()), 100, 100);

        p5.textSize(p5.width / 6);
        p5.textFont("Monospace");
        p5.noStroke();
        p5.textAlign(p5.CENTER, p5.BASELINE);

        p5.push();
        p5.translate(0, -20 + p5.height/20 - p5.width/24);
        for (let i = 0; i < a; i++) {
          p5.fill(17 + (255 / a) * i, 17 + (145 / a) * i, 17 + (62 / a) * i);
          p5.text(
            title,
            p5.width / 2 + i - a / 2,
            p5.height / 2.5 + i - a / 2.5
          );
        }

        a += aDir;
        if (a < 10 || a > 20) {
          aDir *= -1;
        }

        typing();
        p5.pop();

        if(shiftPressed) {
          buttons.forEach((button) => {
            button.update();
            button.show();
          });
        }
      };

      let typingIndex = 0;
      let finalTitle = "wayland\ncs club";
      function typing() {
        p5.rectMode(p5.CENTER);
        p5.fill(255, 155, 72);
        if (typingIndex < finalTitle.length && p5.frameCount % 10 == 0) {
          title += finalTitle.charAt(typingIndex);
          typingIndex++;
          p5.fill(255, 155, 72);
          if (typingIndex == 7 || typingIndex == 8) {
            typeBar.x = p5.width / 2 + p5.width / 100;
            typeBar.y = p5.height / 2.5 + p5.width / 6.5;
          } else {
            typeBar.x += p5.width / 20;
          }
        }
        if (typingIndex == finalTitle.length) {
          if (p5.frameCount % 60 < 30) {
            p5.noFill();
          }
        }

        p5.rect(typeBar.x, typeBar.y, p5.width / 180, p5.width / 6);
      }

      p5.keyPressed = function () {
        if(p5.keyCode == p5.SHIFT) {
          shiftPressed = true;
        }
      };

      p5.keyReleased = function () {
        if(p5.keyCode == p5.SHIFT) {
          shiftPressed = false;
          buttons.forEach(button => {
            button.touchingMouse = false;
          });
        }
      };

      p5.mouseClicked = function () {
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

        let flag = true;
        buttons.forEach((button) => {
          if (button.touchingMouse) {
            flag = false;
          }
        });
        if (flag) {
          //Only add particle if buttons aren't being iteracted with
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
          p5.noStroke();
          p5.ellipse(this.position.x, this.position.y, this.size, this.size);

          p5.stroke(255, 193, 79);
          p5.strokeWeight(this.size / 4);

          if (selectedButton >= 1) {
            let nearest = particles[0];

            if (this.dist(this.position, nearest.position) == 0) {
              nearest = particles[1];
            }
            for (let i = 1; i < particles.length; i++) {
              if (
                this.dist(this.position, particles[i].position) != 0 &&
                this.dist(this.position, particles[i].position) <
                  this.dist(this.position, nearest.position)
              ) {
                nearest = particles[i];
              }
              if(this.dist(this.position, nearest.position) < maxDist) {
                p5.line(
                  this.position.x + p5.random(r),
                  this.position.y + p5.random(r),
                  nearest.position.x - nearest.velocity.x + p5.random(r),
                  nearest.position.y - nearest.velocity.y + p5.random(r)
                );
              }
            }
            if (selectedButton >= 2) {
              let secondNearest = particles[1];

              for (let i = 0; i < particles.length; i++) {
                if (
                  this.dist(this.position, particles[i].position) != 0 &&
                  this.dist(this.position, particles[i].position) >
                    this.dist(this.position, nearest.position) &&
                  this.dist(this.position, particles[i].position) <
                    this.dist(this.position, secondNearest.position)
                ) {
                  secondNearest = particles[i];
                }
              }

              p5.stroke(255, 193, 79);
              p5.strokeWeight(this.size / 8);
              if(this.dist(this.position, secondNearest.position) < maxDist) {
                p5.line(
                  this.position.x + p5.random(r),
                  this.position.y + p5.random(r),
                  secondNearest.position.x -
                    secondNearest.velocity.x +
                    p5.random(r),
                  secondNearest.position.y -
                    secondNearest.velocity.y +
                    p5.random(r)
                );
              }
              if (selectedButton >= 3) {
                let thirdNearest = particles[2];

                for (let i = 0; i < particles.length; i++) {
                  if (
                    this.dist(this.position, particles[i].position) != 0 &&
                    this.dist(this.position, particles[i].position) >
                      this.dist(this.position, nearest.position) &&
                    this.dist(this.position, particles[i].position) >
                      this.dist(this.position, secondNearest.position) &&
                    this.dist(this.position, particles[i].position) <
                      this.dist(this.position, thirdNearest.position)
                  ) {
                    thirdNearest = particles[i];
                  }
                }

                p5.stroke(255, 193, 79);
                p5.strokeWeight(this.size / 16);
                if(this.dist(this.position, thirdNearest.position) < maxDist) {
                  p5.line(
                    this.position.x + p5.random(r),
                    this.position.y + p5.random(r),
                    thirdNearest.position.x -
                      thirdNearest.velocity.x +
                      p5.random(r),
                    thirdNearest.position.y -
                      thirdNearest.velocity.y +
                      p5.random(r)
                  );
                }
              }
            }
          }

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
              -(this.position.x - p5.width / 2) / p5.width / 3,
              -(this.position.y - p5.height / 2) / p5.height / 3
            )
          );
          this.acceleration = this.acceleration.rotate(p5.random(0, 2 * p5.PI));
          this.velocity.add(this.acceleration);
          this.velocity.limit(10);
          // this.velocity.limit(2);
        };
      }

      function Button(x, y, size, n) {
        this.x = x;
        this.y = y;
        this.n = n;
        this.size = size;
        this.touchingMouse = false;

        this.show = function () {
          p5.stroke(230);
          p5.strokeWeight(size / 12);
          if (this.touchingMouse || selectedButton == n) {
            p5.fill(150);
          } else {
            p5.noFill();
          }
          p5.ellipse(x, y, this.size, this.size);
          p5.noStroke();
          p5.fill(255);
          p5.textAlign(p5.CENTER, p5.CENTER);
          p5.textSize(this.size / 2);
          p5.text(n, x, y);
        };

        this.update = function () {
          this.touchingMouse =
            p5.dist(this.x, this.y, p5.mouseX, p5.mouseY) < this.size / 2;
          if (this.touchingMouse && p5.mouseIsPressed) {
            if(n == 'c') {
              if(particles.length > 5) {
                particles = [];
                for (let i = 0; i < 5; i++) {
                  particles.push(
                    new Particle(p5.random(0, p5.width), p5.random(0, p5.height))
                  );
                }
              }
            } else {
              selectedButton = n;
            }
          }
        };
      }
    };
    // Attach the canvas to the div

    // eslint-disable-next-line no-unused-vars
    const p5canvas = new P5(script, "canvas");
  },
};
</script>
<style>
</style>
