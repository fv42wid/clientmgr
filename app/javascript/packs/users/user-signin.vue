<template>
    <form @submit.prevent="signIn">
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="email"
                              label="Email"
                              v-model="user.email"
                              type="email"
                              :disabled="loading"></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="password"
                              label="Password"
                              v-model="user.password"
                              type="password"
                              :disabled="loading"></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-checkbox label="Remember Me"
                            v-model="user.remember_me"
                            :disabled="loading"></v-checkbox>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-btn type="submit"
                       primary
                       :disabled="loading"
                       :loading="loading"
                       @click.native="loader= 'loading'">
                    Sign In
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
                user: {
                    email: '',
                    password: '',
                    remember_me: false
                },
                loading: false
            }
        },
        methods: {
            signIn() {
                this.loading = true
                console.log('submitted')
            }
        },
        created: function() {
            console.log('signin created')
        }
    }
</script>