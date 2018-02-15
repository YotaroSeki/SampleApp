<template>
    <ul class='users favorites'>
        <microposts-list-item
        @micropost-deleted='delete_micropost_at'
        v-for='micropost in microposts'
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
    },
    methods: {
        delete_micropost_at(id) {
            this.microposts.splice(id, 1)
        }
    }
}
</script>
