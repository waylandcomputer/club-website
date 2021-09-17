<template>
<div>
    <form action="/signup" method="post">
    <label for="fname">First name:</label><br>
    <input type="text" id="fname" name="fname" value="John"><br>
    <label for="lname">Last name:</label><br>
    <input type="text" id="lname" name="lname" value="Doe"><br><br>
    <label for="grade">Grade:</label><br>
    <input type="number" id="grade" name="grade" value="9"><br><br>
    <input type="submit" value="Submit">
</form>
</div>
</template>

<script>

export default {
    name: "Signup",
    
}
</script>

<style scoped>

</style>