(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/create-order/create-order"],{1521:function(t,n,o){"use strict";o.d(n,"b",(function(){return i})),o.d(n,"c",(function(){return u})),o.d(n,"a",(function(){return e}));var e={bookList:function(){return o.e("components/book-list/book-list").then(o.bind(null,"6896"))},courseList:function(){return o.e("components/course-list/course-list").then(o.bind(null,"083b"))},uniList:function(){return o.e("uni_modules/uni-list/components/uni-list/uni-list").then(o.bind(null,"b4f3"))},uniListItem:function(){return o.e("uni_modules/uni-list/components/uni-list-item/uni-list-item").then(o.bind(null,"ca3e"))},mainButton:function(){return o.e("components/main-button/main-button").then(o.bind(null,"746b"))}},i=function(){var t=this,n=t.$createElement;t._self._c},u=[]},b5f0:function(t,n,o){"use strict";o.r(n);var e=o("fc62"),i=o.n(e);for(var u in e)"default"!==u&&function(t){o.d(n,t,(function(){return e[t]}))}(u);n["default"]=i.a},e3fb:function(t,n,o){"use strict";(function(t){o("90f6");e(o("66fd"));var n=e(o("eb27"));function e(t){return t&&t.__esModule?t:{default:t}}t(n.default)}).call(this,o("543d")["createPage"])},eb27:function(t,n,o){"use strict";o.r(n);var e=o("1521"),i=o("b5f0");for(var u in i)"default"!==u&&function(t){o.d(n,t,(function(){return i[t]}))}(u);var c,s=o("f0c5"),a=Object(s["a"])(i["default"],e["b"],e["c"],!1,null,null,null,!1,e["a"],c);n["default"]=a.exports},fc62:function(t,n,o){"use strict";(function(t){Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var e=i(o("c9eb"));function i(t){return t&&t.__esModule?t:{default:t}}var u={data:function(){return{id:0,type:null,detail:{cover:"",id:0,price:"",title:"",type:""},coupon_count:0,user_coupon_id:0,coupon_price:0}},onLoad:function(n){var o=this;if(!n.id||!n.type)return this.$toast("非法参数"),void t.navigateBack({delta:1});this.id=n.id,this.type=n.type,this.$api.readGoods({id:this.id,type:this.type}).then((function(t){o.detail=t,o.getUseableCouponCount()})).catch((function(n){t.navigateBack({delta:1})})),t.$on("chooseCoupon",this.handleChooseCoupon)},beforeDestroy:function(){t.$off("chooseCoupon",this.handleChooseCoupon)},computed:{price:function(){var t=((1e3*this.detail.price-1e3*this.coupon_price)/1e3).toFixed(2);return t<=0?0:t},coupon_desc:function(){return this.coupon_price?"减".concat(this.coupon_price,"元"):this.coupon_count?"请选择优惠券（"+this.coupon_count+"张）":"暂无可用"}},methods:{submit:function(){t.showLoading({title:"创建订单中...",mask:!1});var n={goods_id:this.detail.id,type:this.type,user_coupon_id:this.user_coupon_id},o="save";"flashsale"==this.type&&(n={flashsale_id:this.id},o="flashsale"),this.$api.createOrder(n,o).then((function(n){e.default.wxpay(n.no,(function(){t.navigateBack({delta:1})}))})).finally((function(){t.hideLoading()}))},handleChooseCoupon:function(t){this.user_coupon_id=t.user_coupon_id,this.coupon_price=t.price},chooseCoupon:function(){0!=this.coupon_count&&this.authJump("/pages/my-coupon/my-coupon?goods_id=".concat(this.id,"&type=").concat(this.type))},getUseableCouponCount:function(){var n=this;t.showLoading({title:"加载中...",mask:!1}),this.$api.getUseableCouponCount({goods_id:this.id,type:"course"==this.type?"course":"column"}).then((function(t){n.coupon_count=t})).finally((function(){t.hideLoading()}))}}};n.default=u}).call(this,o("543d")["default"])}},[["e3fb","common/runtime","common/vendor"]]]);