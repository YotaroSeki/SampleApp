<template>
    <ul class='users follow'>
        <users-list-item v-for='user in users'
                         :user='user'
                         :current_user='current_user'
                         :key='user.id'/>
    </ul>
</template>

<script type='text/javascript'>
import UsersListItem from './UsersListItem.vue'

export default {
    name: 'UsersList',
    props: {
        'users': {type: Array},
        'current_user': {type: Object}
    },
    components: {'UsersListItem': UsersListItem}
}
</script>
