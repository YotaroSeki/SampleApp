<template>
    <div class='stats'>
        <a v-if='stats.following' :href='stats.following.link'>
            <strong id='following' class='stat'>
                {{stats.following.count}}
            </strong>
            following
        </a>
        <a v-if='stats.followers' :href='stats.followers.link'>
            <strong id='followers' class='stat'>
                {{stats.followers.count}}
            </strong>
            followers
        </a>
        <a v-if='stats.favorites' :href='stats.favorites.link'>
            <strong id='favorites' class='stat'>
                {{stats.favorites.count}}
            </strong>
            favorites
        </a>
    </div>
</template>

<script type="text/javascript">
export default {
    name: 'Stats',
    props: ['stats']
}
</script>
