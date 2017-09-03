<template>
    <form @submit.prevent="createConsultant">
        <v-layout row v-for="(error, index) in errors" :key="index">
            <v-flex xs12 sm6>
                <v-alert error dismissible :value="true" @input="onDismiss(index)">{{ error }}</v-alert>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="name"
                              label="Name"
                              v-model="consultant.name"
                              :disabled="loading"
                              required></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="title"
                              label="Title"
                              v-model="consultant.title"
                              :disabled="loading"
                              required></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <h5>Expertise</h5>
                <v-checkbox v-for="expertise in expertises"
                            :key="expertise.id"
                            v-model="consultant.expertise_ids"
                            :label="expertise.name"
                            :value="expertise.id"></v-checkbox>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs3 offset-xs9 sm6 offset-sm3>
                <v-btn primary
                       type="submit"
                       :loading="loading"
                       @click="loader = 'loading'">
                    Create Consultant
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
        data() {
            return {
                consultant: {
                    name: '',
                    title: '',
                    expertise_ids: []
                },
                loading: false,
                expertises: JSON.parse(this.expertiselist),
                utf8: '',
                authenticity_token: '',
                errors: []
            }
        },
        props: ['expertiselist'],
        methods: {
            createConsultant() {
                this.loading = true
            },
            onDismiss(index) {
                this.errors.splice(index, 1)
                console.log(this.errors)
            }
        },
        created() {
            console.log('consultant new created')
        }
    }
</script>