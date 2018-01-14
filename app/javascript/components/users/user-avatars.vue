<template>
    <div class='user_avatars'>
        <template v-for='page in users'>
            <a v-for='user in page' :href='user.link'>
                <img :src='user.img_url'/>
            </a>
        </template>
    </div>
</template>

<script type='text/javascript'>
export default {
    name: 'UserAvatars',
    props: ['users']
}
</script>
