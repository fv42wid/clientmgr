<template>
    <v-snackbar :info="true"
                :right="true"
                v-model="show"
                :timeout="timeout">
        {{ message }}
        <v-btn dark flat @click="show = false">Close</v-btn>
    </v-snackbar>
</template>

<script>
    export default {
        data: function() {
            return {
                timeout: 6000,
                x: 'right',
                show: false
            }
        },
        props: ['message', 'snackbar'],
        created: function() {
            console.log('snackbar create')
        },
        mounted: function() {
            this.show = true
        }
    }
</script>