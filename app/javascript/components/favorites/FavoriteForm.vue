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
            this.axios.delete(this.micropost.cancel_favorite_path)
                .then(() => {
                    this.$notify({
                        title: 'Success',
                        message: 'favorite canceled!',
                        type: 'success'
                    })
                })
                .catch(function (error) {
                });
        }
    }
}
</script>
