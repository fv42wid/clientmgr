<template>
    <v-layout row>
        <v-flex xs12>
            <v-card>
                <v-toolbar class="primary">
                    <v-toolbar-title class="white--text">AWS Accounts</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <awsaccount-new :projectid="project_id"></awsaccount-new>
                </v-toolbar>
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