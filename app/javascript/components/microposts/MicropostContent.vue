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
        content: {type: String},
        picture_url: {type: String}
    }
}
</script>
