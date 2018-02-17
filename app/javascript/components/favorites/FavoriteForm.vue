<template>
    <div>
        <button
        @click='favorite'>
            favorite
        </button>
    </div>
</template>

<script type='text/javascript'>
export default {
    name: 'FavoriteForm',
    props: {
        micropost: Object,
        index: Number
    },
    methods: {
        favorite() {
            this.axios.post(this.micropost.favorite_path)
                .then((res) => {
                    this.$notify({
                        title: 'Success',
                        message: 'favorite succeed!',
                        type: 'success'
                    });
                    this.$emit('favorite-succeed', this.index)
                })
                .catch((error) => {
                    console.log(error);
                });
        }
    }
}
</script>
