<template>
    <div class='stats'>
        <a v-if='statistics.following' :href='statistics.following.path'>
            <strong id='following' class='stat'>
                {{statistics.following.count}}
            </strong>
            following
        </a>
        <a v-if='statistics.followers' :href='statistics.followers.path'>
            <strong id='followers' class='stat'>
                {{statistics.followers.count}}
            </strong>
            followers
        </a>
        <a v-if='statistics.favorites' :href='statistics.favorites.path'>
            <strong id='favorites' class='stat'>
                {{statistics.favorites.count}}
            </strong>
            favorites
        </a>
    </div>
</template>

<script type='text/javascript'>
export default {
    name: 'Statistics',
    props: ['statistics']
}
</script>
