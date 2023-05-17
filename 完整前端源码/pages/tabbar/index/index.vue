<template>
	<view>
		<!-- #ifdef APP-PLUS -->
		<uni-status-bar bgColor="#ffffff"></uni-status-bar>
		<!-- #endif -->
		
		<index-skeleton v-if="loading"></index-skeleton>
		
		<view class="animate__animated animate__fadeIn animate__fast" v-else>
			<block v-for="(item,index) in templates" :key="index">
				<f-search-bar v-if="item.type == 'search'" :placeholder="item.placeholder"></f-search-bar>
				<swiper v-else-if="item.type == 'swiper'" :indicator-dots="true" :autoplay="true" :interval="3000" :duration="1000" style="height: 310rpx;">
					<swiper-item class="flex justify-center" v-for="(s,sI) in item.data" :key="sI" @click="swiperClick(s)">
						<image :src="s.src" mode="aspectFill" style="width: 720rpx;height: 300rpx;" class="rounded shadow"></image>
					</swiper-item>
				</swiper>
				<icon-nav v-else-if="item.type == 'icons'" :list="item.data"></icon-nav>
				<coupon-list ref="couponList" v-else-if="item.type == 'coupon'"></coupon-list>
				
				<view v-else-if="item.type == 'promotion'">
					<active-list :type="item.listType"></active-list>
				</view>
				<view v-else-if="item.type == 'list'">
					<view class="divider"></view>
					<view class="flex align-center justify-between py-3 px-2">
						<text class="font-md font-weight-bold">{{ item.title }}</text>
						<text class="font-sm text-light-muted" v-if="item.showMore" @click="openCourseList">查看更多</text>
					</view>
					<view>
						<course-list :type="item.listType" v-for="(item2,index2) in item.data" :key="index2" :item="item2"></course-list>
					</view>
				</view>
				<view v-else-if="item.type == 'imageAd'">
					<view class="divider"></view>
					<image :src="item.data" mode="aspectFill" style="width: 750rpx;height: 360rpx;" @click="imageAdClick(item)"></image>
				</view>
				
			</block>
		</view>
		
	</view>
</template>

<script>
	import indexSkeleton from './index-skeleton.vue';
	export default {
		components: {
			indexSkeleton
		},
		data() {
			return {
				loading:false,
				
				templates:[]
			}
		},
		onPullDownRefresh() {
			this.getData()
			this.refreshCouponList()
		},
		created() {
			this.loading = true
			this.getData()
			
			uni.$on('userLogin',this.refreshCouponList)
			uni.$on('userLogout',this.refreshCouponList)
		},
		destroyed() {
			uni.$off('userLogin',this.refreshCouponList)
			uni.$off('userLogout',this.refreshCouponList)
		},
		methods: {
			imageAdClick(item){
				console.log(item);
			},
			swiperClick(s){
				if(s.type == 'webview'){
					this.$openWebview(s.url)
				} else if(s.type == 'course'){
					uni.navigateTo({
						url: '/pages/course/course?id='+s.course_id,
					});
				}
			},
			refreshCouponList(){
				if(this.$refs.couponList && this.$refs.couponList[0]){
					this.$refs.couponList[0].getData()
				}
			},
			getData(){
				this.$api.getIndexData().then(data=>{
					this.templates = data
				}).finally(()=>{
					this.loading = false
					uni.stopPullDownRefresh()
				})
			},
			openCourseList(){
				uni.navigateTo({
					url: '../../list/list?module=course',
				});
			}
		}
	}
</script>

<style>
	
</style>
