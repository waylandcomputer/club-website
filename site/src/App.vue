<template>
  <div id="app" class="main-container">
    <div id="nav">
      <router-link to="/"
        ><img src="./assets/csclublogo.png" alt="club logo" class="logo"
      /></router-link>
      <router-link to="/about" class="nav-link">About</router-link>
      <router-link to="/members" class="nav-link">Members</router-link>
      <router-link to="/projects" class="nav-link">Projects</router-link>
    </div>
    <body>
      <router-view />
    </body>
    <footer>
      <div class="footer-text">Follow our socials!</div>
      <div class="footer-images">
        <div class="footer-image">
          <a href="https://www.youtube.com/channel/UCwZ5Ip1wCb8yC9sfNnCtsZw"
            ><img src="./assets/newytlogo.png" alt="Youtube Logo" width="80" />
          </a>
        </div>

        <div class="footer-image">
          <a href="https://www.youtube.com/channel/UCwZ5Ip1wCb8yC9sfNnCtsZw"
            ><img src="./assets/newytlogo.png" alt="Youtube Logo" width="80" />
          </a>
        </div>
      </div>
    </footer>
  </div>
</template>

<style>
@import url("https://fonts.googleapis.com/css2?family=Lato:wght@700&family=Roboto:wght@100&display=swap");

* {
  margin: 0;
}
body {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  margin: 0;
}
#app {
  font-family: "Lato", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: rgb(165, 165, 165);
  background-color: rgb(39, 37, 37);
  margin: 0;
  padding: 0;
  height: 100%;
}

#nav {
  padding: 0px;
  text-align: left;
  background-color: black;
}

#nav a {
  font-weight: bold;
  vertical-align: middle;
  color: #ffbc57;
}

#nav a.router-link-exact-active {
  color: orange;
}

.logo {
  height: 100px;
  width: 100px;
}
.main-container {
  min-height: 100vh; /* will cover the 100% of viewport */
  overflow: hidden;
  display: block;
  position: relative;
  margin: 0;
}
.nav-link {
  margin-left: 20px;
  font-size: 25px;
  text-decoration: none;
}

footer {
  background-color: #ffbc57;
  height: 300px;
  margin-top: 200px;
  padding: 10px;
}

.footer-text {
  font-size: 50px;
  color: #272525;
}
a :hover {
  opacity: 0.3;
}
.footer-image {
  margin-left: 50px;
  margin-right: 50px;
}



</style>