<template>
	<view>
		
		<view class="position-relative">
			<image :src="detail.cover" style="width: 100%;height: 420rpx;" class="bg-light"></image>
			<view class="text-white font-sm p-1" style="position: absolute;right: 20rpx;bottom: 20rpx;background-color: rgba(0,0,0,0.4);">
				专栏
			</view>
		</view>

		<!-- 活动条 -->
		<active-bar v-if="activeData && !detail.isbuy" :end_time="activeData.data.end_time" :price="activeData.data.price" :t_price="detail.price">
			<text v-if="activeData.type == 'group'">{{ activeData.data.p_num }}人拼团</text>
			<text v-else>{{ activeData.data.used_num }}人已枪/剩{{ activeData.data.s_num - activeData.data.used_num}}名</text>
		</active-bar>

		<tab :tabs="tabs" :current="current" @change="clickTab"></tab>
		
		<!-- 简介 -->
		<view v-if="current == 0" class="animate__animated animate__fadeIn animate__faster">
			<view v-if="firstLoad" class="flex flex-column p-3">
				<text class="mb-1" style="font-size: 38rpx;">{{ detail.title }}</text>
				<view class="flex align-center justify-between">
					<text class="font-sm text-light-muted">{{ detail.sub_count }} 人学过</text>
					<collect-btn :isfava="detail.isfava" :goods_id="detail.id" type="column" @success="detail.isfava = $event"></collect-btn>
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
			
			<uni-card title="专栏简介" isFull>
				<group-works v-if="!detail.isbuy" ref="groupWorks" @updateData="getData"></group-works>
				
				<mp-html :content="detail.content">
					<view class="flex justify-center py-3 text-muted">
						加载中...
					</view>
				</mp-html>
			</uni-card>
		</view>
		<!-- 目录 -->
		<view v-else class="animate__animated animate__fadeIn animate__faster">
			<view class="p-3">
				<view class="border rounded bg-light text-muted p-2">
					共 {{ list.length }} 节
				</view>
			</view>
			
			<menu-item v-for="(item,index) in list" :key="index" :title="item.title" :index="index" @click="openPlay(item)">
				<view class="flex">
					<text class="border text-danger rounded border-danger font-small px-1 mt-1 mr-1">
						{{ item.type | formatType}}
					</text>
					<text v-if="item.price == 0" class="border text-danger rounded border-danger font-small px-1 mt-1">
						免费试看
					</text>
				</view>
			</menu-item>
			
		</view>
		
		
		<template v-if="!detail.isbuy && firstLoad">
			<view style="height: 75px;"></view>
			<view class="fixed-bottom p-2 border-top bg-white">
				<main-button @click="submit">{{ btn }}</main-button>
			</view>
		</template>
		
		
	</view>
</template>

<script>
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
				current:0,
				tabs:[{
					name:"简介",
				},{
					name:"目录",
				}],
				
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
				list:[],
				
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
		onLoad(e) {
			this.detail.id = e.id
			if(!this.detail.id){
				this.$toast('非法参数')
				setTimeout(()=>{
					uni.navigateBack({ delta: 1 });
				},700)
				return
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
						type:"column"
					}).then(res=>{
						this.getData()
					}).finally(()=>{
						uni.hideLoading()
					})
					return
				}
				// 创建订单
				let type = "column"
				let id = this.detail.id
				
				if(this.detail.flashsale){
					type = 'flashsale'
					id = this.flashsale_id
				}
				
				this.authJump(`../create-order/create-order?id=${id}&type=${type}`)
			},
			openPlay(item){
				if(item.price != 0 && !this.detail.isbuy){
					return this.$toast('请先购买该专栏')
				}
				this.authJump(`/pages/course/course?id=${item.id}&column_id=${this.detail.id}`)
			},
			clickTab(index){
				this.current = index
			},
			getData(){
				this.$api.readColumn({
					id:this.detail.id,
					group_id:this.group_id,
					flashsale_id:this.flashsale_id
				}).then(res=>{
					this.detail = res
					console.log(res);
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
					
					this.list = res.column_courses
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
