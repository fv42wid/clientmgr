<template>
    <v-dialog width="350px" persistent v-model="editDialog">
        <v-btn fab accent slot="activator">
            <v-icon>edit</v-icon>
        </v-btn>
        <v-card>
            <v-container>
                <v-layout row wrap>
                    <v-flex xs12>
                        <v-card-title>Edit {{ customer.name }}</v-card-title>
                    </v-flex>
                </v-layout>
                <v-divider></v-divider>
                <v-layout row wrap>
                    <v-flex xs12>
                        <v-card-text>
                            <v-text-field name="name"
                                          label="Customer Name"
                                          v-model="customer.name"
                                          :disabled="loading"
                                          required></v-text-field>
                            <v-text-field name="website"
                                          label="Website"
                                          v-model="customer.website"
                                          :disabled="loading"></v-text-field>
                            <v-text-field name="description"
                                          placeholder="Description"
                                          v-model="customer.description"
                                          multi-line
                                          :disabled="loading"></v-text-field>
                        </v-card-text>
                    </v-flex>
                </v-layout>
                <v-divider></v-divider>
                <v-layout row wrap>
                    <v-flex xs12>
                        <v-card-actions>
                            <v-btn flat class="blue--text darken-1" @click="editDialog = false">Close</v-btn>
                            <v-btn flat class="blue--text darken-1" @click="onSaveChanges">Save</v-btn>
                        </v-card-actions>
                    </v-flex>
                </v-layout>
            </v-container>
        </v-card>
    </v-dialog>
</template>

<script>
    export default {
        data: function() {
            return {
                customer: {
                    name: this.customerinput.name,
                    website: this.customerinput.website,
                    description: this.customerinput.description
                },
                editDialog: false,
                customer_id: this.customerinput.id,
                loading: false,
                utf8: '',
                authenticity_token: '',
                errors: []
            }
        },
        props: ['customerinput'],
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
            },
            onSaveChanges() {
                this.editDialog = false
                //add validation
                this.$http.patch('/customers/' + this.customer_id, {
                    utf8: this.utf8,
                    authenticity_token: this.authenticity_token,
                    customer: this.customer
                }).then(response => {
                    console.log(response)
                }, response => {
                    console.log(response)
                })
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
            //this.customer.name = this.customerinput.name
            //this.customer.website = this.customerinput.website
            //this.customer.description = this.customerinput.description
            //this.customer_id = this.customerinput.id
            console.log('new customer created')
        }
    }
</script>