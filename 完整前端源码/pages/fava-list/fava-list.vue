<template>
	<view>
		<uni-swipe-action>
		<view v-for="(item,index) in list" :key="index">
			<uni-swipe-action-item :right-options="options" @click="onClick(item)">
			   <course-list type="one" :item="item.goods"></course-list>
			</uni-swipe-action-item>
		</view>
		</uni-swipe-action>
		<uni-load-more :status="loadStatus"></uni-load-more>
		
	</view>
</template>

<script>
	export default {
		data() {
			return {
				loadStatus:"loading",
				page:1,
				limit:10,
				list:[],
				options:[{
					text: '取消收藏',
					style: {
						backgroundColor: '#dd524d'
					}
				}]
			}
		},
		created() {
			this.getData()
		},
		onPullDownRefresh() {
			this.page = 1
			this.getData().finally(()=>{
				uni.stopPullDownRefresh()
			})
		},
		onReachBottom() {
			this.handleLoadMore()
		},
		methods: {
			onClick(item){
				uni.showLoading({
					title: '操作中...',
					mask: false
				});
				
				this.$api.uncollect({
					goods_id:item.goods.id,
					type:item.type
				}).then(res=>{
					this.$toast('取消收藏成功')
					this.page = 1
					this.getData()
				}).finally(()=>{
					uni.hideLoading()
				})
			},
			handleLoadMore(){
				if(this.loadStatus != 'more'){
					return
				}
				this.page = this.page + 1
				this.getData()
			},
			getData(){
				let page = this.page
				return this.$api.getMyFavaList({
					page:this.page,
					limit:this.limit
				}).then(res=>{
					console.log(res);
					this.list = page == 1 ? res.rows : [...this.list,...res.rows]
					this.loadStatus = res.rows.length < this.limit ? 'noMore' : 'more'
				}).catch(err=>{
					this.loadStatus = 'more'
					if(page > 1){
						this.page = this.page - 1
					}
				})
			}
		}
	}
</script>

<style>

</style>
