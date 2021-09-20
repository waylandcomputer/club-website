<template>
    <div class="members">
        <h1>
        Current Members
        </h1>
        <div class="members-div">
            <div class="member-grid">
                <div class="member" v-for="user in userData" v-bind:key="user.id">
                    <Member
                        :name="user.fname + ' ' + user.lname"
                        :image="user.image"
                        :grade="user.grade"
                        :position="user.position"
                        :contact_list="user.contact_list"
                    />
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import Member from "../components/Member.vue";
    import data from "../assets/example4.json";

    export default {
        name: "Members",
        components: {
            Member,
        },
        data() {
            return {
                userData: [],
            };
        },
        methods: {
            getData() {
                //fetch("http://localhost:5002/data/member_data")
                //    .then((response) => response.json())
                //    .then((data) => {
                //        this.userData = data;
                //    });
                this.userData = data;
            },
        },
        created() {
            this.getData();
        },
    };

document.addEventListener('DOMContentLoaded',function(event){
// array with texts to type in typewriter
var dataText = ["Current Members"];

// type one text in the typwriter
// keeps calling itself until the text is finished
function typeWriter(text, i, fnCallback) {
// chekc if text isn't finished yet
if (i < (text.length)) {
  // add next character to h1
 document.querySelector("h1").innerHTML = text.substring(0, i+1) +'<span id="type" aria-hidden="true"></span>';

  // wait for a while and call this function again for next character
  setTimeout(function() {
    typeWriter(text, i + 1, fnCallback)
  }, 150);
}
// text finished, call callback if there is a callback function
else if (typeof fnCallback == 'function') {
  // call callback after timeout
  setTimeout(fnCallback, 700);
}
}
// start a typewriter animation for a text in the dataText array
function StartTextAnimation(i) {
 if (typeof dataText[i] == 'undefined'){
    setTimeout(function() {
      StartTextAnimation(0);
    }, 20000000);
 }
 // check if dataText[i] exists
if (i < dataText[i].length) {
  // text exists! start typewriter animation
 typeWriter(dataText[i], 0, function(){
   // after callback (and whole text has been animated), start next text
   StartTextAnimation(i + 1);
 });
}
}
// start the text animation
StartTextAnimation(0);
});
</script>

<style scoped>

h1 {
    font-size: 100px;
    color: #FFBC57;
/*      -webkit-text-stroke-width: 5px;
  -webkit-text-stroke-color: #111;*/
}




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
    color: black;
}

@media(max-width: 900px) {
    h1 {
        font-size: 50px;
      /*-webkit-text-stroke-width: 1px;*/

    }
}

</style>