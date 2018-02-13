<template>
    <page-layout>
        <div slot='aside'>
            <user-profile :profile='profile'/>
            <section class='stats'>
                <user-statistics :following='statistics.following'
                                 :followers='statistics.followers'
                                 :favorites='statistics.favorites'/>
                <follow-avatars v-if='profile.follow_count !== 0'
                                :follows='follows_list[current_page]'/>
            </section>
        </div>
        <div slot='main-contents'>
            <h3>
                {{ profile.title }}
                <div v-if='current_page !== 0'>({{ current_page + 1 }} page)</div>
            </h3>
            <users-list v-if='follows_list && profile.follow_count !== 0'
                        :users='follows_list[current_page]'
                        :current_user='profile.current_user'/>
            <el-pagination
            @size-change='handleSizeChange'
            @current-change='handleCurrentChange'
            background
            layout='prev, pager, next'
            :total='profile.follow_count'
            :page-size='30'/>
        </div>
    </page-layout>
</template>

<script type='text/javascript'>
import PageLayout from '../shared/PageLayout.vue';
import UserStatistics from '../shared/UserStatistics.vue';
import FollowAvatars from '../users/FollowAvatars.vue';
import UserProfile from '../shared/UserProfile.vue';
import UsersList from '../users/UsersList.vue';


export default {
    name: 'TheFollowsList',
    components: {
        'PageLayout': PageLayout,
        'UserStatistics': UserStatistics,
        'FollowAvatars': FollowAvatars,
        'UserProfile': UserProfile,
        'UsersList': UsersList
    },
    data() {
        return {
            follows_list: {},
            statistics: {},
            profile: {
                current_user: {}
            },
            current_page: 0
        }
    },
    mounted: function () {
        this.axios.get(location.href + '.jsonld')
            .then((response) => {
                this.follows_list = response.data.follows;
                this.profile = response.data.profile;
                this.statistics = response.data.statistics;
            });
    },
    methods: {
        handleCurrentChange(val) {
            this.current_page = val - 1;
        },
        handleSizeChange(val) {
        }
    },
}
</script>
