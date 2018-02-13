<template>
    <ul class='users favorites'>
        <microposts-list-item v-for='micropost in microposts'
                              :current_user='current_user'
                              :micropost='micropost'
                              :key='micropost.id'/>
    </ul>
</template>

<script type='text/javascript'>
import MicropostsListItem from './MicropostsListItem.vue';

export default {
    name: 'MicropostsList',
    components: {
        'MicropostsListItem': MicropostsListItem
    },
    props: {
        'current_user': {type: Object},
        'microposts': {type: Array}
    }
}
</script>
