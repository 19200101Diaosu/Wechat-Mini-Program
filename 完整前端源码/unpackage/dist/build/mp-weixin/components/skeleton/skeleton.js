(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/skeleton/skeleton"],{"5e85":function(t,e,n){"use strict";n.r(e);var r=n("a0c0"),u=n("a8e6");for(var a in u)"default"!==a&&function(t){n.d(e,t,(function(){return u[t]}))}(a);var c,o=n("f0c5"),i=Object(o["a"])(u["default"],r["b"],r["c"],!1,null,null,null,!1,r["a"],c);e["default"]=i.exports},a0c0:function(t,e,n){"use strict";var r;n.d(e,"b",(function(){return u})),n.d(e,"c",(function(){return a})),n.d(e,"a",(function(){return r}));var u=function(){var t=this,e=t.$createElement;t._self._c},a=[]},a8e6:function(t,e,n){"use strict";n.r(e);var r=n("d83d"),u=n.n(r);for(var a in r)"default"!==a&&function(t){n.d(e,t,(function(){return r[t]}))}(a);e["default"]=u.a},d83d:function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var r={name:"skeleton",props:{width:{type:[Number,String],default:0},height:{type:[Number,String],default:0},circle:{type:Boolean,default:!1},oClass:{type:String,default:""}},computed:{getStyle:function(){return"width:".concat(this.width,";height:").concat(this.height,";")},getClass:function(){var t="";return this.circle&&(t+="rounded-circle"),"".concat(t," ").concat(this.oClass)}},data:function(){return{}}};e.default=r}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/skeleton/skeleton-create-component',
    {
        'components/skeleton/skeleton-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('543d')['createComponent'](__webpack_require__("5e85"))
        })
    },
    [['components/skeleton/skeleton-create-component']]
]);
