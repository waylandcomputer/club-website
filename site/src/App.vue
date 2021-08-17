<template>
<div class="main-container" id="app">
  <div id="nav">
    <a href="/"><img src="./assets/csclublogo.png" alt="club logo" class="logo"></a>
    <router-link to="/" style="font-size: 1.25vw">Home</router-link> |
    <router-link to="/about" style="font-size: 1.25vw">About</router-link> |
    <router-link to="/members" style="font-size: 1.25vw">Members</router-link> | 
    <router-link to="/projects" style="font-size: 1.25vw">Projects</router-link>
  </div>
  <router-view />
</div>
</template>

<style>
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
</style>
