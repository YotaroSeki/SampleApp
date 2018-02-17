<template>
    <div>
        <div v-if='Object.keys(micropost).length === 0'/>
        <li v-else>
            <MicropostWriter :writer_link='micropost.writer_link'
                             :avatar_url='micropost.writer_avatar_url'
                             :writer_name='micropost.writer_name'/>
            <MicropostContent :content='micropost.content'
                              :picture_url='micropost.picture_url'/>
            <MicropostTimestamp :timestamp='micropost.timestamp'/>
            <FavoriteCancelForm v-if='micropost.liked'
            @favorite-canceled='favorite_canceled'
            :micropost='micropost'
            :index='index'/>
            <FavoriteForm v-else
            @favorite-succeed='favorite_succeed'
            :micropost='micropost'
            :index='index'/>
            <MicropostDeleteForm
            @micropost-deleted='remove_micropost_from_list'
            v-if='current_user.admin'
            :micropost_link='micropost.link'
            :index='index'/>
        </li>
    </div>
</template>

<script type='text/javascript'>
import FavoriteCancelForm from '../favorites/FavoriteCancelForm.vue';
import FavoriteForm from '../favorites/FavoriteForm.vue';
import MicropostContent from './MicropostContent.vue';
import MicropostDeleteForm from './MicropostDelleteForm.vue';
import MicropostTimestamp from './MicropostTimestamp.vue';
import MicropostWriter from './MicropostWriter.vue';

export default {
    name: 'MicropostsListItem',
    components: {
        'FavoriteCancelForm': FavoriteCancelForm,
        'FavoriteForm': FavoriteForm,
        'MicropostContent': MicropostContent,
        'MicropostDeleteForm': MicropostDeleteForm,
        'MicropostTimestamp': MicropostTimestamp,
        'MicropostWriter': MicropostWriter
    },
    props: {
        'current_user': Object,
        'micropost': Object,
        'index': Number
    },
    methods: {
        remove_micropost_from_list() {
            this.$emit('remove-micropost-from-list', this.index)
        },
        favorite_canceled() {
            this.$emit('favorite-canceled', this.index)
        },
        favorite_succeed() {
            this.$emit('favorite-succeed', this.index)
        }
    }
}
</script>
