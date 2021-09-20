<template>
    <div class="members">
        <h1>
        current members
        </h1>
        <div class="members-div">
            <div class="member-grid">
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Grade</th>
                    </tr>
                    <tr v-for="user in userData" v-bind:key="user.id">
                        <td>{{ user.fname }}</td>
                        <td>{{ user.grade }}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
    import data from "../assets/example4.json";

    export default {
        name: "Queue",
        data() {
            return {
                userData: [],
            };
        },
        methods: {
            getData() {
                //fetch("http://localhost:5002/data/new_member_data")
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
    display: flex;
    justify-content: center;
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