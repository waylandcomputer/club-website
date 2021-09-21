<template>
    <div class="signup">
        <form v-on:submit.prevent="submitForm">
            <label for="fname">First Name </label>
            <div class="form-group">
                <input type="text" class="form-control" id="fname" placeholder="John" v-model="form.fname">
            </div>
            <label for="lname">Last Name </label>
            <div class="form-group">
                <input type="text" class="form-control" id="lname" placeholder="Doe" v-model="form.lname">
            </div>
            <label for="grade">Grade </label>
            <div class="form-group">
                <input type="number" class="form-control" id="grade" placeholder="9" v-model="form.grade">
            </div>
            <input type="submit" value="Submit">
        </form>
    </div>
</template>

<script>

import axios from 'axios';

export default { // code taken from https://5balloons.info/post-form-data-to-api-using-axios-in-vuejs/
    name: 'Signup',
    data() {
        return {
            form: {
                fname: '',
                lname: '',
                grade: ''
            }
        }
    },
    methods:{
        submitForm(){
            if (!this.form.fname || !this.form.lname || !this.form.grade) {
                alert("Please fill out the fields to submit");
            }
            else {
                axios.post('http://localhost:5002/data/signup', this.form);
                this.$router.push({ name: 'Queue' });
                // clear form
                this.form.fname = "";
                this.form.lname = "";
                this.form.grade = "";
            } 
        }
    }
}

</script>

<style scoped>

.signup {
    margin: 3.4vw;
    position: center;
}
input {
    border: #000;
    text-align: center;
    font-family: monospace;
    box-sizing: border-box;
}
input[type=text] {
    width: 50%;
    padding: 12px 20px;
    margin: 8px 0;
}

input[type=number] {
    width: 50%;
    padding: 12px 20px;
    margin: 8px 0;
}

input[type=submit] {
    width: 25%;
    font-size: 3vw;
    padding: 12px 20px;
    margin: 8px 0;
    border-radius: 50px;
    background-color: #ffbc57;
}
input[type=submit]:hover {
    opacity: 0.7;
    cursor: pointer;
}

</style>