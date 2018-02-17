<template>
    <div>
        <MicropostWriterAvatar
                :writer_link='writer_link'
                :avatar_url='avatar_url'/>
        <MicropostWriterName
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
        avatar_url: String,
        writer_link: String,
        writer_name: String
    }
}
</script>
