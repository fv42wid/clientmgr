<template>
    <form @submit.prevent="signUp">
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="email"
                              label="Email"
                              v-model="user.email"
                              type="email"
                              :disabled="loading"
                              required></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="password"
                              label="Password"
                              v-model="user.password"
                              type="password"
                              :disable="loading"
                              required></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="password_confirmation"
                              label="Confirm Password"
                              v-model="user.password_confirmation"
                              type="password"
                              :disabled="loading"
                              :rules="[comparePasswords]"></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-btn type="submit"
                       primary
                       :diabled="loading"
                       :loading="loading"
                       @click.native="loader = 'loading'">
                    Sign Up
                    <span slot="loader" class="custom-loader">
                        <v-icon light>cached</v-icon>
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
                user: {
                    email: '',
                    password: '',
                    password_confirmation: ''
                },
                loading: false,
                utf8: '',
                authenticity_token: '',
                errors: []
            }
        },
        methods: {
            signUp() {
                this.loading = true
                this.$http.post('/users', {utf8: this.utf8, authenticity_token: this.authenticity_token, user: this.user}).then(
                    response => {
                        this.loading = false
                        Turbolinks.visit('/customers')
                    }, response => {
                        this.loading = false
                        console.log(response.body.errors)
                    }
                )
                console.log('submit')
            }
        },
        computed: {
            comparePasswords() {
                return this.user.password !== this.user.password_confirmation ? 'Passwords do not match' : ''
            }
        },
        created: function() {
            this.utf8 = document.getElementsByName('utf8')[0].getAttribute('value')
            this.authenticity_token = document.getElementsByName('authenticity_token')[0].getAttribute('value')
            console.log('signup created')
        }
    }
</script>