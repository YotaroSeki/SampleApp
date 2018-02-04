/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Vue from 'vue';
import Element from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css'
import locale from 'element-ui/lib/locale/lang/ja';
import axios from 'axios';
import VueAxios from 'vue-axios';

Vue.use(VueAxios, axios);
Vue.use(Element, {locale});

import TheHeader from '../components/shared/TheHeader.vue';
import TheAbout from '../components/static_pages/TheAbout.vue';
import TheContact from '../components/static_pages/TheContact.vue';
import TheFollowsList from '../components/follow/TheFollowsList.vue'
import TheHelp from '../components/static_pages/TheHelp.vue';

const container = new Vue({
    el: '.js-vue',
    components: {
        'TheHeader': TheHeader,
        'TheAbout': TheAbout,
        'TheContact': TheContact,
        'TheFollowsList': TheFollowsList,
        'TheHelp': TheHelp
    }
});
