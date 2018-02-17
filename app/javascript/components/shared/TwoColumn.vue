<template>
    <div class='row'>
        <ElAside class='col-md-4'>
            <slot name='aside'/>
        </ElAside>
        <div class='col-md-8'>
            <slot name='main-contents'/>
        </div>
    </div>
</template>

<script type='text/javascript'>
export default {
    name: 'TwoColumn'
}
</script>
