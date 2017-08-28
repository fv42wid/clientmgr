<template>
    <form @submit.prevent="createCustomer">
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="name"
                              label="Customer Name"
                              v-model="customer.name"
                              :disabled="loading"
                              required></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="website"
                              label="Website"
                              v-model="customer.website"
                              :disabled="loading"></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="description"
                              placeholder="Description"
                              v-model="customer.description"
                              multi-line
                              :disabled="loading"></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-btn type="submit"
                       primary
                       :disabled="loading"
                       :loading="loading"
                       @click.native="loader = 'loading'">
                    Create
                    <span slot="loader" class="custom-loader">
                        <v-icon dark>cached</v-icon>
                    </span>
                </v-btn>
            </v-flex>
        </v-layout>
    </form>
</template>

<script>
    export default {
        data: function() {
            return {
                customer: {
                    name: '',
                    website: '',
                    description: ''
                },
                loading: false
            }
        },
        methods: {
            createCustomer() {
                console.log('submit')
            }
        },
        created: function() {
            console.log('new customer created')
        }
    }
</script>