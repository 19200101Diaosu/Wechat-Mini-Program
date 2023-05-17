(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/test-actions/test-actions"],{"7dd2":function(t,n,e){"use strict";var u;e.d(n,"b",(function(){return r})),e.d(n,"c",(function(){return a})),e.d(n,"a",(function(){return u}));var r=function(){var t=this,n=t.$createElement;t._self._c},a=[]},"92fa":function(t,n,e){"use strict";var u=e("f814"),r=e.n(u);r.a},"9e32":function(t,n,e){"use strict";Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var u={name:"test-actions",props:{current:{type:Number,default:1},total:{type:Number,default:1},showSubmit:{type:Boolean,default:!0}},data:function(){return{}},methods:{submit:function(){this.$emit("submit")},next:function(){this.current>=this.total||this.$emit("on-page",this.current+1)},pre:function(){this.current<=1||this.$emit("on-page",this.current-1)}}};n.default=u},a07d:function(t,n,e){"use strict";e.r(n);var u=e("7dd2"),r=e("c3e2");for(var a in r)"default"!==a&&function(t){e.d(n,t,(function(){return r[t]}))}(a);e("92fa");var i,c=e("f0c5"),o=Object(c["a"])(r["default"],u["b"],u["c"],!1,null,null,null,!1,u["a"],i);n["default"]=o.exports},c3e2:function(t,n,e){"use strict";e.r(n);var u=e("9e32"),r=e.n(u);for(var a in u)"default"!==a&&function(t){e.d(n,t,(function(){return u[t]}))}(a);n["default"]=r.a},f814:function(t,n,e){}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/test-actions/test-actions-create-component',
    {
        'components/test-actions/test-actions-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('543d')['createComponent'](__webpack_require__("a07d"))
        })
    },
    [['components/test-actions/test-actions-create-component']]
]);
