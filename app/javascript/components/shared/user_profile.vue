<template>
    <section class='user_info'>
        <img :src='profile.user_icon'/>
        <h1>{{profile.current_user.name}}</h1>
        <span>
            <a :href='profile.user_path'>view my profile</a>
        </span>
        <span>
            <b>Microposts:</b>
            {{profile.micropost_count}}
        </span>
    </section>
</template>

<script type='text/javascript'>
export default {
    name: 'UserProfile',
    props: ['profile']
}
</script>
