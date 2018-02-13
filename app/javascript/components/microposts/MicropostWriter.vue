<template>
    <div>
        <micropost-writer-avatar
                :writer_link='writer_link'
                :avatar_url='avatar_url'/>
        <micropost-writer-name
                :writer_link='writer_link'
                :writer_name='writer_name'/>
    </div>
</template>

<script>
import MicropostWriterAvatar from './MicropostWriterAvatar.vue';
import MicropostWriterName from './MicropostWriterName.vue';

export default {
    name: 'MicropostWriter',
    components: {
        'MicropostWriterAvatar': MicropostWriterAvatar,
        'MicropostWriterName': MicropostWriterName
    },
    props: {
        avatar_url: {type: String},
        writer_link: {type: String},
        writer_name: {type: String}
    }
}
</script>
