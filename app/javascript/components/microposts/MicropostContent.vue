<template>
    <span class='content'>
            {{ content }}
            <img v-if='picture_url'
                 :src='picture_url'/>
        </span>
</template>

<script type='text/javascript'>
export default {
    name: 'MicropostContent',
    props: {
        content: String,
        picture_url: String
    }
}
</script>
