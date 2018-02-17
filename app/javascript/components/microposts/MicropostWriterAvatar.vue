<template>
    <a :href='writer_link'>
        <img :src='avatar_url'/>
    </a>
</template>

<script>
export default {
    name: 'MicropostWriterAvatar',
    props: {
        writer_link: String,
        avatar_url: String
    }
}
</script>
