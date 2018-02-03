<template>
    <div class='stats'>
        <follow-and-favorite-statistics-item :statistics='following'>
        </follow-and-favorite-statistics-item>
        <follow-and-favorite-statistics-item :statistics='followers'>
        </follow-and-favorite-statistics-item>
        <follow-and-favorite-statistics-item :statistics='favorites'>
        </follow-and-favorite-statistics-item>
    </div>
</template>

<script type='text/javascript'>
import FollowAndFavoriteStatisticsItem from './FollowAndFavoriteStatisticsItem.vue'

export default {
    name: 'FollowAndFavoriteStatistics',
    props: {
        'following': {type: Object},
        'followers': {type: Object},
        'favorites': {type: Object}
        },
    components: {
        'FollowAndFavoriteStatisticsItem': FollowAndFavoriteStatisticsItem
    }
}
</script>
