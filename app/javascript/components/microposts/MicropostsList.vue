<template>
    <ul class='users favorites'>
        <MicropostsListItem
        @remove-micropost-from-list='remove_micropost_at'
        @favorite-canceled='favorite_canceled_at'
        @favorite-succeed='favorite_succeed_at'
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
        'current_user': Object,
        'microposts': Array
    },
    methods: {
        remove_micropost_at(id) {
            this.microposts.splice(id, 1, {});
        },
        favorite_canceled_at(id) {
            this.microposts[id].liked = false;
        },
        favorite_succeed_at(id) {
            this.microposts[id].liked = true;
        }
    }
}
</script>
