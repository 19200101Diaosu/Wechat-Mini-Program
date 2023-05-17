(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/collect-btn/collect-btn"],{"438b":function(t,e,n){"use strict";n.r(e);var a=n("bdf8"),o=n("a1d7");for(var c in o)"default"!==c&&function(t){n.d(e,t,(function(){return o[t]}))}(c);var u,i=n("f0c5"),l=Object(i["a"])(o["default"],a["b"],a["c"],!1,null,null,null,!1,a["a"],u);e["default"]=l.exports},a1d7:function(t,e,n){"use strict";n.r(e);var a=n("b0eb"),o=n.n(a);for(var c in a)"default"!==c&&function(t){n.d(e,t,(function(){return a[t]}))}(c);e["default"]=o.a},b0eb:function(t,e,n){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n={name:"collect-btn",props:{isfava:{type:Boolean,default:!1},goods_id:{type:Number,default:0},type:{type:String,default:"course"}},methods:{handleCollect:function(){var e=this;t.showLoading({title:"操作中...",mask:!1});var n=this.isfava?"uncollect":"collect",a=this.isfava?"取消收藏":"收藏";this.$api[n]({goods_id:this.goods_id,type:this.type}).then((function(t){e.$toast(a+"成功"),e.$emit("success","uncollect"!=n)})).finally((function(){t.hideLoading()}))}}};e.default=n}).call(this,n("543d")["default"])},bdf8:function(t,e,n){"use strict";var a;n.d(e,"b",(function(){return o})),n.d(e,"c",(function(){return c})),n.d(e,"a",(function(){return a}));var o=function(){var t=this,e=t.$createElement;t._self._c},c=[]}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/collect-btn/collect-btn-create-component',
    {
        'components/collect-btn/collect-btn-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('543d')['createComponent'](__webpack_require__("438b"))
        })
    },
    [['components/collect-btn/collect-btn-create-component']]
]);
