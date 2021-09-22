<template>
    <div class="signup">
        <div class="innerf">
        <form v-on:submit.prevent="submitForm">
            <p>First Name</p>
            <div class="form-group">
                <input type="text" class="form-control" id="fname" placeholder="" v-model="form.fname">
            </div>
            <p>Last Name</p>
            <div class="form-group">
                <input type="text" class="form-control" id="lname" placeholder="" v-model="form.lname">
            </div>
<!--             <p>student email</p>
            <div class="form-group">
                <input type="text" class="form-control" id="lname" placeholder="" v-model="form.email">
            </div> -->
            <p>Grade</p>
            <div class="form-group">
                <input type="number" class="form-control" id="grade" placeholder="" max="12" min="9" v-model="form.grade">
            </div>
            <input type="submit" value="submit">
        </form>
        </div>
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
                // email: '',
                grade: ''
            }
        }
    },
    methods:{
        async submitForm(){
            if (!this.form.fname || !this.form.lname || !this.form.grade) {
                alert("Please fill out all the fields");
            }
            // if(!(this.form.email.includes("_") && this.form.email.includes("@student.waylandps.org"))) {
            //     alert("Enter a valid email!");
            // }
            else {
                await axios.post('http://localhost:5002/data/signup', this.form);
                this.$router.push({ name: 'Queue' });
                // clear form
                this.form.fname = "";
                this.form.lname = "";
                // this.form.email = "";
                this.form.grade = "";
            } 
        }
    }
}

</script>

<style scoped>

.signup {
    position: center;
    background-color: rgb(39, 37, 37);
    /*padding: 20px;*/
    width: 100%;
    height: 100vh;

}

.innerf {
    border: 5px dashed #FFBC57;
    margin: 0 auto;
    padding: 20px;
    border-radius: 10px;
    width: 30%;
    padding-bottom: 30px;
    /*margin-top: 50px;*/
    /*margin: 0;*/
    position: absolute;
    top: 40%;
    left: 50%;
    -ms-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    background-color: #1f1d1d;
}

@media(max-width: 800px) {
    .innerf {
        width: 60%;
    }
}

input {
    border: #000;
    text-align: center;
    font-family: monospace;
    box-sizing: border-box;
    font-size: 20px;
}
input[type=text] {
    width: 70%;
    padding: 12px 20px;
    /*margin: 8px 0;*/
    border-radius: 10px;


}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}


input[type=number] {
    /*width: 7%;*/
    padding: 12px 20px;
    /*margin: 8px 0;*/
    border-radius: 10px;
    -moz-appearance: textfield;
}

input[type=submit] {
    /*width: 15%;*/
    /*font-size: 2vw;*/
    padding: 12px 20px;
    margin: 8px 0;
    margin-top: 30px;
    border-radius: 10px;
    background-color: #ffbc57;
    border: 1px solid #111;

}
input[type=submit]:hover {
    cursor: pointer;
    text-transform: lowercase;
    background-color: rgb(39, 37, 37);;
    color: #ffbc57;
    border: 1px solid #ffbc57;



}



label {
    font-size: 25px;
}

p {
    margin-top: 18px;
    margin-bottom: 2px;
    font-size: 15px;
    text-transform: lowercase;
}

</style>