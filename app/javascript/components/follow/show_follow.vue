<template>
    <div class='row'>
        <el-aside class='col-md-4'>
            <user-profile :profile='profile'>
            </user-profile>
            <section class='stats'>
                <statistics :statistics='statistics'>
                </statistics>
                <follow-avatars v-if='profile.follow_count !== 0'
                                :follows='follows[current_page]'>
                </follow-avatars>
            </section>
        </el-aside>
        <div class='col-md-8'>
            <h3>
                {{profile.title}}
                <template v-if='current_page !== 0'>({{current_page + 1}} page)</template>
            </h3>
            <users-list v-if='follows && profile.follow_count !== 0' :users='follows[current_page]'
                        :current_user='profile.current_user'>
            </users-list>
            <el-pagination
            @size-change='handleSizeChange'
            @current-change='handleCurrentChange'
            background
            layout='prev, pager, next'
            :total='profile.follow_count'
            :page-size='30'/>
        </div>
    </div>
</template>

<script type='text/javascript'>
import Statistics from '../shared/statistics.vue';
import FollowAvatars from '../users/follow_avatars.vue';
import UserProfile from '../shared/user_profile.vue';
import UsersList from '../users/users_list.vue';


export default {
    name: 'FollowsList',
    components: {
        'Statistics': Statistics,
        'FollowAvatars': FollowAvatars,
        'UserProfile': UserProfile,
        'UsersList': UsersList
    },
    data() {
        return {
            follows: {},
            statistics: {},
            profile: {current_user: {}},
            current_page: 0
        }
    },
    mounted: function () {
        this.axios.get(location.href + '.jsonld')
            .then((response) => {
                this.follows = response.data.follows;
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
