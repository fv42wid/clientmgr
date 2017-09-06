<template>
    <v-layout row justify-center>
        <v-dialog fullscreen transition="dialog-bottom-transition" v-model="awsDialog" :overlay="false">
            <v-btn fab accent slot="activator">
                <v-icon>edit</v-icon>
            </v-btn>
            <v-card>
                <v-container>
                    <v-toolbar class="primary">
                        <v-btn icon @click="awsDialog = false" class="white--text">
                            <v-icon>close</v-icon>
                        </v-btn>
                        <v-spacer></v-spacer>
                        <v-toolbar-items>
                            <v-btn class="white--text" flat @click="saveAccount">Save</v-btn>
                        </v-toolbar-items>
                    </v-toolbar>
                    <v-layout row wrap>
                        <v-flex xs12>
                            <v-card-text>
                                <v-text-field name="account_id"
                                              label="Account ID"
                                              v-model="account.account_id"
                                              :disabled="loading"
                                              required></v-text-field>
                                <v-text-field name="estimated_spend"
                                              label="Estimated Spend"
                                              v-model="account.estimated_spend"
                                              :disabled="loading"
                                              type="number"
                                              prefix="$"
                                              required></v-text-field>
                            </v-card-text>
                        </v-flex>
                    </v-layout>
                    <v-divider></v-divider>
                    <v-layout row wrap>
                        <v-flex xs12>
                            <v-card-actions>

                                <v-btn flat class="primary--text" @click="awsDialog = false">Close</v-btn>
                                <v-btn flat class="primary--text text-xs-right" @click="saveAccount">Save</v-btn>

                            </v-card-actions>
                        </v-flex>
                    </v-layout>
                </v-container>
            </v-card>
        </v-dialog>
    </v-layout>
</template>

<script>
    export default {
        data() {
            return {
                account: {
                    account_id: '',
                    estimated_spend: '',
                    project_id: this.projectid
                },
                awsDialog: false,
                loading: false,
                errors: []
            }
        },
        props: ['projectid'],
        methods: {
            saveAccount() {
                this.loading = true
                this.$http.post('/awsaccounts', {
                    awsaccount: this.account
                }).then(response => {
                    this.loading = false
                    console.log(response)
                    var project_id = JSON.parse(response.bodyText).awsaccount.project_id
                    Turbolinks.visit('/projects/' + project_id)
                }, response => {
                    this.loading = false
                    this.errors = JSON.parse(response.bodyText).errors
                })
            }
        },
        created() {
            console.log('aws new created')
        }
    }
</script>