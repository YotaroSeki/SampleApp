<template>
    <button
    @click=cancel_favorite>
    cancel favorite
</button>
        </template>

<script type='text/javascript'>
export default {
    name: 'FavoriteForm',
    props: {
        micropost: {type: Object}
    },
    methods: {
        cancel_favorite() {
            console.log('po')
            this.axios.delete(this.micropost.cancel_favorite_path)
                .then()
                .catch(function (error) {
                })
            console.log('meu')
        }
    }
}
</script>
