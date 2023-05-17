<template>
	<view class="p-2">
		<scroll-view scroll-x="true" class="scroll-row">
			<view v-for="(item,index) in list" :key="index" class="coupon" :class="item.isgetcoupon ? 'coupon-isget' : ''">
				<view>
					<text class="font-md">￥{{ item.price }}</text>
					<text class="font-sm">适用{{ item.type | formatType }}：{{ item.value.title }}</text>
				</view>
				<view hover-class="bg-hover-warning" @click="receive(item)">
					{{ item.isgetcoupon ? '已领取' : '领取' }}
				</view>
			</view>
		</scroll-view>
	</view>
</template>

<script>
	export default {
		name:"coupon-list",
		filters: {
			formatType(type) {
				let o = {
					course:"课程",
					column:"专栏"
				}
				return o[type];
			}
		},
		data() {
			return {
				list:[]
			};
		},
		created(){
			this.getData()
		},
		methods: {
			getData() {
				this.$api.getCoupon().then(res=>{
					this.list = res
				})
			},
			receive(item){
				if(item.isgetcoupon){
					return this.$toast('你已经领取过了')
				}
				uni.showLoading({
					title: '领取中...',
					mask: false
				});
				this.$api.receiveCoupon({
					coupon_id:item.id
				}).then(res=>{
					this.$toast('领取成功')
					item.isgetcoupon = true
				}).finally(()=>{
					uni.hideLoading()
				})
			}
		},
	}
</script>

<style>
	.coupon{
		min-width: 310rpx;
		display: inline-flex;
		color: #ffffff;
		margin-right: 30rpx;
	}
	.coupon>view:first-child{
		padding: 20rpx 30rpx;
		background-color: #d39e00;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		border-right: 4rpx dashed;
	}
	.coupon>view:last-child{
		width: 120rpx;
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: #ffc107;
		font-size: 30rpx!important;
	}
	
	.coupon-isget>view:first-child{
		background-color: #dae0e5;
	}
	.coupon-isget>view:last-child{
		background-color: #dae0e5;
	}
</style>
