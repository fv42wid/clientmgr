<template>
    <v-layout row>
        <v-flex xs12>
            <v-card>
                <v-toolbar class="primary">
                    <v-toolbar-title class="white--text">AWS Accounts</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <awsaccount-new :projectid="project_id"></awsaccount-new>
                </v-toolbar>
                <v-list>
                    <v-list-tile v-for="awsaccount in aws_accounts" :key="awsaccount.account_id">
                        <v-list-tile-content>
                            <v-list-tile-title>
                                ID: {{ awsaccount.account_id }}
                            </v-list-tile-title>
                            <v-list-tile-sub-title>
                                Estimated Spend: {{ awsaccount.estimated_spend }}
                            </v-list-tile-sub-title>
                        </v-list-tile-content>
                    </v-list-tile>
                </v-list>
            </v-card>
        </v-flex>
    </v-layout>
</template>

<script>
    import AwsAccountNew from './awsaccount-new.vue'

    export default {
        data() {
            return {
                aws_accounts: this.awsaccountlist,
                project_id: this.projectid
            }
        },
        props: ['awsaccountlist', 'projectid'],
        created() {
            console.log('awsaccount created')
        },
        components: {
            'awsaccount-new' : AwsAccountNew
        }
    }
</script>