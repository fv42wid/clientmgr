<template>
    <v-list-tile avatar ripple :href="link">
        <v-list-tile-title>{{ consultant.name }}</v-list-tile-title>
    </v-list-tile>
</template>

<script>
    export default {
        data() {
            return {
                consultant: this.consultantinput
            }
        },
        props: ['consultantinput'],
        computed: {
            link() {
                return '/consultants/' + this.consultant.id
            }
        },
        created() {
            console.log('consultant index created')
        }
    }
</script>