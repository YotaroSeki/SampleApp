<template>
    <span class='timestamp'>
            Posted {{ timestamp }} ago.
    </span>
</template>

<script type='text/javascript'>
export default {
    name: 'MicropostTimestamp',
    props: {
        timestamp: String
    }
}
</script>
