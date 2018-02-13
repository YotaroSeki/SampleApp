<template>
    <div class='row'>
        <el-aside class='col-md-4'>
            <slot name='aside'/>
        </el-aside>
        <div class='col-md-8'>
            <slot name='main-contents'/>
        </div>
    </div>
</template>

<script type='text/javascript'>
export default {
    name: 'PaageLayout'
}
</script>
