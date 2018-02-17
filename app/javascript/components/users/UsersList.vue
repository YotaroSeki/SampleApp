<template>
    <ul class='users follow'>
        <UsersListItem
        @user-deleted='remove_user_at'
        v-for='user in users'
        :user='user'
        :current_user='current_user'
        :key='user.id'/>
    </ul>
</template>

<script type='text/javascript'>
import UsersListItem from './UsersListItem.vue'

export default {
    name: 'UsersList',
    components: {'UsersListItem': UsersListItem},
    props: {
        'users': Array,
        'current_user': Object
    },
    methods: {
        remove_user_at(id) {
            this.users.splice(id, 1)
        }
    }
}
</script>
