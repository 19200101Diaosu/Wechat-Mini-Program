<template>
	<view class="animate__animated animate__fadeInDown animate__faster">
		
		<view class="home-bg"></view>
		
		<view class="position-relative">
			<view class="flex p-3" v-if="!user" @click="navigateTo('/pages/login/login')">
				<image src="/static/uni.png" style="width: 120rpx;height: 120rpx;" class="rounded-circle bg-light"></image>
				<view class="flex flex-column pl-3 flex-1 text-white">
					<view class="font-md mb-2">立即登录</view>
					<view class="font-sm">登录解锁更多功能</view>
				</view>
			</view>
			
			<view class="flex align-center p-3" v-else @click="authJump('/pages/user-info/user-info')">
				<image :src="user.avatar" style="width: 120rpx;height: 120rpx;" class="rounded-circle bg-light"></image>
				<view class="flex flex-column pl-3 flex-1 text-white">
					<view class="font-md mb-2">{{ user.nickname || user.username || user.phone }}</view>
					<view class="font-sm">{{ user.desc || '暂无描述'}}</view>
				</view>
				<text class="iconfont icon-leimupinleifenleileibie text-white"></text>
			</view>
			
			<icons-card :icons="icons"></icons-card>
			
			<view class="px-3">
				<uni-list :border="false">
					<uni-list-item clickable title="我的优惠券" showArrow @click="authJump('/pages/my-coupon/my-coupon')">
						<text slot="header" class="iconfont icon-9 mr-2" style="font-size: 20px;color: #4396ec;"></text>
					</uni-list-item>
					<uni-list-item clickable title="常见问题" showArrow>
						<text slot="header" class="iconfont icon-help mr-2" style="font-size: 20px;color: #4396ec;"></text>
					</uni-list-item>
					<uni-list-item clickable title="设置" showArrow @click="navigateTo('/pages/setting/setting')">
						<text slot="header" class="iconfont icon-leimupinleifenleileibie mr-2" style="font-size: 20px;color: #4396ec;"></text>
					</uni-list-item>
				</uni-list>
			</view>
			
			
		</view>
		
	</view>
</template>

<script>
	import { mapState } from 'vuex';
	export default {
		computed: {
			...mapState({
				user:state=>state.user
			})
		},
		data() {
			return {
				icons:[{
					icon:"icon-OrderHistory",
					name:"订单",
					path:"/pages/order-list/order-list"
				},{
					icon:"icon-pinglun2",
					name:"消息",
					path:"/pages/msg-list/msg-list"
				},{
					icon:"icon-shoucang1",
					name:"收藏",
					path:"/pages/fava-list/fava-list"
				},{
					icon:"icon-e-learning-monitor",
					name:"在学",
					path:"/pages/tabbar/learn/learn",
					type:"switchTab"
				}]
			}
		},
		onNavigationBarButtonTap() {
			this.navigateTo('/pages/setting/setting')
		},
		methods: {
			openLogin(){
				this.navigateTo('../../login/login')
			}
		}
	}
</script>

<style>
.home-bg{
	background-color: #5CCC84;
	height: 350rpx;
	width: 750rpx;
	border-bottom-left-radius: 100rpx;
	border-bottom-right-radius: 100rpx;
	position: fixed;
	left: 0;
	right: 0;
}
</style>
