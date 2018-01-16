<template>
    <div class='row'>
        <el-aside class='col-md-4'>
            <user-info :profile='profile'>
            </user-info>
            <section class='stats'>
                <stats :stats='stats'>
                </stats>
                <user-avatars v-if='profile.follow_count !== 0'
                              :users='follows[1]'>
                </user-avatars>
            </section>
        </el-aside>
        <div class='col-md-8'>
            <h3>
                {{profile.title}}
                <template v-if='current_page !== 1'>({{current_page}} page)</template>
            </h3>
            <users-list v-if='follows && profile.follow_count !== 0' :users='follows[current_page]'
                        :current_user='profile.user'>
            </users-list>
            <el-pagination
            @size-change='handleSizeChange'
            @current-change='handleCurrentChange'
            background
            layout='prev, pager, next'
            :total='profile.count'
            :page-size='30'/>
        </div>
    </div>
</template>

<script type='text/javascript'>
import Stats from '../shared/stats.vue';
import UserAvatars from '../users/user_avatars.vue';
import UserInfo from '../shared/user_info.vue';
import UsersList from '../users/users_list.vue';


export default {
    name: 'Follow',
    components: {
        'Stats': Stats,
        'UserAvatars': UserAvatars,
        'UserInfo': UserInfo,
        'UsersList': UsersList
    },
    data() {
        return {follows: {}, stats: {}, profile: {user: {}}, current_page: 1}
    },
    mounted: function () {
        this.axios.get(location.href + '.jsonld')
            .then((response) => {
                this.follows = response.data.follows;
                this.profile = response.data.profile;
                this.stats = response.data.stats
            });
    },
    methods: {
        handleSizeChange(val) {
            console.log(`${val} items per page`);
        },
        handleCurrentChange(val) {
            this.current_page = val
        }
    },
}
</script>
