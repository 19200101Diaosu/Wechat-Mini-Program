(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/user-info/user-info"],{"2b11":function(t,n,e){"use strict";(function(t){Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var i=e("26cb");function r(t,n){var e=Object.keys(t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(t);n&&(i=i.filter((function(n){return Object.getOwnPropertyDescriptor(t,n).enumerable}))),e.push.apply(e,i)}return e}function u(t){for(var n=1;n<arguments.length;n++){var e=null!=arguments[n]?arguments[n]:{};n%2?r(Object(e),!0).forEach((function(n){o(t,n,e[n])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(e)):r(Object(e)).forEach((function(n){Object.defineProperty(t,n,Object.getOwnPropertyDescriptor(e,n))}))}return t}function o(t,n,e){return n in t?Object.defineProperty(t,n,{value:e,enumerable:!0,configurable:!0,writable:!0}):t[n]=e,t}var c={computed:u({},(0,i.mapState)({user:function(t){return t.user}})),data:function(){return{form:{avatar:"",nickname:"",sex:"未知"}}},created:function(){this.form={avatar:this.user.avatar,nickname:this.user.nickname,sex:this.user.sex}},methods:{changeAvatar:function(){var n=this;t.chooseImage({count:1,success:function(t){n.$api.upload(t.tempFilePaths[0],(function(t){console.log("进度",t)})).then((function(t){n.form.avatar=t}))}})},changeSex:function(){var n=this,e=["未知","男","女"];t.showActionSheet({itemList:e,success:function(t){n.form.sex=e[t.tapIndex]}})},submit:function(){var n=this;t.showLoading({title:"提交中..."});var e=Object.assign(this.form,{});this.$api.updateInfo(e).then((function(t){n.$store.dispatch("updateInfo",e),n.$toast("保存成功")})).finally((function(){t.hideLoading()}))}}};n.default=c}).call(this,e("543d")["default"])},"2ba8":function(t,n,e){"use strict";e.r(n);var i=e("c05d"),r=e("c218");for(var u in r)"default"!==u&&function(t){e.d(n,t,(function(){return r[t]}))}(u);var o,c=e("f0c5"),a=Object(c["a"])(r["default"],i["b"],i["c"],!1,null,null,null,!1,i["a"],o);n["default"]=a.exports},"84ce":function(t,n,e){"use strict";(function(t){e("90f6");i(e("66fd"));var n=i(e("2ba8"));function i(t){return t&&t.__esModule?t:{default:t}}t(n.default)}).call(this,e("543d")["createPage"])},c05d:function(t,n,e){"use strict";e.d(n,"b",(function(){return r})),e.d(n,"c",(function(){return u})),e.d(n,"a",(function(){return i}));var i={uniList:function(){return e.e("uni_modules/uni-list/components/uni-list/uni-list").then(e.bind(null,"b4f3"))},uniListItem:function(){return e.e("uni_modules/uni-list/components/uni-list-item/uni-list-item").then(e.bind(null,"ca3e"))},mainButton:function(){return e.e("components/main-button/main-button").then(e.bind(null,"746b"))}},r=function(){var t=this,n=t.$createElement;t._self._c},u=[]},c218:function(t,n,e){"use strict";e.r(n);var i=e("2b11"),r=e.n(i);for(var u in i)"default"!==u&&function(t){e.d(n,t,(function(){return i[t]}))}(u);n["default"]=r.a}},[["84ce","common/runtime","common/vendor"]]]);