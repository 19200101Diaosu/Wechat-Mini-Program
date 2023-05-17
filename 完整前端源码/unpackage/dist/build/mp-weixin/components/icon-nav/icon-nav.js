(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/icon-nav/icon-nav"],{4204:function(e,t,n){"use strict";var a;n.d(t,"b",(function(){return o})),n.d(t,"c",(function(){return u})),n.d(t,"a",(function(){return a}));var o=function(){var e=this,t=e.$createElement;e._self._c},u=[]},"4c7d":function(e,t,n){"use strict";(function(e){Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var n={name:"icon-nav",props:{list:Array},data:function(){return{}},methods:{open:function(t){if(console.log(t),"webview"!=t.type)switch(t.module){case"test":e.navigateTo({url:"/pages/test-list/test-list"});break;case"bbs":e.navigateTo({url:"/pages/bbs/bbs"});break;case"book":e.navigateTo({url:"/pages/book-list/book-list"});break;default:e.navigateTo({url:"/pages/list/list?module="+t.module});break}else this.$openWebview(t.url)}}};t.default=n}).call(this,n("543d")["default"])},bbfb:function(e,t,n){"use strict";n.r(t);var a=n("4204"),o=n("cc8c");for(var u in o)"default"!==u&&function(e){n.d(t,e,(function(){return o[e]}))}(u);var c,r=n("f0c5"),i=Object(r["a"])(o["default"],a["b"],a["c"],!1,null,null,null,!1,a["a"],c);t["default"]=i.exports},cc8c:function(e,t,n){"use strict";n.r(t);var a=n("4c7d"),o=n.n(a);for(var u in a)"default"!==u&&function(e){n.d(t,e,(function(){return a[e]}))}(u);t["default"]=o.a}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/icon-nav/icon-nav-create-component',
    {
        'components/icon-nav/icon-nav-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('543d')['createComponent'](__webpack_require__("bbfb"))
        })
    },
    [['components/icon-nav/icon-nav-create-component']]
]);
