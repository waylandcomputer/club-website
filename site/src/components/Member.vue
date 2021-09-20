<template>
    <div class="member-wrapper">
        <img v-bind:src="require(`../assets/people/${image}`)" style="width: 100%" />
        <figcaption class="member-text">
            <h4>{{ name }}</h4>
            <h5>- {{ position=="M"?"Member":position=="P"?"President":"Vice President"}} -</h5>
            <h6>{{ grade }}th grade</h6>
            <span v-for="contact in this.contact_list" v-bind:key="contact.id" class="contact-list">
                <a v-bind:href="contact.link" target="_blank"><i v-bind:class="contact.icon + ' fa-lg'"
                            style="color: #111" aria-hidden="true"></i></a>
            </span>
        </figcaption>
    </div>
</template>

<script>
    export default {
        name: "Member",
        props: {
            name: {
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

img {
    border-radius: 5px;
}
.member-wrapper:hover {
    transform: scale(1.1, 1.1);
}

.member-text {
    padding: 20px;
}
h6 {
    margin: 5px;
    margin-bottom: 12px;
}
.contact-list {
    padding: 5px;
    margin-bottom: 5px;
}

h4 {
    font-size: 15px;
    margin-bottom: 5px;
}
h6 {
    font-size: 12px;
}

</style>