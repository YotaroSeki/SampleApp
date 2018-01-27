<template>
    <ul class='users follow'>
        <users-list-item v-for='user in users' :user='user' :current_user='current_user' :key='user.id'>
        </users-list-item>
    </ul>
</template>

<script type='text/javascript'>
import User from './users_list_item.vue'

export default {
    name: 'UsersList',
    props: ['users', 'current_user'],
    components: {'UsersListItem': UsersListItem}
}
</script>
