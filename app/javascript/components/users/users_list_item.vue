<template>
    <li>
        <img :src='user.img_url'/>
        <a :href='user.link'>
            {{user.name}}
        </a>
        <form v-if='current_user.admin' method='post' :action='user.link'>
            <input type='hidden' name='_method' value='DELETE'>
            <input type='hidden' name='authenticity_token' :value='user.authenticity_token'>
            <input type='submit' value='delete'>
        </form>
    </li>
</template>

<script type='text/javascript'>
export default {
    name: 'UsersListItem',
    props: ['user', 'current_user']
}
</script>
