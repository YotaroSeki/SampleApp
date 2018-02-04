<template>
    <div class='stats'>
        <user-statistics-item :statistics='following'/>
        <user-statistics-item :statistics='followers'/>
        <user-statistics-item :statistics='favorites'/>
    </div>
</template>

<script type='text/javascript'>
import UserStatisticsItem from './UserStatisticsItem.vue'

export default {
    name: 'UserStatistics',
    props: {
        'following': {type: Object},
        'followers': {type: Object},
        'favorites': {type: Object}
        },
    components: {
        'UserStatisticsItem': UserStatisticsItem
    }
}
</script>
