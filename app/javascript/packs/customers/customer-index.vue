<template>
    <v-layout row mt-2>
        <v-flex xs12 sm6 offset-sm3>
            <v-card>
                <v-toolbar dark>
                    <v-toolbar-title>Customers</v-toolbar-title>
                </v-toolbar>
                <v-list two-line>
                    <v-list-tile avatar ripple v-for="(customer, index) in customers" :key="index">
                        <v-list-tile-content>
                            <v-list-tile-title>{{ customer.name }}</v-list-tile-title>
                            <v-list-tile-sub-title class="grey--text text--darken-1">
                                {{ customer.website }}
                            </v-list-tile-sub-title>
                        </v-list-tile-content>
                        <v-list-tile-action>
                            <v-list-tile-action-text>
                                4 projects
                            </v-list-tile-action-text>
                        </v-list-tile-action>
                    </v-list-tile>
                </v-list>
            </v-card>
        </v-flex>
    </v-layout>
</template>

<script>
    export default {
        data: function() {
            return {
                customers: this.customerlist
            }
        },
        props: ['customerlist'],
        created: function() {
            console.log('customer index created')
        }
    }
</script>