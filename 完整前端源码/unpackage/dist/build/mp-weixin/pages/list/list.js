(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/list/list"],{"08ce":function(t,e,n){"use strict";(function(t){n("90f6");o(n("66fd"));var e=o(n("0b04"));function o(t){return t&&t.__esModule?t:{default:t}}t(e.default)}).call(this,n("543d")["createPage"])},"0b04":function(t,e,n){"use strict";n.r(e);var o=n("1e20"),r=n("b831");for(var i in r)"default"!==i&&function(t){n.d(e,t,(function(){return r[t]}))}(i);var u,a=n("f0c5"),l=Object(a["a"])(r["default"],o["b"],o["c"],!1,null,null,null,!1,o["a"],u);e["default"]=l.exports},"1e20":function(t,e,n){"use strict";n.d(e,"b",(function(){return r})),n.d(e,"c",(function(){return i})),n.d(e,"a",(function(){return o}));var o={courseList:function(){return n.e("components/course-list/course-list").then(n.bind(null,"083b"))},uniLoadMore:function(){return n.e("uni_modules/uni-load-more/components/uni-load-more/uni-load-more").then(n.bind(null,"7a25"))}},r=function(){var t=this,e=t.$createElement;t._self._c},i=[]},b831:function(t,e,n){"use strict";n.r(e);var o=n("db43"),r=n.n(o);for(var i in o)"default"!==i&&function(t){n.d(e,t,(function(){return o[t]}))}(i);e["default"]=r.a},db43:function(t,e,n){"use strict";(function(t){function n(t){return u(t)||i(t)||r(t)||o()}function o(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}function r(t,e){if(t){if("string"===typeof t)return a(t,e);var n=Object.prototype.toString.call(t).slice(8,-1);return"Object"===n&&t.constructor&&(n=t.constructor.name),"Map"===n||"Set"===n?Array.from(t):"Arguments"===n||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)?a(t,e):void 0}}function i(t){if("undefined"!==typeof Symbol&&Symbol.iterator in Object(t))return Array.from(t)}function u(t){if(Array.isArray(t))return a(t)}function a(t,e){(null==e||e>t.length)&&(e=t.length);for(var n=0,o=new Array(e);n<e;n++)o[n]=t[n];return o}Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var l={data:function(){return{loadStatus:"loading",page:1,limit:10,list:[],module:"course"}},onLoad:function(e){e.module&&(this.module=e.module);var n={course:"课程",column:"专栏",flashsale:"秒杀",group:"拼团",live:"直播"};t.setNavigationBarTitle({title:n[this.module]+"列表"})},created:function(){this.getData()},computed:{tag:function(){return"course"==this.module||"column"==this.module||"live"==this.module?"":"group"==this.module?"拼团价":"秒杀价"}},onPullDownRefresh:function(){this.page=1,this.getData().finally((function(){t.stopPullDownRefresh()}))},onReachBottom:function(){this.handleLoadMore()},methods:{handleLoadMore:function(){"more"==this.loadStatus&&(this.page=this.page+1,this.getData())},getData:function(){var t=this,e=this.page,o={course:"getCourseList",column:"getColumnList",flashsale:"getFlashsale",group:"getGroup",live:"getLive"};return this.$api[o[this.module]]({page:this.page,limit:this.limit}).then((function(o){"live"==t.module&&(o.rows=o.rows.map((function(t){var e=new Date(t.start_time).getTime(),n=new Date(t.end_time).getTime(),o=Date.now();return t.status=e>o?"未开始":n<o?"已结束":"直播中",t.type="live",t}))),console.log(o),t.list=1==e?o.rows:[].concat(n(t.list),n(o.rows)),t.loadStatus=o.rows.length<t.limit?"noMore":"more"})).catch((function(n){t.loadStatus="more",e>1&&(t.page=t.page-1)}))}}};e.default=l}).call(this,n("543d")["default"])}},[["08ce","common/runtime","common/vendor"]]]);