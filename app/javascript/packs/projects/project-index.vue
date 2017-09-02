<template>
    <v-list-tile avatar ripple :href="link">
        <v-list-tile-content>
            <v-list-tile-title>{{ project.title }}</v-list-tile-title>
            <v-list-tile-sub-title class="grey--text text--darken-1">
                {{ customer.name }}
            </v-list-tile-sub-title>
        </v-list-tile-content>
    </v-list-tile>
</template>

<script>
    export default {
        data() {
            return {
                project: this.projectinput,
                customer: this.customerinput
            }
        },
        props: ['projectinput', 'customerinput'],
        computed: {
            link() {
                return '/projects/' + this.project.id
            }
        },
        created() {
            console.log('project index created')
            //console.log(this.project)
            //console.log(this.customer)

        }
    }
</script>