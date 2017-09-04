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
                                    <v-text-field name="title"
                                                  label="Title"
                                                  v-model="project.title"
                                                  :disabled="loading"
                                                  required></v-text-field>
                                </v-card-text>
                                <v-select :items="customers"
                                          v-model="project.customer_id"
                                          item-text="name"
                                          item-value="id"
                                          label="Select Customer"
                                          single-line
                                          bottom></v-select>
                                <v-text-field name="description"
                                              label="Project Description"
                                              v-model="project.description"
                                              :disabled="loading"
                                              multi-line
                                              required></v-text-field>
                                <v-text-field name="industry"
                                              label="Industry"
                                              v-model="project.industry"
                                              :disabled="loading"
                                              required></v-text-field>
                                <v-menu lazy
                                        :close-on-content-click="true"
                                        v-model="engagementDateMenu"
                                        transition="scale-transition"
                                        offset-y
                                        full-width
                                        :nudge-left="40"
                                        max-width="290px">
                                    <v-text-field slot="activator"
                                                  label="Engagement Date"
                                                  v-model="project.engagement_date"
                                                  prepend-icon="event"
                                                  readonly
                                                  required></v-text-field>
                                    <v-date-picker scrollable
                                                   v-model="project.engagement_date"
                                                   actions>
                                        <template scope="{save, cancel}">
                                            <v-card-actions>
                                                <v-btn flat primary @click="cancel()">Cancel</v-btn>
                                                <v-btn flat primary @click="save()">Save</v-btn>
                                            </v-card-actions>
                                        </template>
                                    </v-date-picker>
                                </v-menu>
                                <v-text-field name="engagement_duration"
                                              label="Duration"
                                              v-model="project.engagement_duration"
                                              :disabled="loading"
                                              suffix="days"
                                              type="number"
                                              required></v-text-field>
                                <v-text-field name="country"
                                              label="Country"
                                              v-model="project.country"
                                              :disabled="loading"
                                              required></v-text-field>
                                <v-text-field name="business_problem"
                                              label="Business Problem"
                                              v-model="project.business_problem"
                                              :disabled="loading"
                                              multi-line
                                              required></v-text-field>
                                <v-text-field name="drivers"
                                              label="Drivers"
                                              v-model="project.drivers"
                                              :disabled="loading"
                                              multi-line
                                              required></v-text-field>
                                <v-text-field name="outcome"
                                              label="Outcome"
                                              v-model="project.outcome"
                                              multi-line></v-text-field>
                                <v-text-field name="solution"
                                              label="Solution"
                                              v-model="project.solution"
                                              multi-line></v-text-field>
                                <v-text-field name="solution_explanation"
                                              label="Solution Explanation"
                                              v-model="project.solution_explanation"
                                              multi-line></v-text-field>
                                <v-text-field name="people_resources"
                                              label="People and Resources"
                                              v-model="project.people_resource"
                                              multi-line></v-text-field>
                                <v-text-field name="contacts"
                                              label="Who Can I Contact?"
                                              v-model="project.contacts"
                                              multi-line></v-text-field>
                                <v-select label="Consultants Assigned"
                                          :items="consultants"
                                          item-text="name"
                                          item-value="id"
                                          v-model="project.consultant_ids"
                                          multiple
                                          chips
                                          hint="Who is Assigned?"
                                          persistent-hint></v-select>
                                <v-text-field name="links"
                                              label="Links"
                                              v-model="project.links"
                                              multi-line></v-text-field>
                                <v-text-field name="metrics"
                                              label="Metrics"
                                              v-model="project.metrics"
                                              multi-line></v-text-field>

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
                project: {
                    title: this.projectinput.title,
                    description: this.projectinput.description,
                    industry: this.projectinput.industry,
                    engagement_date: this.projectinput.engagement_date,
                    engagement_duration: this.projectinput.engagement_duration,
                    country: this.projectinput.country,
                    business_problem: this.projectinput.business_problem,
                    drivers: this.projectinput.drivers,
                    outcome: this.projectinput.outcome,
                    solution: this.projectinput.solution,
                    solution_explanation: this.projectinput.solution_explanation,
                    people_resource: this.projectinput.people_resource,
                    contacts: this.projectinput.contacts,
                    links: this.projectinput.links,
                    metrics: this.projectinput.metrics,
                    customer_id: this.projectinput.customer_id,
                    consultant_ids: []
                },
                project_id: this.projectinput.id,
                editDialog: false,
                customers: this.customerinput,
                consultants: this.consultantinput,
                loading: false,
                engagementDateMenu: true,
                utf8: '',
                authenticity_token: '',
                errors: []
            }
        },
        props: ['projectinput', 'customerinput', 'consultantinput', 'projectconsultants'],
        methods: {
            saveChanges() {
                this.loading = true
                this.$http.patch('/projects/' + this.project_id, {
                    utf8: this.utf8,
                    authenticity_token: this.authenticity_token,
                    project: this.project
                }).then(response => {
                    this.loading = false
                    this.editDialog = false
                    console.log(response)
                    Turbolinks.visit('/projects/' + this.project_id)
                }, response => {
                    this.loading = false
                    this.errors = JSON.parse(response.bodyText).errors
                    console.log(response)
                })
            }
        },
        created() {
            this.utf8 = document.getElementsByName('utf8')[0].getAttribute('value')
            this.authenticity_token = document.getElementsByName('authenticity_token')[0].getAttribute('value')
            for(var i=0; i < this.projectconsultants.length; i++) {
                this.project.consultant_ids.push(this.projectconsultants[i].id)
            }
            console.log('project edit created')
        }
    }
</script>