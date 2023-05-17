(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["uni_modules/uni-badge/components/uni-badge/uni-badge"],{1291:function(t,e,n){},"1d13":function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var u={name:"UniBadge",props:{type:{type:String,default:"default"},inverted:{type:Boolean,default:!1},text:{type:[String,Number],default:""},size:{type:String,default:"normal"}},data:function(){return{badgeStyle:""}},watch:{text:function(){this.setStyle()}},mounted:function(){this.setStyle()},methods:{setStyle:function(){this.badgeStyle="width: ".concat(8*String(this.text).length+12,"px")},onClick:function(){this.$emit("click")}}};e.default=u},2375:function(t,e,n){"use strict";var u=n("1291"),a=n.n(u);a.a},7143:function(t,e,n){"use strict";n.r(e);var u=n("1d13"),a=n.n(u);for(var i in u)"default"!==i&&function(t){n.d(e,t,(function(){return u[t]}))}(i);e["default"]=a.a},a90e:function(t,e,n){"use strict";n.r(e);var u=n("ab13"),a=n("7143");for(var i in a)"default"!==i&&function(t){n.d(e,t,(function(){return a[t]}))}(i);n("2375");var r,c=n("f0c5"),o=Object(c["a"])(a["default"],u["b"],u["c"],!1,null,"8a8cfeb4",null,!1,u["a"],r);e["default"]=o.exports},ab13:function(t,e,n){"use strict";var u;n.d(e,"b",(function(){return a})),n.d(e,"c",(function(){return i})),n.d(e,"a",(function(){return u}));var a=function(){var t=this,e=t.$createElement;t._self._c},i=[]}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'uni_modules/uni-badge/components/uni-badge/uni-badge-create-component',
    {
        'uni_modules/uni-badge/components/uni-badge/uni-badge-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('543d')['createComponent'](__webpack_require__("a90e"))
        })
    },
    [['uni_modules/uni-badge/components/uni-badge/uni-badge-create-component']]
]);
