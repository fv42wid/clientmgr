<template>
    <v-layout row justify-center>
        <v-dialog fullscreen transition="dialog-bottom-transition" v-model="editDialog" :overlay="false">
            <v-btn fab accent slot="activator">
                <v-icon>edit</v-icon>
            </v-btn>
            <v-card>
                <v-container>
                    <v-toolbar class="primary">
                        <v-btn icon @click="editDialog = false" class="white--text">
                            <v-icon>close</v-icon>
                        </v-btn>
                        <v-spacer></v-spacer>
                        <v-toolbar-items>
                            <v-btn class="white--text" flat @click="saveChanges">Save</v-btn>
                        </v-toolbar-items>
                    </v-toolbar>
                    <v-layout row wrap>
                        <v-flex xs12>
                            <v-card-text>
                                <v-text-field name="name"
                                              label="Name"
                                              v-model="consultant.name"
                                              :disabled="loading"
                                              required></v-text-field>
                                <v-text-field name="title"
                                              label="Title"
                                              v-model="consultant.title"
                                              :disabled="loading"
                                              required></v-text-field>
                                <v-text-field name="background"
                                              label="Background"
                                              v-model="consultant.background"
                                              :disabled="loading"
                                              multi-line></v-text-field>
                                <h5>Expertise</h5>
                                <v-checkbox v-for="expertise in expertises"
                                            :key="expertise.id"
                                            v-model="consultant.expertise_ids"
                                            :label="expertise.name"
                                            :value="expertise.id"></v-checkbox>
                            </v-card-text>
                        </v-flex>
                    </v-layout>
                    <v-divider></v-divider>
                    <v-layout row wrap>
                        <v-flex xs12>
                            <v-card-actions>
                                <v-btn flat class="primary--text" @click="editDialog = false">Close</v-btn>
                                <v-btn flat class="primary--text" @click="saveChanges">Save</v-btn>
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
                consultant: {
                    name: this.consultantinput.name,
                    title: this.consultantinput.title,
                    background: this.consultantinput.background,
                    expertise_ids: []
                },
                editDialog: false,
                consultant_id: this.consultantinput.id,
                expertises: this.expertiselist,
                loading: false,
                utf8: '',
                authenticity_token: '',
                errors: []
            }
        },
        props: ['consultantinput', 'expertiselist', 'consultantexpertises'],
        methods: {
            onDismiss(index) {
                this.errors.splice(index, 1)
                console.log(this.errors)
            },
            saveChanges() {
                this.loading = true
                this.$http.patch('/consultants/' + this.consultant_id, {
                    utf8: this.utf8,
                    authenticity_token: this.authenticity_token,
                    consultant: this.consultant
                }).then(response => {
                    this.loading = false
                    this.editDialog = false
                    console.log(response)
                    Turbolinks.visit('/consultants/' + this.consultant_id)
                }, response => {
                    this.loading = false
                    this.errors = JSON.parse(response.bodyText).errors
                    console.log(response)
                })
            }
        },
        computed: {
            formIsValid() {
                return true
            }
        },
        created() {
            this.utf8 = document.getElementsByName('utf8')[0].getAttribute('value')
            this.authenticity_token = document.getElementsByName('authenticity_token')[0].getAttribute('value')
            for(var i = 0; i < this.consultantexpertises.length; i++) {
                this.consultant.expertise_ids.push(this.consultantexpertises[i].id)
            }
            console.log('consultant edit created')
        }
    }
</script>