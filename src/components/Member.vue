<template>
    <div class="member-wrapper">

        <router-link target="_blank" v-bind:to="`/members/${fname.toLowerCase()[0]}${lname.toLowerCase()}`">
        <img v-bind:src="require(`../assets/people/${image}`)" style="width: 100%" />
        </router-link>
        <figcaption class="member-text">
            <h4>{{ fname }} {{ lname }}</h4>
            <h5>[{{ position=="M"?"member":position=="P"?"president":"vice president"}}]</h5>
            <h6>{{ grade }}th grade</h6>
            <span v-for="contact in this.contact_list" v-bind:key="contact.id" class="contact-list">
                <a v-bind:href="contact.link" target="_blank"><i v-bind:class="contact.icon + ' fa-lg'"
                            style="color: #111" aria-hidden="true" id="link"></i></a>
            </span>
        </figcaption>
    </div>
</template>

<script>
    export default {
        name: "Member",
        props: {
            fname: {
                type: String,
                required: true,
            },
            lname: {
                type: String,
                required: true,
            },
            image: {
                type: String,
                required: true,
            },
            grade: {
                type: String,
                required: true,
            },
            position: {
                type: String,
                required: true,
            },
            contact_list: {
                type: Array,
                required: true,
            },
        },
    };
</script>

<style scoped>
.member-wrapper {
    background-color:#ffbc57;
    border-radius: 5px;
    box-sizing: border-box;
    width: 250px;
    cursor: pointer;
    transition: all 0.25s ease;
}

.member-wrapper:hover {
    transform: scale(1.1, 1.1);

}

#link {
    transition: all 0.25s ease;
}

img {
    border-radius: 5px;
}

#link:hover {
    transform: scale(1.2, 1.2);
}

.member-text {
    padding: 20px;
}
h6 {
    margin: 5px;
    margin-bottom: 12px;
    text-transform: lowercase;

}
.contact-list {
    padding: 5px;
    margin-bottom: 5px;
}

h4 {
    font-size: 15px;
    margin-bottom: 5px;
    text-transform: lowercase;
}
h6 {
    font-size: 12px;
    text-transform: lowercase;

}

</style>