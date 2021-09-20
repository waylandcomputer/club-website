<template>
    <div class="about">
        <h1>about us</h1>
        <div class="night-vision-effect">
            <img class="team" src="../assets/club_pic.png" alt="Photo of Members"
        />

        </div>
        <figcaption>9.14.2021</figcaption>

        <h2>
          We equip student programmers to become creative problem-solvers with programming skills. In a rapidly, innovative tech world, programming is more useful than ever. CS Club gives students a space to collaborate, learn, and challenge themselves. 
        </h2>
        <div class="night-vision-effect2">
            <img class="team" src="../assets/image2.png" alt="Photo of Members"
        />
        </div>
        <figcaption>coding</figcaption>
        <h2>
          we meet twice a week. one in person meeting and one virtual meeting each week. we meet in person on tuesdays right after school in b144. we meet virtually every thursday at 8pm. the commitment is up to you, so don't be afraid to give it a shot if you are already in other clubs! 
        </h2>

        <div class="night-vision-effect1">
            <img class="team" src="../assets/image.png" alt="Photo of Members"
        />
        </div>
        <figcaption>6.14.2021</figcaption>

        <h2>
         The Wayland Computer Science club was originally started in 2018, but found little success. Come fall of 2020, with two of the three original members graduating and the former president leaving no continuity, the club was left to die. 
        </h2>

        <h2>
            But Andrew Boyer, the last remaining member of the CS club, had different plans. Recruiting Kevin Zhao and Eric Xie as his co-leaders, the trio set to rebrand the club as open and welcoming to all students interested in programming and computers, regardless of previous knowledge and experience. They set out to foster a community of students interested in building programming skills without the usual gate-keeper attitude prevalent in the cs field. 
        </h2>

    </div>
</template>

<script>
export default {
    name: "about",
};
</script>

<style scoped>

h1 {
    font-size: 100px;
    color: #FFBC57;
}

h2 {
    width: 75%;
    text-align: center;
    margin: 0 auto;
    font-weight: normal;
    font-family: monospace;
    text-transform: lowercase;
    margin-top: 25px;
}

figcaption {
    margin-top: 5px;
    /*margin-bottom: 25px;*/

}

.about {
    text-align: center;
    padding-top: 50px;
    padding-bottom: 50px;
}


.team {
    margin: 20px;
    width: 75%;
    border-radius: 25px;
}
.team1 {
    margin: 20px;
    width: 75%;
    border-radius: 25px;
}

@media(max-width: 900px) {
    h1 {
        font-size: 50px;
      /*-webkit-text-stroke-width: 1px;*/

    }
}

.night-vision-effect {
    margin-top: 10px;
    width: 75%;
    border-radius: 25px;
  background-image: url(../assets/club_pic.png), radial-gradient(#D3D3D3, #000000), repeating-linear-gradient(transparent 0, rgba(0, 0, 0, 0.3) 2.5px, transparent 5px);
  background-size: cover;
  background-position: center;
  background-blend-mode: overlay;
  animation-duration: 0.1s;
  animation-delay: 0;
  animation-iteration-count: infinite;
  animation-direction: forward;
  animation-name: animate;
}

[class$=-effect1] img {
  vertical-align: top !important;
  margin: 0 !important;
  opacity: 0 !important;
}

.night-vision-effect1 {
    margin-top: 30px;
    width: 75%;
    border-radius: 25px;
  background-image: url(../assets/image.png), radial-gradient(#D3D3D3, #000000), repeating-linear-gradient(transparent 0, rgba(0, 0, 0, 0.3) 2.5px, transparent 5px);
  background-size: cover;
  background-position: center;
  background-blend-mode: overlay;
  animation-duration: 0.1s;
  animation-delay: 0;
  animation-iteration-count: infinite;
  animation-direction: forward;
  animation-name: animate1;
}

[class$=-effect2] img {
  vertical-align: top !important;
  margin: 0 !important;
  opacity: 0 !important;
}

.night-vision-effect2 {
    margin-top: 30px;
    width: 75%;
    border-radius: 25px;
  background-image: url(../assets/image2.png), radial-gradient(#D3D3D3, #000000), repeating-linear-gradient(transparent 0, rgba(0, 0, 0, 0.3) 2.5px, transparent 5px);
  background-size: cover;
  background-position: center;
  background-blend-mode: overlay;
  animation-duration: 0.1s;
  animation-delay: 0;
  animation-iteration-count: infinite;
  animation-direction: forward;
  animation-name: animate2;
}

[class$=-effect] img {
  vertical-align: top !important;
  margin: 0 !important;
  opacity: 0 !important;
}

/* CodePen Styles */
body {
  display: flex;
  height: 100vh;
}

div {
  margin: auto;
}

@keyframes animate {
  0% {
    background-image: url(../assets/club_pic.png), radial-gradient(#D3D3D3
, #000000), repeating-linear-gradient(transparent 0, rgba(0, 0, 0, 0.3) 1.5px, transparent 5px);
  }

  50% {
    background-image: url(../assets/club_pic.png), radial-gradient(#D3D3D3
, #000000), repeating-linear-gradient(transparent 0, rgba(0, 0, 0, 0.3) 4.5px, transparent 5px);
  }
100% {
    background-image: url(../assets/club_pic.png), radial-gradient(#D3D3D3
, #000000), repeating-linear-gradient(transparent 0, rgba(0, 0, 0, 0.3) 2.5px, transparent 5px);
  }
}


@keyframes animate1 {
  0% {
    background-image: url(../assets/image.png), radial-gradient(#D3D3D3, #000000), repeating-linear-gradient(transparent 0, rgba(0, 0, 0, 0.3) 1.5px, transparent 5px);
  }

  50% {
    background-image: url(../assets/image.png), radial-gradient(#D3D3D3, #000000), repeating-linear-gradient(transparent 0, rgba(0, 0, 0, 0.3) 4.5px, transparent 5px);
  }
100% {
    background-image: url(../assets/image.png), radial-gradient(#D3D3D3, #000000), repeating-linear-gradient(transparent 0, rgba(0, 0, 0, 0.3) 2.5px, transparent 5px);
  }
}

@keyframes animate2 {
  0% {
    background-image: url(../assets/image2.png), radial-gradient(#D3D3D3, #000000), repeating-linear-gradient(transparent 0, rgba(0, 0, 0, 0.3) 1.5px, transparent 5px);
  }

  50% {
    background-image: url(../assets/image2.png), radial-gradient(#D3D3D3, #000000), repeating-linear-gradient(transparent 0, rgba(0, 0, 0, 0.3) 4.5px, transparent 5px);
  }
100% {
    background-image: url(../assets/image2.png), radial-gradient(#D3D3D3, #000000), repeating-linear-gradient(transparent 0, rgba(0, 0, 0, 0.3) 2.5px, transparent 5px);
  }
}

</style>