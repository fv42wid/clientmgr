/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> and
// <%= stylesheet_pack_tag 'hello_vue' %> to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue/dist/vue.esm'
import Vuetify from 'vuetify'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'

import SuccessMessage from './layout/success-message.vue'
import UserSignup from './users/user-signup.vue'
import UserSignin from './users/user-signin.vue'
import CustomerIndex from './customers/customer-index.vue'
import CustomerNew from './customers/customer-new.vue'
import CustomerEdit from './customers/customer-edit.vue'
import ProjectNew from './projects/project-new.vue'
import ProjectIndex from './projects/project-index.vue'

Vue.use(VueResource)
Vue.use(TurbolinksAdapter)
Vue.use(Vuetify)

document.addEventListener('turbolinks:load', () => {

  var app = new Vue({
      el: 'v-app',
      data: {
          success: []
      },
      methods: {
          addSuccess: function(message) {
              this.success.push(message)
          }
      },
      created: function() {
          //if(document.getElementById())

          console.log('main created')
      },
      mounted: function() {
          if(document.getElementById('flash_div').getAttribute('data-flash') !== null) {
              this.success.push(document.getElementById('flash_div').getAttribute('data-flash'))
          }
      },
      components: {
          'success-message' : SuccessMessage,
          'user-signup' : UserSignup,
          'user-signin' : UserSignin,
          'customer-index' : CustomerIndex,
          'customer-new' : CustomerNew,
          'customer-edit' : CustomerEdit,
          'project-new' : ProjectNew,
          'project-index' : ProjectIndex
      }
  })
})
