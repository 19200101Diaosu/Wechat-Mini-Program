<template>
	<view>
		
		<view v-if="!detail.isbuy" class="position-relative">
			<image :src="detail.cover" style="width: 100%;height: 420rpx;" class="bg-light"></image>
			<view class="text-white font-sm p-1" style="position: absolute;right: 20rpx;bottom: 20rpx;background-color: rgba(0,0,0,0.4);">
				{{ detail.type | formatType }}
			</view>
		</view>
		<f-audio v-else-if="detail.type == 'audio'" :poster="detail.cover" :src="detail.content" @onProgress="onAudioProgressUpdate"></f-audio>
		<video v-else-if="detail.type == 'video'" :src="detail.content" controls style="width: 100%;height: 420rpx;" :poster="detail.cover" @timeupdate="onVideoTimeUpdate"></video>
		
		<!-- 活动条 -->
		<active-bar v-if="activeData && !detail.isbuy" :end_time="activeData.data.end_time" :price="activeData.data.price" :t_price="detail.price">
			<text v-if="activeData.type == 'group'">{{ activeData.data.p_num }}人拼团</text>
			<text v-else>{{ activeData.data.used_num }}人已枪/剩{{ activeData.data.s_num - activeData.data.used_num}}名</text>
		</active-bar>
		
		
		<view class="animate__animated animate__fadeIn animate__faster">
			<view v-if="firstLoad" class="flex flex-column p-3">
				<text class="mb-1" style="font-size: 38rpx;">{{ detail.title }}</text>
				<view class="flex align-center justify-between">
					<text class="font-sm text-light-muted">{{ detail.sub_count }} 人学过</text>
					<collect-btn :isfava="detail.isfava" :goods_id="detail.id" type="course" @success="detail.isfava = $event"></collect-btn>
				</view>
				<view v-if="!detail.isbuy" class="flex mt-2 align-end">
					
					<text class="text-danger font-lg">￥{{ detail.price }}</text>
					<text class="font-sm text-light-muted ml-1 text-through">￥{{ detail.t_price }}</text>
				</view>
			</view>
			
			<view v-else class="flex flex-column p-3">
				<skeleton width="600rpx" height="75rpx" oClass="mb-2"></skeleton>
				<skeleton width="150rpx" height="70rpx"></skeleton>
				<view class="flex mt-2 align-end">
					<skeleton width="150rpx" height="70rpx"></skeleton>
					<skeleton width="150rpx" height="40rpx" oClass="ml-1"></skeleton>
				</view>
			</view>
			
			
			
			<view class="divider"></view>
			
			
			<group-works v-if="!detail.isbuy" ref="groupWorks" @updateData="getData"></group-works>
			
			
			<uni-card :title="(detail.isbuy && detail.type == 'media') ? '课程内容' : '课程简介'" isFull>
				<view id="media">
					<mp-html :content="(detail.isbuy && detail.type == 'media') ? detail.content : detail.try" @ready="onMediaReady">
						<view class="flex justify-center py-3 text-muted">
							加载中...
						</view>
					</mp-html>
				</view>
			</uni-card>
			
			<template v-if="!detail.isbuy && firstLoad">
				<view style="height: 75px;"></view>
				<view class="fixed-bottom p-2 border-top bg-white">
					<main-button @click="submit">{{ btn }}</main-button>
				</view>
			</template>
		</view>
		
	</view>
</template>

<script>
	import $tool from '@/common/tool.js';
	let windowHeight = uni.getSystemInfoSync().windowHeight
	export default {
		filters: {
			formatType(t) {
				let c = {
					media:"图文",
					audio:"音频",
					video:"视频"
				}
				return c[t];
			}
		},
		data() {
			return {
				firstLoad:false,
				detail:{
					id: 0,
					title: "",
					cover: "",
					try: "",
					price: "",
					t_price: "",
					type: "media",
					sub_count: 0,
					content: "",
					isbuy: false,
					isfava:false
				},
				
				column_id:0,
				
				scrollTop:0,
				mediaHeight:0,
				
				progress:0,
				
				group_id:0,
				// 拼团/秒杀详情
				activeData:null,
				
				flashsale_id:0
			}
		},
		computed:{
			btn(){
				if(this.detail.flashsale){
					return '立即秒杀￥'+this.detail.flashsale.price
				}
				if(this.detail.group){
					return '立即拼团￥'+this.detail.group.price
				}
				if(this.detail.price == 0){
					return '立即学习'
				}
				return  '立即订购￥'+this.detail.price
			}
		},
		onPageScroll(e){
			if(this.detail.isbuy && this.detail.type == 'media' && e.scrollTop > this.scrollTop){
				this.scrollTop = e.scrollTop
				this.sumMediaProgress()
			}
		},
		onLoad(e) {
			this.detail.id = e.id
			if(!this.detail.id){
				this.$toast('非法参数')
				setTimeout(()=>{
					uni.navigateBack({ delta: 1 });
				},700)
				return
			}
			if(e.column_id){
				this.column_id = e.column_id
			}
			if(e.group_id){
				this.group_id = e.group_id
			}
			if(e.flashsale_id){
				this.flashsale_id = e.flashsale_id
			}
		},
		onShow(){
			this.getData()
		},
		beforeDestroy(){
			this.updateUserHistory()
		},
		methods: {
			submit(){
				// 立即拼团
				if(this.group_id){
					uni.showLoading({
						title: '发起拼团中...',
						mask: true
					})
					
					this.$api.createOrder({
						group_id:this.group_id,
					},'group').then(res=>{
						// H5支付
						// #ifdef H5
						uni.navigateTo({
							url: '../h5pay/h5pay?no='+res.no,
						});
						// #endif
						
						// app端支付
						// #ifdef APP-PLUS || MP
						$tool.wxpay(res.no,()=>{
							this.getData()
						})
						// #endif
					}).catch(err=>{
						console.log(err);
					}).finally(()=>{
						uni.hideLoading()
					})
					
					return
				}
				
				// 立即学习
				if(this.detail.price == 0){
					uni.showLoading({
						title: '加载中...',
						mask: false
					});
					this.$api.learn({
						goods_id:this.detail.id,
						type:"course"
					}).then(res=>{
						this.getData()
					}).finally(()=>{
						uni.hideLoading()
					})
					return
				}
				
				// 创建订单
				let type = "course"
				let id = this.detail.id
				
				if(this.detail.flashsale){
					type = 'flashsale'
					id = this.flashsale_id
				}
				
				this.authJump(`../create-order/create-order?id=${id}&type=${type}`)
			},
			onAudioProgressUpdate(p){
				this.progress = p
			},
			onVideoTimeUpdate(e){
				let { currentTime,duration } = e.detail
				if(duration > 0){
					this.progress = ((currentTime/duration)*100).toFixed(2)
				}
			},
			updateUserHistory(){
				if(!this.detail.isbuy) return
				let d = {}
				if(this.column_id == 0){
					d = {
						id:this.detail.id,
						type:"course",
						progress:this.progress
					}
				} else {
					d = {
						id:this.column_id,
						type:"column",
						detail_id:this.detail.id
					}
				}
				this.$api.updateUserHistory(d)
			},
			onMediaReady(){
				const Query = uni.createSelectorQuery().in(this)
				Query.select('#media').boundingClientRect(data=>{
					this.mediaHeight = parseInt(data.height)
					this.sumMediaProgress()
				}).exec()
			},
			// 计算图文课程学习进度
			sumMediaProgress(){
				if(this.mediaHeight > 0){
					this.progress = (((this.scrollTop + windowHeight)/this.mediaHeight)*100).toFixed(2)
					this.progress = this.progress > 100 ? 100 : this.progress
					console.log(this.progress);
				}
			},
			getData(){
				this.$api.readCourse({
					id:this.detail.id,
					column_id:this.column_id,
					group_id:this.group_id,
					flashsale_id:this.flashsale_id
				}).then(res=>{
					this.detail = res
					
					if(res.group){
						this.activeData = {
							type:"group",
							data:res.group
						}
						this.$refs.groupWorks.init(this.group_id)
					}
					
					if(res.flashsale){
						this.activeData = {
							type:"flashsale",
							data:res.flashsale
						}
					}
					
					console.log(this.detail);
					uni.setNavigationBarTitle({
						title:this.detail.title
					})
				}).catch(err=>{
					if(err == '该记录不存在'){
						setTimeout(()=>{
							uni.navigateBack({ delta: 1 });
						},700)
					}
				}).finally(()=>{
					this.firstLoad = true
				})
			}
		}
	}
</script>

<style>

</style>
