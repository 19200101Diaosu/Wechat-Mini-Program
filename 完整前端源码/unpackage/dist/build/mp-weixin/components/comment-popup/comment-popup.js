(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/comment-popup/comment-popup"],{"2fbe":function(n,t,e){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var u={name:"comment-popup",data:function(){return{content:""}},methods:{open:function(){this.$refs.popup.open()},send:function(){this.$emit("send",this.content),this.$refs.popup.close(),this.content=""}}};t.default=u},6803:function(n,t,e){"use strict";e.r(t);var u=e("eab5"),o=e("bd5c");for(var c in o)"default"!==c&&function(n){e.d(t,n,(function(){return o[n]}))}(c);var i,r=e("f0c5"),p=Object(r["a"])(o["default"],u["b"],u["c"],!1,null,null,null,!1,u["a"],i);t["default"]=p.exports},bd5c:function(n,t,e){"use strict";e.r(t);var u=e("2fbe"),o=e.n(u);for(var c in u)"default"!==c&&function(n){e.d(t,n,(function(){return u[n]}))}(c);t["default"]=o.a},eab5:function(n,t,e){"use strict";e.d(t,"b",(function(){return o})),e.d(t,"c",(function(){return c})),e.d(t,"a",(function(){return u}));var u={uniPopup:function(){return Promise.all([e.e("common/vendor"),e.e("uni_modules/uni-popup/components/uni-popup/uni-popup")]).then(e.bind(null,"e3cb"))}},o=function(){var n=this,t=n.$createElement;n._self._c},c=[]}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/comment-popup/comment-popup-create-component',
    {
        'components/comment-popup/comment-popup-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('543d')['createComponent'](__webpack_require__("6803"))
        })
    },
    [['components/comment-popup/comment-popup-create-component']]
]);
