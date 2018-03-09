<template>
    <div class='favorite-cancel-form'>
        <button @click=cancel_favorite>
        cancel favorite
        </button>
    </div>
</template>

<script type='text/javascript'>
export default {
    name: 'FavoriteCancelForm',
    props: {
        micropost: Object,
        index: Number
    },
    methods: {
        cancel_favorite() {
            this.axios.delete(this.micropost.favorite_path)
                .then((res) => {
                    this.$notify({
                        title: 'Success',
                        message: 'favorite canceled!',
                        type: 'success'
                    });
                    this.$emit('favorite-canceled', this.index)
                })
                .catch((error)  => {
                    console.log(error);
                });
        }
    }
}
</script>
