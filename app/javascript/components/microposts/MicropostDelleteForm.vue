<template>
    <div>
        <button
        @click=delete_micropost>
        delete micropost
    </button>
</div>
        </template>

<script type='text/javascript'>
export default {
    name: 'MicropostDeleteForm',
    props: {
        micropost_link: {
            type: String,
            required: true
        }
    },
    methods: {
        delete_micropost() {
            this.axios.delete(this.micropost_link)
                .then((response) => {
                    this.$notify({
                        title: 'Success',
                        message: 'micropost deleted!',
                        type: 'success'
                    });
                    this.$emit('deleted', 'popopo');
                })
                .catch(function (error) {
                    console.log(error)
                });
        }
    }
}
</script>
