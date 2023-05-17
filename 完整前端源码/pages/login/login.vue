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
				<text class="title">{{ type == 'login' ? '登 录' : '注 册' }}</text>
			</view>
			<view class="login-form">
				<uni-icons type="person"></uni-icons>
				<input type="text" placeholder="请输入用户名" class="rounded font-md" v-model="form.username"/>
			</view>
			<view class="login-form">
				<uni-icons type="locked"></uni-icons>
				<input type="text" placeholder="请输入密码" class="rounded font-md"  v-model="form.password"/>
			</view>
			<view class="login-form" v-if="type == 'reg'">
				<uni-icons type="locked"></uni-icons>
				<input type="text" placeholder="请输入确认密码" class="rounded font-md" v-model="form.repassword"/>
			</view>
			
			<view class="bg-main btn" hover-class="bg-main-hover" @click="submit">{{ type == 'login' ? '登 录' : '注 册' }}</view>
			
			<view class="flex align-center justify-between my-3 font">
				<text class="py-3 text-main" @click="changeType">{{ type == 'login' ? '注册账号' : '去登录' }}</text>
				<text class="py-3 text-light-muted" @click="openForget">忘记密码？</text>
			</view>
			
			
			<view class="flex align-center justify-center wechatlogin">
				<!-- #ifndef MP -->
				<uni-icons type="weixin" size="25" color="#5ccc84" @click="wxLogin"></uni-icons>
				<!-- #endif -->
				<!-- #ifdef MP -->
				<button type="default" open-type="getUserInfo" @getuserinfo="mpWxLogin">
					<uni-icons type="weixin" size="25" color="#5ccc84"></uni-icons>
				</button>
				<!-- #endif -->
			</view>
			
			
			<checkbox-group v-if="type == 'login'" class="flex align-center justify-center mt-4" @change="handleCheckboxChange">
				<label class="text-light-muted">
					<checkbox value="1" color="#7fd49e" style="transform: scale(0.7);"/><text class="font">已阅读并同意用户协议&隐私声明</text>
				</label>
			</checkbox-group>
			
		</view>
		
	</view>
</template>

<script>
	import tool from '@/common/tool.js';
	export default {
		data() {
			return {
				confirm:false,
				type:"login",
				form:{
					username:"",
					password:"",
					repassword:""
				}
			}
		},
		onLoad(){
			// #ifdef H5
			this.handleH5WxLogin()
			// #endif
		},
		methods: {
			mpWxLogin(e){
				if(!this.beforeLogin()){
					return
				}
				
				let rawData = e.detail.rawData
				uni.login({
					provider:"weixin",
					success: (res) => {
						let code = res.code
						uni.showLoading({
							title: '登录中...',
							mask: false
						});
						this.$api.wxLogin({
							type:"mp",
							rawData,
							code
						}).then(user=>{
							this.handleLoginSuccess(user)
						}).finally(()=>{
							uni.hideLoading()
						})
					}
				})
			},
			handleH5WxLogin(){
				// 获取url中的code
				let code = tool.getUrlCode("code")
				if(!code){
					return
				}
				uni.showLoading({
					title: '登录中...',
					mask: false
				});
				// 拿到code请求接口
				this.$api.wxLogin({
					type:"h5",
					code
				}).then(user=>{
					this.handleLoginSuccess(user)
				}).finally(()=>{
					uni.hideLoading()
				})
			},
			wxLogin(){
				if(!this.beforeLogin()){
					return
				}
				// #ifdef H5
				tool.getH5Code()
				// #endif
				// #ifdef APP-PLUS
				this.appWxLogin()
				// #endif
			},
			appWxLogin(){
				uni.login({
					provider:"weixin",
					success: (res) => {
						let { access_token,openid } = res.authResult
						uni.showLoading({
							title: '登录中...',
							mask: false
						});
						this.$api.wxLogin({
							type:"app",
							access_token,
							openid
						}).then(user=>{
							this.handleLoginSuccess(user)
						}).finally(()=>{
							uni.hideLoading()
						})
					}
				})
			},
			openForget(){
				uni.navigateTo({
					url: '../forget/forget',
				});
			},
			handleCheckboxChange(e){
				this.confirm = !!e.detail.value.length
			},
			back(){
				uni.navigateBack({
					delta: 1
				});
			},
			changeType(){
				this.type = this.type == 'login' ? 'reg' : 'login'
			},
			resetForm(){
				this.form = {
					username:"",
					password:"",
					repassword:""
				}
			},
			beforeLogin(){
				if(!this.confirm && this.type == 'login'){
					this.$toast('请先阅读并同意用户协议&隐私声明')
					return false
				}
				return true
			},
			handleLoginSuccess(user){
				this.$toast('登录成功')
				this.$store.dispatch('login',user)
				if(!user.phone){
					uni.redirectTo({
						url:"/pages/bind-phone/bind-phone"
					})
					return
				}
				setTimeout(()=>{
					// #ifdef H5
					uni.switchTab({
						url:"../tabbar/home/home"
					})
					// #endif
					// #ifndef H5
					this.back()
					// #endif
				},350)
			},
			submit(){
				if(!this.beforeLogin()){
					return
				}
				
				uni.showLoading({
					title: '提交中...',
					mask: false
				});
				let data = Object.assign(this.form,{})
				
				this.$api[this.type](data).then(user=>{
					if(this.type == 'reg'){
						this.$toast('注册成功')
						this.resetForm()
						this.changeType()
					} else {
						this.handleLoginSuccess(user)
					}
				}).finally(()=>{
					uni.hideLoading()
				})

			}
		}
	}
</script>

<style>

</style>
