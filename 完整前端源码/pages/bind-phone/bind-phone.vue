<template>
	<view>
		<!-- #ifndef MP -->
		<view class="login-back" @click="back">
			<uni-icons type="arrowleft" size="20" color="#FFFFFF"></uni-icons>
		</view>
		<!-- #endif -->
		
		<view class="login-bg"></view>
		
		<view class="login">
			<view class="flex">
				<text class="title">绑定手机号</text>
			</view>
			<view class="login-form">
				<uni-icons type="person"></uni-icons>
				<input type="text" placeholder="请输入手机号" class="rounded font-md" v-model="form.phone"/>
			</view>
			<view class="login-form">
				<uni-icons type="locked"></uni-icons>
				<input type="text" placeholder="验证码" class="rounded font-md"  v-model="form.code"/>
				<code-btn :phone="form.phone"></code-btn>
			</view>

			<view class="bg-main btn" hover-class="bg-main-hover" @click="submit">绑 定</view>
			
		</view>
		
	</view>
</template>

<script>
	export default {
		data() {
			return {
				form:{
					phone:"",
					code:""
				}
			}
		},
		methods: {
			back(){
				uni.navigateBack({
					delta: 1
				});
			},
			submit(){
				uni.showLoading({
					title: '提交中...',
					mask: false
				});
				let data = Object.assign(this.form,{})
				
				this.$api.bindMobile(data).then(res=>{
					this.$toast('绑定成功')
					this.$store.dispatch('updateInfo',{
						phone:data.phone
					})
					setTimeout(()=>{
						this.back()
					},350)
				}).finally(()=>{
					uni.hideLoading()
				})
			}
		}
	}
</script>

<style>

</style>
