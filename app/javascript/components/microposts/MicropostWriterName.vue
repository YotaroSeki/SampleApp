<template>
    <span class='user'>
            <a :href='writer_link'>
                {{ writer_name }}
            </a>
    </span>
</template>

<script type='text/javascript'>
export default {
    name: 'MicropostWriterName',
    props: {
        writer_link: String,
        writer_name: String
    }
}
</script>
