<template>
	<view>
		<view v-for="(item,index) in list" :key="index">
			<uni-card isFull note="true">
				<view>
					<view class="flex font-sm text-muted py-2 justify-between">
						<text>订单时间：{{ item.created_time }}</text>
						<text>订单号：{{ item.no }}</text>
					</view>
					<view class="flex font-md">{{ item.goods }}</view>
					<view class="flex font-md justify-end text-danger font-weight-bold">￥{{ item.price }}</view>
				</view>
				<view slot="footer" class="flex" :class="item.status == 'success' ? 'text-success' : ''">
					<view>
						{{ item.status == 'success' ? '交易成功' : '等待支付' }}
					</view>
					<view class="ml-auto">
						<main-button bClass="px-2 font" v-if="item.status == 'pendding'" @click="pay(item.no)">立即支付</main-button>
					</view>
				</view>
			</uni-card>
			<view class="divider"></view>
		</view>
		
		<uni-load-more :status="loadStatus"></uni-load-more>
		
	</view>
</template>

<script>
	import $tool from '@/common/tool.js';
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
			pay(no){
				// H5支付
				// #ifdef H5
				uni.navigateTo({
					url: '../h5pay/h5pay?no='+no,
				});
				// #endif
				
				// app端/小程序端支付
				// #ifdef APP-PLUS || MP
				$tool.wxpay(no,()=>{
					this.page = 1
					this.getData()
				})
				// #endif
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
				return this.$api.getOrderList({
					page:this.page,
					limit:this.limit
				}).then(res=>{
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
