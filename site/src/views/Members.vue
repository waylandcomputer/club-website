<template>
  <div class="members">
    <h1>Current Members</h1>
    <div class="members-div">
        <div class="member-grid">
          <div class="member" v-for="user in userData" v-bind:key="user.name">
            <Member
              :name="user.name"
              :imagePath="image"
              :username="user.username"
              :website="user.website"
            />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Member from "../components/Member.vue";
export default {
    name: "Members",
    components: {
    Member,
    },
    data() {
    return {
      image: require("../assets/csclublogo.png"),
      userData: [],
    };
    },
    methods: {
    getData() {
      fetch("https://jsonplaceholder.typicode.com/users")
        .then((response) => response.json())
        .then((data) => (this.userData = data));
    },
    },
    created() {
    this.getData();
    },
    };
</script>

<style scoped>

.members {
    text-align: center;
    padding-top: 50px;
    padding-bottom: 50px;
}

.member-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(235px, 1fr));
    max-width: 1500px;
    grid-row-gap: 50px;
    grid-column-gap: 50px;
    margin: 0 auto;
}
.members-div {
    padding: 50px;
}

.member {
    position: relative;
    margin: 0 auto;
}
</style>