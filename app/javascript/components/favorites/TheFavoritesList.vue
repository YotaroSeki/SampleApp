<template>
    <TwoColumn>
        <div slot='aside'>
            <UserProfile :profile='profile'/>
            <section class='stats'>
                <UserStatistics :following='statistics.following'
                                :followers='statistics.followers'
                                :favorites='statistics.favorites'/>
            </section>
        </div>
        <div slot='main-contents'>
            <h3>
                {{ profile.title }}
                <div v-if='current_page !== 0'>({{ current_page + 1 }} page)</div>
            </h3>
            <MicropostsList v-if='favorites_list && profile.favorites_count !== 0'
                            :current_user='profile.current_user'
                            :microposts='favorites_list[current_page]'/>
            <el-pagination
            @current-change='handleCurrentChange'
            background
            layout='prev, pager, next'
            :total='profile.favorites_count'
            :page-size='30'/>
        </div>
    </TwoColumn>
</template>

<script type='text/javascript'>
import TwoColumn from '../shared/TwoColumn.vue';
import MicropostsList from '../microposts/MicropostsList.vue';
import UserProfile from '../shared/UserProfile.vue';
import UserStatistics from '../shared/UserStatistics.vue';

export default {
    name: 'TheFavoritesList',
    components: {
        'TwoColumn': TwoColumn,
        'MicropostsList': MicropostsList,
        'UserProfile': UserProfile,
        'UserStatistics': UserStatistics
    },
    data() {
        return {
            current_page: 0,
            favorites_list: [],
            profile: {
                current_user: {}
            },
            statistics: {}
        }
    },
    mounted: function () {
        this.axios.get(location.href + '.jsonld')
            .then((response) => {
                this.favorites_list = response.data.favorites;
                this.profile = response.data.profile;
                this.statistics = response.data.statistics;
            });
    },
    methods: {
        handleCurrentChange(val) {
            this.current_page = val - 1;
        }
    }
}
</script>
