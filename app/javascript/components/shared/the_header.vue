<template>
    <el-menu mode='horizontal'
             background-color='#545c64'
             text-color='#fff'
             active-text-color='#ffd04b'
    >
        <el-row>
            <el-col :span='4' :offset='1'>
                <a href='/' class='logo'>sample app</a>
            </el-col>
            <el-col :span='1' :offset='13'>
                <el-menu-item index='1'>
                    <a href='/'>Home</a>
                </el-menu-item>
            </el-col>
            <el-col :span='1'>
                <el-menu-item index='2'>
                    <a href='/help'>Help</a>
                </el-menu-item>
            </el-col>
            <div v-if='is_logged_in'>
                <el-col :span='1'>
                    <el-menu-item index='3'>
                        <a href='/users'>Users</a>
                    </el-menu-item>
                </el-col>
                <el-col :span='2'>
                    <el-submenu index='4'>
                        <div slot='title'>
                            Account <b class='caret'></b>
                        </div>
                        <el-menu-item index='4-1'>
                            <a :href='paths.current_user'>
                                Profile
                            </a>
                        </el-menu-item>
                        <el-menu-item index='4-2'>
                            <a :href='paths.edit'>
                                Settings
                            </a>
                        </el-menu-item>
                        <el-menu-item index='4-3'>
                            <form method='post' action='/logout'>
                                <input type='hidden' name='_method' value='DELETE'>
                                <input type='hidden' name='authenticity_token' :value='authenticity_token'>
                                <input type='submit' value='logout'>
                            </form>
                        </el-menu-item>
                    </el-submenu>
                </el-col>
            </div>
            <div v-else>
                <el-col :span='3'>
                    <el-menu-item index='4'>
                        <a href='/login'>
                            Login
                        </a>
                    </el-menu-item>
                </el-col>
            </div>
        </el-row>
    </el-menu>
</template>

<script type='text/javascript'>
export default {
    name: 'TheHeader',
    data() {
        return {
            paths: {},
            authenticity_token: '',
            is_logged_in: false
        }
    },
    mounted: function () {
        this.axios.get('/users/navbar.jsonld')
            .then((response) => {
                this.paths = response.data.paths;
                this.authenticity_token = response.data.authenticity_token
                this.is_logged_in = response.data.is_logged_in
            });
    }
}
</script>
