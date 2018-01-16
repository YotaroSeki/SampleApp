<template>
    <ul class='users follow'>
        <user v-for='user in users' :user='user' :current_user='current_user' :key='user.id'>
        </user>
    </ul>
</template>

<script type='text/javascript'>
import User from './user.vue'

export default {
    name: 'UsersList',
    props: ['users', 'current_user'],
    components: {'User': User}
}
</script>
