<template>
    <form @submit.prevent="createCustomer">
        <v-layout row v-for="(error, index) in errors">
            <v-flex xs12 sm6>
                <v-alert error dismissible :value="true" @input="onDismiss(index)">{{ error }}</v-alert>
            </v-flex>
        </v-layout>
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
                       :disabled="!formIsValid"
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
                loading: false,
                utf8: '',
                authenticity_token: '',
                errors: []
            }
        },
        methods: {
            createCustomer() {
                this.loading = true
                this.$http.post('/customers', {
                    utf8: this.utf8,
                    authenticity_token: this.authenticity_token,
                    customer: this.customer
                }).then(response => {
                    this.loading = false
                    console.log(response)
                    var customer_id = JSON.parse(response.bodyText).customer.id
                    Turbolinks.visit('/customers/' + customer_id)
                }, response => {
                    this.loading = false
                    this.errors = JSON.parse(response.bodyText).errors
                    console.log(JSON.parse(response.bodyText).errors)
                })
                console.log('submit')
            },
            onDismiss(index) {
                this.errors.splice(index, 1)
                console.log(this.errors)
            }
        },
        computed: {
            formIsValid() {
                if(this.loading) {
                    return false
                }
                else if(this.customer.name !== '') {
                    return true
                }
                return false
            }
        },
        created: function() {
            this.utf8 = document.getElementsByName('utf8')[0].getAttribute('value')
            this.authenticity_token = document.getElementsByName('authenticity_token')[0].getAttribute('value')
            console.log('new customer created')
        }
    }
</script>