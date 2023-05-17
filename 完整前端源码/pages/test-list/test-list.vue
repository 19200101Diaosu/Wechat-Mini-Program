<template>
	<view>
		
		<view v-for="(item,index) in list" :key="index">
			<uni-card isFull note="true">
				<view class="flex justify-between">
					<text class="h4 font-weight-bold">{{ item.title }}</text>
					<text class="text-danger font-sm">时长：{{ item.expire }}分钟</text>
				</view>
				<view class="flex my-3">
					<text class="flex-1">题目总数：{{ item.question_count }}</text>
					<text class="flex-1">总分数：{{ item.total_score }}</text>
					<text class="flex-1">及格分：{{ item.pass_score }}</text>
				</view>
				<view slot="footer" class="flex justify-end">
					<main-button :disabled="item.is_test" bClass="px-2" bStyle="height:80rpx;" @click="startTest(item.id)">{{ item.is_test ? '你考过了' : '参加考试' }}</main-button>
				</view>
			</uni-card>
			<view class="divider"></view>
		</view>
		
		<uni-load-more :status="loadStatus"></uni-load-more>
		
	</view>
</template>

<script>
	export default {
		data() {
			return {
				loadStatus:"loading",
				page:1,
				limit:5,
				list:[]
			}
		},
		created() {
			this.getData()
			uni.$on('refreshTestList',this.refresh)
		},
		destroyed() {
			uni.$off('refreshTestList',this.refresh)
		},
		onPullDownRefresh() {
			this.refresh()
		},
		onReachBottom() {
			this.handleLoadMore()
		},
		methods: {
			refresh(){
				this.page = 1
				this.getData().finally(()=>{
					uni.stopPullDownRefresh()
				})
			},
			startTest(id){
				uni.showModal({
					content: '是否要开始考试？',
					success: (res) =>{
						if (res.cancel) {
							return
						}
						this.authJump('../test-detail/test-detail?id='+id)
					}
				});
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
				return this.$api.getTestList({
					page:this.page,
					limit:this.limit
				}).then(res=>{
					console.log(res);
					this.list = page == 1 ? res.rows : [...this.list,...res.rows],
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
