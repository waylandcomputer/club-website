<template>
  <div id="canvas"></div>
</template>

<script>
import P5 from "p5"; // Package from npm

export default {
  name: "App",
  mounted() {
    const script = (p5) => {
      let texts = [];
      let gravity = 0.5;
      let x = 50;
      p5.setup = function () {
        p5.createCanvas(window.innerWidth, window.innerHeight);
      };

      p5.draw = function () {
        p5.colorMode(p5.RGB);
        p5.background(100);
        // canvap5.position(mouseX, mouseY);
        for (let i = 0; i < texts.length; i++) {
          const text = texts[i];
          text.show();
          text.update();
          if (text.y > p5.height) {
            if (text.bounces > 0) {
              text.yv *= -text.restitution;
              text.y += text.yv;
              text.rotV = p5.random(-0.2, 0.2);
              text.bounces--;
            } else {
              texts.splice(i, 1);
              i--;
            }
          }
        }
        if (x >= 50) {
          x -= (x - 50) / 100;
        }
        p5.noStroke();
        p5.fill(255);
        p5.triangle(x - 10, 0, x + 10, 0, x, 20);
      };

      p5.keyPressed = function () {
        if (p5.key.length == 1) {
          texts.push(new FallingText(p5.key, x));
          x += 50;
        }
      };

      function FallingText(char, x) {
        this.x = x;
        this.y = -10;
        this.yv = 0;
        this.char = char;
        this.bounces = 2;
        this.restitution = p5.random(0.3, 0.7);
        this.rotV = p5.random(-0.2, 0.2);
        this.rot = 0;

        this.show = function () {
          let ascii = char.charCodeAt(0);
          let c = p5.map(ascii, 32, 126, 0, 255);
          p5.colorMode(p5.HSB);
          p5.fill(c, 255, 255);
          p5.noStroke();
          p5.textSize(50);
          p5.push();
          p5.translate(this.x, this.y);
          p5.rotate(this.rot);
          p5.textAlign(p5.CENTER, p5.CENTER);
          p5.text(this.char, 0, 0);
          p5.pop();
        };

        this.update = function () {
          this.y += this.yv;
          this.yv += gravity;
          this.rot += this.rotV;
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
