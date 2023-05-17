<template>
	<view class="p-2">
		<view style="background-color: #F5F5F1;color: #928E8A;" class="flex align-center justify-center py-2 rounded" @click="open">
			<uni-icons color="#928E8A" type="search" size="20"></uni-icons>
			<text class="ml-2">{{ placeholder }}</text>
		</view>
	</view>
</template>

<script>
	export default {
		name:"f-search-bar",
		props: {
			placeholder: {
				type: String,
				default: '请输入搜索内容'
			},
		},
		data() {
			return {
				
			};
		},
		methods:{
			open(){
				uni.navigateTo({
					url: '/pages/search/search',
				});
			}
		}
	}
</script>

<style>

</style>
