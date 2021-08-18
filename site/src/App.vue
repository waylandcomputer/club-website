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
    <router-view />
  </div>
</template>

<style>
* {
  margin: 0;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
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
</style>
