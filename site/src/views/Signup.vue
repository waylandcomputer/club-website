<template>
    <div>
        <form v-on:submit.prevent="submitForm">
            <div class="form-group">
                <label for="fname">First Name</label>
                <input type="text" class="form-control" id="fname" placeholder="John" v-model="form.fname">
            </div>
            <div class="form-group">
                <label for="lname">Last Name</label>
                <input type="text" class="form-control" id="lname" placeholder="Doe" v-model="form.lname">
            </div>
            <div class="form-group">
                <label for="grade">Grade</label>
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
            axios.post('http://localhost:5002/data/signup', this.form);
            // clear form
            this.form.fname = "";
            this.form.lname = "";
            this.form.grade = "";
        }
    }
}

</script>

<style scoped>

</style>