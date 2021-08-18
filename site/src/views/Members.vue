<template>
  <div class="home">
    <h1>Current Members</h1>
    <div class="member-grid">
      <div v-for="user in userData" v-bind:key="user.name">
        <Member
          :name="user.name"
          :imagePath="image"
          :username="user.username"
          :website="user.website"
        />
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
.member-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  grid-gap: 100px;
  grid-auto-rows: minmax(100px, auto);
  justify-items: center;
}
</style>