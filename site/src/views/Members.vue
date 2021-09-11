<template>
    <div class="members">
        <h1>Current Members</h1>
        <div class="members-div">
            <div class="member-grid">
                <div class="member" v-for="user in userData" v-bind:key="user.id">
                    <Member
                        :name="user.fname + ' ' + user.lname"
                        :image="user.image"
                        :grade="user.grade"
                    />
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import Member from "../components/Member.vue";
    import data from "../assets/example3.json";

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
                this.userData = data;
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