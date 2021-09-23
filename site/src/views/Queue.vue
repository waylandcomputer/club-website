<template>
    <div class="members">
<!--         <h1>
        pending members
        </h1> -->
        <div class="members-div">
            <div class="member-grid">
                <table>
                    <tr>
                        <th>name</th>
                        <th>grade</th>
                        <th>date</th>
                    </tr>
                    <tr v-for="user in userData" v-bind:key="user.id">
                        <td>{{ user.fname }} {{ user.lname }}</td>
                        <td>{{ user.grade }}</td>
                        <td>{{ user.strftime('%H:%M %d-%m-%y') }}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Queue",
        data() {
            return {
                userData: [],
                timer: "",
            };
        },
        methods: {
            async getData() {
                const res = await fetch("https://waylandcs.com/data/new_member_data");
                const data = await res.json();
                this.userData = data;
            },
            cancelAutoUpdate() {
                clearInterval(this.timer);
            },
        },
        beforeUnmount() {
            this.cancelAutoUpdate();
        },
        created() {
            this.getData();
            this.timer = setInterval(this.getData, 5000);
        },
        bool: true
    };

</script>

<style scoped>

h1 {
    font-size: 100px;
    color: #FFBC57;
/*      -webkit-text-stroke-width: 5px;
  -webkit-text-stroke-color: #111;*/
}

table {
    /*border-collapse: collapse;*/
    width: 100%;
    /*height: 100vh;*/
    margin: 0 auto;
}

table, th, td {
    border: 1px solid #FFBC57;

}


.members {
    text-align: center;
    margin: 0;
    /*padding-top: 50px;*/
    /*padding-bottom: 50px;*/
}


.members-div {
    /*padding: 50px;*/
    font-size: 20px;
}


tr:nth-child(even) {
    background-color: #FFBC57;
    color: #111;
}

tr:nth-child(odd) {
    background-color: rgb(39, 37, 37);
    color: #FFBC57;
}



td {
    text-transform: lowercase;
    padding: 15px;
}

th {
    color: #FF914D;
    background-color: #111;
    padding: 20px;
    font-size: 30px;
}

@media(max-width: 1000px) {
    th {
        font-size: 2vw;
    }

    tr {
        font-size: 2.5vw;
    }
}

@media(max-width: 700px) {
    th {
        font-size: 2.5vw;
    }

    tr {
        font-size: 3vw;
    }
}

</style>
