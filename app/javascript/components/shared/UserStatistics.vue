<template>
    <div class='stats'>
        <UserStatistics-item :statistics='following'/>
        <UserStatisticsItem :statistics='followers'/>
        <UserStatisticsItem :statistics='favorites'/>
    </div>
</template>

<script type='text/javascript'>
import UserStatisticsItem from './UserStatisticsItem.vue'

export default {
    name: 'UserStatistics',
    components: {
        'UserStatisticsItem': UserStatisticsItem
    },
    props: {
        'following': {type: Object},
        'followers': {type: Object},
        'favorites': {type: Object}
    }
}
</script>
