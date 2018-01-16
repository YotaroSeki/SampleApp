<template>
    <div class='user_avatars'>
        <a v-for='user in users' :href='user.link'>
            <img :src='user.img_url'/>
        </a>
        and so on
    </div>
</template>

<script type='text/javascript'>
export default {
    name: 'UserAvatars',
    props: ['users']
}
</script>
