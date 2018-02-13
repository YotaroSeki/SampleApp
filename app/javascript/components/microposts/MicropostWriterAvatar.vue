<template>
    <a :href='writer_link'>
        <img :src='avatar_url'/>
    </a>
</template>

<script>
export default {
    name: 'MicropostWriterAvatar',
    props: {
        writer_link: {type: String},
        avatar_url: {type: String}
    }
}
</script>
