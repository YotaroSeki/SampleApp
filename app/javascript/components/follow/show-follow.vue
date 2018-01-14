<template>
    <div class='row'>
        <el-aside class='col-md-4'>
            <user-info :user_info='user_info'>
            </user-info>
            <section class='stats'>
                <stats :stats='stats'>
                </stats>
                <user-avatars v-if='user_info.count !== 0'
                              :users='follows'>
                </user-avatars>
            </section>
        </el-aside>
        <div class='col-md-8'>
            <h3>
                {{user_info.title}}
                <template v-if='current_page !== 1'>({{current_page}} page)</template>
            </h3>
            <users v-if='follows && user_info.count !== 0' :users='follows[current_page]'
                   :current_user='user_info.user'>
            </users>
            <el-pagination
            @size-change='handleSizeChange'
            @current-change='handleCurrentChange'
            background
            layout='prev, pager, next'
            :total='user_info.count'
            :page-size='30'/>
        </div>
    </div>
</template>

<script type='text/javascript'>
import Stats from '../shared/stats.vue';
import UserAvatars from '../users/user-avatars.vue';
import UserInfo from '../shared/user-info.vue';
import Users from '../users/users.vue';


export default {
    name: 'Follow',
    components: {
        'Stats': Stats,
        'UserAvatars': UserAvatars,
        'UserInfo': UserInfo,
        'Users': Users
    },
    data() {
        return {follows: {}, stats: {}, user_info: {user_icon: {}, user: {}, profile: {}, count: 0}, current_page: 1}
    },
    mounted: function () {
        this.axios.get(location.href + '.jsonld')
            .then((response) => {
                this.follows = response.data.members;
                this.user_info = response.data.user_info;
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
