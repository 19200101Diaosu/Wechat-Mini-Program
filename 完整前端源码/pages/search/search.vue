<template>
	<view>
		
		<!-- #ifdef MP -->
		<search-bar v-model="keyword" @confirm="handleSearchEvent()"></search-bar>
		<!-- #endif -->
		
		<view v-if="list.length">
			<view class="flex align-center justify-between py-3 px-2">
				<text class="font-md font-weight-bold">历史记录</text>
				<text class="font-sm text-light-muted" @click="clear">清除全部</text>
			</view>
			
			<view class="flex flex-wrap px-2" style="margin-right: -30rpx;">
				<uni-badge :text="item" size="normal" v-for="(item,index) in list" style="margin-right: 25rpx;margin-bottom: 25rpx;" @click="handleSearchEvent(item)"></uni-badge>
			</view>
		</view>
		
	</view>
</template>

<script>
	export default {
		data() {
			return {
				list:[],
				keyword:""
			}
		},
		onNavigationBarSearchInputChanged(e) {
			this.keyword = e.text
		},
		onNavigationBarButtonTap() {
			this.handleSearchEvent()
		},
		onNavigationBarSearchInputConfirmed() {
			this.handleSearchEvent()
		},
		onLoad() {
			let list = uni.getStorageSync('historyKeyword')
			if(list){
				this.list = JSON.parse(list)
			}
		},
		methods: {
			// 搜索
			handleSearchEvent(value = ''){
				if(value){
					this.keyword = value
				}
				if(this.keyword == ''){
					return this.$toast('请输入关键词')
				}
				// 跳转到搜索结果页
				uni.navigateTo({
					url: '../search-result/search-result?keyword='+this.keyword,
				});
				// 加入到历史记录
				this.addHistory()
			},
			addHistory(){
				let index = this.list.findIndex(v=>v == this.keyword)
				if(index != -1){
					this.objToFirst(this.list,index)
				} else {
					this.list.unshift(this.keyword)
				}
				uni.setStorageSync('historyKeyword',JSON.stringify(this.list))
			},
			clear(){
				uni.showModal({
					content: '是否要清除搜索记录？',
					success: (res)=> {
						if (res.confirm) {
							this.list = []
							uni.removeStorageSync('historyKeyword')
						}
					}
				});
			},
			// 置顶数组某一项
			objToFirst(arr,index){
				if(index != 0){
					arr.unshift(arr.splice(index,1)[0])
				}
				return arr
			}
		}
	}
</script>

<style>

</style>
