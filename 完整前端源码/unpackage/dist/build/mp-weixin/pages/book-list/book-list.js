(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/book-list/book-list"],{"33e6":function(t,n,e){"use strict";(function(t){function e(t){return a(t)||i(t)||r(t)||o()}function o(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}function r(t,n){if(t){if("string"===typeof t)return u(t,n);var e=Object.prototype.toString.call(t).slice(8,-1);return"Object"===e&&t.constructor&&(e=t.constructor.name),"Map"===e||"Set"===e?Array.from(t):"Arguments"===e||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)?u(t,n):void 0}}function i(t){if("undefined"!==typeof Symbol&&Symbol.iterator in Object(t))return Array.from(t)}function a(t){if(Array.isArray(t))return u(t)}function u(t,n){(null==n||n>t.length)&&(n=t.length);for(var e=0,o=new Array(n);e<n;e++)o[e]=t[e];return o}Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var l={data:function(){return{loadStatus:"loading",page:1,limit:10,list:[]}},created:function(){this.getData()},onPullDownRefresh:function(){this.refresh()},onReachBottom:function(){this.handleLoadMore()},methods:{refresh:function(){this.page=1,this.getData().finally((function(){t.stopPullDownRefresh()}))},handleLoadMore:function(){"more"==this.loadStatus&&(this.page=this.page+1,this.getData())},getData:function(){var t=this,n=this.page;return this.$api.getBookList({page:this.page,limit:this.limit}).then((function(o){console.log(o),t.list=1==n?o.rows:[].concat(e(t.list),e(o.rows)),t.loadStatus=o.rows.length<t.limit?"noMore":"more"})).catch((function(e){t.loadStatus="more",n>1&&(t.page=t.page-1)}))}}};n.default=l}).call(this,e("543d")["default"])},"4d67":function(t,n,e){"use strict";e.r(n);var o=e("33e6"),r=e.n(o);for(var i in o)"default"!==i&&function(t){e.d(n,t,(function(){return o[t]}))}(i);n["default"]=r.a},"68e8":function(t,n,e){"use strict";e.d(n,"b",(function(){return r})),e.d(n,"c",(function(){return i})),e.d(n,"a",(function(){return o}));var o={bookList:function(){return e.e("components/book-list/book-list").then(e.bind(null,"6896"))},uniLoadMore:function(){return e.e("uni_modules/uni-load-more/components/uni-load-more/uni-load-more").then(e.bind(null,"7a25"))}},r=function(){var t=this,n=t.$createElement;t._self._c},i=[]},"6d6c":function(t,n,e){"use strict";(function(t){e("90f6");o(e("66fd"));var n=o(e("72d4"));function o(t){return t&&t.__esModule?t:{default:t}}t(n.default)}).call(this,e("543d")["createPage"])},"72d4":function(t,n,e){"use strict";e.r(n);var o=e("68e8"),r=e("4d67");for(var i in r)"default"!==i&&function(t){e.d(n,t,(function(){return r[t]}))}(i);var a,u=e("f0c5"),l=Object(u["a"])(r["default"],o["b"],o["c"],!1,null,null,null,!1,o["a"],a);n["default"]=l.exports}},[["6d6c","common/runtime","common/vendor"]]]);