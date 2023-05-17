<template>
	<view class="flex flex-column" style="height: 100%;">
		<icons-card :icons="icons"></icons-card>
		<tab :tabs="tabs" :current="current" @change="clickTab"></tab>
		<swiper :current="current" :duration="200" class="flex-1 flex flex-column" @change="swiperChange">
			<swiper-item class="flex" v-for="(t,tI) in tabs" :key="tI">
				<scroll-view class="flex-1" scroll-y="true" @scrolltolower="handleLoadMore(t)">
					<course-list type="one" v-for="(item,index) in t.list" :key="index" :item="item">
						<view slot="desc" class="font-sm text-light-muted my-1">学习进度</view>
						<view class="font-sm">
							<text v-if="index == 0" class="text-danger mr-1">最近学习</text>
							<text class="text-muted">已学习 {{ item.progress }}%</text>
						</view>
					</course-list>
					<uni-load-more :status="t.loadStatus"></uni-load-more>
				</scroll-view>
			</swiper-item>
		</swiper>
		<no-login v-if="!token"></no-login>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		data() {
			return {
				icons:[{
					icon:"icon-OrderHistory",
					name:"帖子",
					path:"/pages/my-post/my-post"
				},{
					icon:"icon-pinglun2",
					name:"考试",
					path:"/pages/my-test/my-test"
				},{
					icon:"icon-shoucang1",
					name:"电子书",
					path:"/pages/my-book/my-book"
				}],
				current:0,
				tabs:[{
					name:"课程",
					loadStatus:"more",
					list:[],
					page:1,
					type:"course"
				},{
					name:"专栏",
					loadStatus:"more",
					list:[],
					page:1,
					type:"column"
				}],
			}
		},
		computed: {
			...mapState({
				token:state=>state.token
			})
		},
		onShow(){
			if(this.token){
				this.tabs.forEach(item=>{
					item.page = 1
					item.loadStatus = 'more'
				})
				this.getData()
			}
		},
		methods: {
			clickTab(index){
				this.swiperChange({
					detail:{
						current:index
					}
				})
			},
			swiperChange(e){
				this.current = e.detail.current
				let tab = this.tabs[this.current]
				if(tab.loadStatus == 'more' && tab.page == 1){
					this.getData()
				}
			},
			getData(){
				let tab = this.tabs[this.current]
				tab.loadStatus = 'loading'
				this.$api.getUserHistory({
					page:tab.page,
					type:tab.type
				}).then(res=>{
					console.log(res.rows)
					tab.list = tab.page == 1 ? res.rows : [...tab.list,...res.rows]
					tab.loadStatus = res.rows.length < 10 ? 'noMore' : 'more'
				}).catch(err=>{
					tab.loadStatus = 'more'
					if(tab.page > 1){
						tab.page = tab.page - 1
					}
				})
			},
			handleLoadMore(t){
				if(t.loadStatus != 'more') return
				t.page = t.page + 1
				this.getData()
			}
		}
	}
</script>

<style>
page{
	display: flex;
	flex-direction: column;
	height: 100%;
}
</style>
