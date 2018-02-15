<template>
    <li>
        <micropost-writer :writer_link='micropost.writer_link'
                          :avatar_url='micropost.writer_avatar_url'
                          :writer_name='micropost.writer_name'/>
        <micropost-content :content='micropost.content'
                           :picture_url='micropost.picture_url'/>
        <micropost-timestamp :timestamp='micropost.timestamp'/>
        <favorite-form :micropost='micropost'/>
        <micropost-delete-form
        @micropost-deleted='micropost_deleted'
        v-if='current_user.admin'
        :micropost_link='micropost.link'
        />
    </li>
</template>

<script type='text/javascript'>
import FavoriteForm from '../favorites/FavoriteForm.vue';
import MicropostContent from './MicropostContent.vue';
import MicropostDeleteForm from './MicropostDelleteForm.vue';
import MicropostTimestamp from './MicropostTimestamp.vue';
import MicropostWriter from './MicropostWriter.vue';

export default {
    name: 'MicropostsListItem',
    props: {
        'current_user': {type: Object},
        'micropost': {type: Object}
    },
    components: {
        'FavoriteForm': FavoriteForm,
        'MicropostContent': MicropostContent,
        'MicropostDeleteForm': MicropostDeleteForm,
        'MicropostTimestamp': MicropostTimestamp,
        'MicropostWriter': MicropostWriter
    },
    methods: {
        micropost_deleted() {
            this.$emit('micropost-deleted', this.micropost.id)
        }
    }
}
</script>
