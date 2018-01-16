<template>
    <el-menu mode='horizontal'
             background-color='#545c64'
             text-color='#fff'
             active-text-color='#ffd04b'
    >
        <a :href='"/"' class='logo'>sample app</a>
        <nav>
            <ul class='nav navbar-nav navbar-right'>
                <el-menu-item index='1'>
                    <a :href='"/"'>Home</a>
                </el-menu-item>
                <el-menu-item index='2'>
                    <a :href='"/help"'>Help</a>
                </el-menu-item>
                <template v-if='is_logged_in'>
                    <el-menu-item index='3'>
                        <a :href='"/users"'>Users</a>
                    </el-menu-item>
                    <el-submenu index='4'>
                        <template slot='title'>
                            Account <b class='caret'></b>
                        </template>
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
                            <form method='post' :action='"/logout"'>
                                <input type='hidden' name='_method' value='DELETE'>
                                <input type='hidden' name='authenticity_token' :value='authenticity_token'>
                                <input type='submit' value='logout'>
                            </form>
                        </el-menu-item>
                    </el-submenu>
                </template>
                <template v-else>
                    <el-menu-item index='4'>
                        <a :href='"/login"'>
                            Login
                        </a>
                    </el-menu-item>
                </template>
            </ul>
        </nav>
    </el-menu>
</template>

<script type='text/javascript'>
export default {
    name: 'Navbar',
    data() {
        return {paths: {}, authenticity_token: '', is_logged_in: false}
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
