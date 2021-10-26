<template>
    <div class="members">
        <h1>
        current members
        </h1>
        <div class="members-div">
            <div v-if="loading" class="loader"></div>
            <div v-else class="member-grid">
                <div class="member" v-for="user in userData" v-bind:key="user.id">
                        <Member
                            :fname="user.fname"
                            :lname="user.lname"
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
                loading: true,
            };
        },
        methods: {
            getData() {
                //fetch("http://localhost:5002/data/existing_member_data")
                //    .then((response) => response.json())
                //    .then((data) => {
                //        this.userData = data;
                //        this.loading = false;
                //    });

                // Code above should be used in prod to get loading icon. 
                this.userData = data;
                // this.loading = false; // remove this line to see loading 
            },
        },
        created() {
            this.getData();
        },
    };

</script>

<style scoped>

h1 {
    font-size: 100px;
    color: #FFBC57;
/*      -webkit-text-stroke-width: 5px;
  -webkit-text-stroke-color: #111;*/
}

.members {
    background-color: rgb(39, 37, 37);
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

.loader {
  border: 16px solid #111; /* Light grey */
  border-top: 16px solid #ffbc57; /* Blue */
  border-radius: 50%;
  width: 100px;
  height: 100px;
  animation: spin 2s linear infinite;
  margin: 0 auto;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

</style>