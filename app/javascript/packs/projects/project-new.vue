<template>
    <form @submit.prevent="createProject">
        <v-layout row v-for="(error, index) in errors">
            <v-flex xs12 sm6>
                <v-alert error dismissible :value="true" @input="onDismiss(index)">{{ error }}</v-alert>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="title"
                              label="Title"
                              v-model="project.title"
                              :disabled="loading"
                              required></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="description"
                              label="Project Description"
                              v-model="project.description"
                              :disabled="loading"
                              multi-line
                              required></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="industry"
                              label="Industry"
                              v-model="project.industry"
                              :disabled="loading"
                              required></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
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
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="engagement_duration"
                              label="Duration"
                              v-model="project.engagement_duration"
                              :disabled="loading"
                              suffix="days"
                              type="number"
                              required></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="country"
                              label="Country"
                              v-model="project.country"
                              :disabled="loading"
                              required></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="business_problem"
                              label="Business Problem"
                              v-model="project.business_problem"
                              :disabled="loading"
                              multi-line
                              required></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="drivers"
                              label="Drivers"
                              v-model="project.drivers"
                              :disabled="loading"
                              multi-line
                              required></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="outcome"
                              label="Outcome"
                              v-model="project.outcome"
                              multi-line></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="solution"
                              label="Solution"
                              v-model="project.solution"
                              multi-line></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="solution_explanation"
                              label="Solution Explanation"
                              v-model="project.solution_explanation"
                              multi-line></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="people_resources"
                              label="People and Resources"
                              v-model="project.people_resources"
                              multi-line></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="contacts"
                              label="Who Can I Contact?"
                              v-model="project.contacts"
                              multi-line></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="links"
                              label="Links"
                              v-model="project.links"
                              multi-line></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs12 sm6>
                <v-text-field name="metrics"
                              label="Metrics"
                              v-model="project.metrics"
                              multi-line></v-text-field>
            </v-flex>
        </v-layout>
        <v-layout row>
            <v-flex xs3 offset-xs9 sm6 offset-sm3>
                <v-btn primary type="submit">Create Project</v-btn>
            </v-flex>
        </v-layout>
    </form>
</template>

<script>
    export default {
        data() {
            return {
                project: {
                    title: '',
                    description: '',
                    industry: '',
                    engagement_date: '',
                    engagement_duration: '',
                    country: '',
                    business_problem: '',
                    drivers: '',
                    outcome: '',
                    solution: '',
                    solution_explanation: '',
                    people_resources: '',
                    contacts: '',
                    links: '',
                    metrics: '',
                    customer_id: null
                },
                errors: [],
                loading: false,
                engagementDateMenu: true
            }
        },
        methods: {
            createProject() {

            }
        },
        created: function() {
            console.log('new project created')
        }
    }
</script>