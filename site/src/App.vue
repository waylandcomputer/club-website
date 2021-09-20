<template>
<div id="app" class="main-container">
    <div id="nav">
        <router-link to="/"
        ><img src="./assets/csclublogo.png" alt="club logo" class="logo"
        /></router-link>
        <router-link style="padding-left: 10px" to="/about" class="nav-link">about</router-link>
        <router-link to="/members" id="member-link" class="nav-link">members</router-link>
        <router-link to="/projects" class="nav-link">projects</router-link>
        <!-- <router-link to="/signup" class="nav-link">Sign Up</router-link> -->
	</div>
	<body>
        <router-view />
	</body>
	<footer>
        <ul class="social-list">
            <li class="social-list__item">
                <a class="social-list__link" href="https://github.com/waylandcomputer" target="_blank"><i class="fab fa-github"></i></a>
            </li>
            <li class="social-list__item">
                <a class="social-list__link" href="https://www.youtube.com/channel/UCwZ5Ip1wCb8yC9sfNnCtsZw" target="_blank"><i class="fab fa-youtube"></i></a>
            </li>
            <li class="social-list__item">
                <a class="social-list__link" href="https://www.instagram.com/waylandcomputer/" target="_blank"><i class="fab fa-instagram"></i></a>
            </li>
            <li class="social-list__item">
                <a class="social-list__link" href="https://twitter.com/wayland_cs" target="_blank"><i class="fab fa-twitter"></i></a>
            </li>
        </ul>
	</footer>
</div>
</template>


<script>

</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Lato:wght@700&family=Roboto:wght@100&display=swap");

* {
    margin: 0;
}

html {background-color: #111}



body {
    display: flex;
    flex-direction: column;
    
    -ms-overflow-style: none;  /* IE and Edge */
    scrollbar-width: none;  /* Firefox */
    /*min-height: 50vh;*/
    /*the above is*/
}

body::-webkit-scrollbar {
    display: none;
}

#app {
    font-family: monospace;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: rgb(165, 165, 165);
    background-color: rgb(17, 17, 17);
    margin: 0;
    padding: 0;
    height: 100%;
}

#type {
    margin-left: 5px;
    border-right: 0.05em solid;
    animation: caret 1s steps(1) infinite;
    color: #111;
}

@keyframes caret {
    50% {
        border-color: transparent;
    }
}

#nav {
    padding: 0px;
    text-align: left;
    background-color: #111;
    vertical-align: middle;
    display: table;
}


#nav a {
    font-weight: bold;
    vertical-align: middle;
    color: #FF914D;
}

#nav a:hover {
    opacity:0.8;
}

#nav a.router-link-exact-active {
    color: #ffbc57;
}

.logo {
    height: 75px;
    width: 75px;
    margin-left: 10px;
    transition: transform 250ms ease-in-out;
}
.main-container {
    /*min-height: 100vh;*/
    overflow: hidden;
    display: block;
    position: relative;
    margin: 0;
}
.nav-link {
    font-size: 18px;
    text-decoration: none;
    transition: transform 250ms ease-in-out;
    vertical-align: middle;
    /*border: 1px solid #000000;*/
    display: table-cell;
    vertical-align: middle;
    padding-left: 20px;
}

/*.nav-link_about {
    font-size: 18px;
    text-decoration: none;
    transition: transform 250ms ease-in-out;
    vertical-align: middle;
    display: table-cell;
    vertical-align: middle;
    padding-left: 10px;
}*/


.nav-link:hover {
	transform: scale(1.1);
}

footer {
	background-color: #111;
	padding: 25px;
}

.footer-text {
	font-size: 50px;
	color: #272525;
}

.logo:hover {
	opacity: 0.8;
	transform: scale(1.1);
}

.social-list__link:focus,
.social-list__link:hover {
	opacity: .8;
	outline: none;

}

.social-list__item:hover {
	transform: scale(1.1);

}

.social-list {
	list-style: none;
	display: flex;
	justify-content: center;
	margin: 2em 0;
	padding: 0;

}

.social-list__item {
	transition: transform 250ms ease-in-out;
	margin: 0 .5em;
}

.social-list__link {
	font-size: 40px;
	color: #ffbc57;
	padding: .5em;
}



</style>
