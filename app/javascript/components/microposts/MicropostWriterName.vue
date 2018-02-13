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
        writer_link: {type: String},
        writer_name: {type: String}
    }
}
</script>
