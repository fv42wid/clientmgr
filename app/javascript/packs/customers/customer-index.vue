<template>
    <v-list-tile avatar ripple :href="link">
        <v-list-tile-content>
            <v-list-tile-title>{{ customer.name }}</v-list-tile-title>
            <v-list-tile-sub-title class="grey--text text--darken-1">
                {{ customer.website }}
            </v-list-tile-sub-title>
        </v-list-tile-content>
        <v-list-tile-action>
            <v-list-tile-action-text>
                <v-chip outline class="grey grey--text">
                    {{ projectCount }} projects
                </v-chip>
            </v-list-tile-action-text>
        </v-list-tile-action>
    </v-list-tile>
</template>

<script>
    export default {
        data: function() {
            return {
                customer: this.customerinput,
                projectCount: this.projects
            }
        },
        props: ['customerinput', 'projects'],
        computed: {
            link() {
                return '/customers/' + this.customer.id
            }
        },
        created: function() {
            console.log('customer index created')
        }
    }
</script>