<template>
	<view class="scroll-row-item course course-one" @click="openDetail">
		<view class="position-relative">
			<image :src="item.cover" class="rounded"></image>
			<view class="text-white font-sm">{{ item.type | formatType }}</view>
		</view>
		<view class="flex flex-column flex-shrink">
			<text class="text-ellipsis font-md">{{ item.title }}</text>
			<slot name="desc"><view v-if="item.try" class="font-sm text-light-muted my-1" v-html="item.try"></view></slot>
			<view class="flex flex-1 align-end">
				<slot>
				<text class="font-md text-danger" v-if="item.price == 0 ">免费</text>
				<text class="font-md text-danger" v-else>￥{{ item.price }}</text>
				<text class="font-sm text-light-muted" v-if="item.t_price">￥{{ item.t_price }}</text>
				<view class="border flex align-center justify-center rounded-circle px-2 py-1 ml-auto text-muted" v-if="issub">
					{{ item.sub_count }}人订阅
					<text class="iconfont icon-xiayibu ml-1"></text>
				</view>
				</slot>
			</view>
		</view>
	</view>
</template>

<script>
	let opt = {
		media:"图文",
		audio:"音频",
		video:"视频",
		column:"专栏"
	}
	export default {
		name:"course-list",
		props: {
			item: Object,
			type:{
				type:String,
				default:"two"
			},
			disabled:{
				type:Boolean,
				default:false
			}
		},
		filters: {
			formatType(k) {
				return opt[k];
			}
		},
		computed: {
			issub() {
				return typeof this.item.sub_count == 'number'
			}
		},
		data() {
			return {
				
			};
		},
		methods:{
			openDetail(){
				if(this.disabled){
					return
				}
				uni.navigateTo({ 
					url:"/pages/book-detail/book-detail?id="+this.item.id,
				});
			}
		}
	}
</script>

<style>
.course>view:first-child>view{
	position: absolute;
	right: 10rpx;
	bottom: 10rpx;
	background-color: rgba(0,0,0,0.4);
	padding: 0 10rpx;
}
.course-one{
	display: flex!important;
	padding: 20rpx;
}
.course-one>view:first-child{
	margin-right: 20rpx;
}
.course-one image,.course-one>view:first-child{
	width: 185rpx;height: 235rpx;
	flex-shrink: 1;
}
.course-one>view:last-child{
	width: 500rpx;
}
</style>
