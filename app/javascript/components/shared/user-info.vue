<template>
    <section class='user_info'>
        <img v-if='user_info.user_icon' :src='user_info.user_icon.url'/>
        <h1>{{user_info.user.name}}</h1>
        <span>
            <a :href='user_info.profile.link'>view my profile</a>
        </span>
        <span>
            <b>Microposts:</b>
            {{user_info.profile.microposts}}
        </span>
    </section>
</template>

<script type='text/javascript'>
export default {
    name: 'UserInfo',
    props: ['user_info']
}
</script>
