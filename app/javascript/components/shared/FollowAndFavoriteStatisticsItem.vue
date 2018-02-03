<template>
    <div>
        <a v-if='statistics'
           :href='statistics.path'>
            <strong :id='statistics.type'
                    class='stat'>
                {{ statistics.count }}
            </strong>
            {{ statistics.type }}
        </a>
    </div>
</template>

<script type='text/javascript'>
export default {
    name: 'FollowAndFavoriteStatisticsItem',
    props: {
        'statistics': {
            type: Object
        }
    }
}
</script>
