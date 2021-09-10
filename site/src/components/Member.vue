<template>
  <div class="member-wrapper">
    <img v-bind:src="imagePath" style="width: 100%" />
    <div class="member-text">
      {{ name }}
      <br />
      {{ username }}
      <br />
      {{ website }}
    </div>
  </div>
</template>

<script>
export default {
  name: "Member",
  props: {
    name: {
      type: String,
      required: true,
    },
    imagePath: String,
    username: String,
    website: String,
  },
};
</script>

<style scoped>
.member-wrapper {
  background-color: white;
  border-radius: 5px;
  border: 1px solid #dfe3e8;
  box-sizing: border-box;
  width: 250px;
  cursor: pointer;
  transition: all 0.25s ease;
}

.member-wrapper:hover {
  transform: scale(1.1, 1.1);
}

.member-text {
  padding: 20px;
}
</style>