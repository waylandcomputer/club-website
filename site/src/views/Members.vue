<template>
    <div class="members">
        <h1>
        current members
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
                fetch("https://waylandcs.com/data/existing_member_data")
                    .then((response) => response.json())
                    .then((data) => {
                        this.userData = data;
                    });
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

</style>
