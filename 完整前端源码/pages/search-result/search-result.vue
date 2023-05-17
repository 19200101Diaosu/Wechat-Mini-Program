<template>
	<view class="flex flex-column" style="height: 100%;">
		<tab :tabs="tabs" :current="current" @change="clickTab"></tab>
		<swiper :current="current" :duration="200" class="flex-1 flex flex-column" @change="swiperChange">
			<swiper-item class="flex" v-for="(t,tI) in tabs" :key="tI">
				<scroll-view class="flex-1" scroll-y="true" @scrolltolower="handleLoadMore(t)">
					<course-list type="one" v-for="(item,index) in t.list" :key="index" :item="item"></course-list>
					<uni-load-more :status="t.loadStatus"></uni-load-more>
				</scroll-view>
			</swiper-item>
		</swiper>
		
	</view>
</template>

<script>
	export default {
		data() {
			return {
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
				keyword:""
			}
		},
		onNavigationBarSearchInputClicked() {
			uni.navigateBack({
				delta: 1
			});
		},
		onLoad(e) {
			this.keyword = e.keyword
			this.getData()
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
				this.$api.search({
					keyword:this.keyword,
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
