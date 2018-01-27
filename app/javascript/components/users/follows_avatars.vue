<template>
    <div class='user_avatars'>
        <a v-for='user in follows' :href='user.link'>
            <img :src='user.img_url'/>
        </a>
        and so on
    </div>
</template>

<script type='text/javascript'>
export default {
    name: 'FollowsAvatars',
    props: ['follows']
}
</script>
