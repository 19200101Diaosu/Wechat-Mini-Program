(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/book-list/book-list"],{"0c79":function(t,e,n){"use strict";var o=n("97f0"),u=n.n(o);u.a},"0c8f":function(t,e,n){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n={media:"图文",audio:"音频",video:"视频",column:"专栏"},o={name:"course-list",props:{item:Object,type:{type:String,default:"two"},disabled:{type:Boolean,default:!1}},filters:{formatType:function(t){return n[t]}},computed:{issub:function(){return"number"==typeof this.item.sub_count}},data:function(){return{}},methods:{openDetail:function(){this.disabled||t.navigateTo({url:"/pages/book-detail/book-detail?id="+this.item.id})}}};e.default=o}).call(this,n("543d")["default"])},6896:function(t,e,n){"use strict";n.r(e);var o=n("afd0"),u=n("ec4d");for(var i in u)"default"!==i&&function(t){n.d(e,t,(function(){return u[t]}))}(i);n("0c79");var a,r=n("f0c5"),c=Object(r["a"])(u["default"],o["b"],o["c"],!1,null,null,null,!1,o["a"],a);e["default"]=c.exports},"97f0":function(t,e,n){},afd0:function(t,e,n){"use strict";var o;n.d(e,"b",(function(){return u})),n.d(e,"c",(function(){return i})),n.d(e,"a",(function(){return o}));var u=function(){var t=this,e=t.$createElement,n=(t._self._c,t._f("formatType")(t.item.type));t.$mp.data=Object.assign({},{$root:{f0:n}})},i=[]},ec4d:function(t,e,n){"use strict";n.r(e);var o=n("0c8f"),u=n.n(o);for(var i in o)"default"!==i&&function(t){n.d(e,t,(function(){return o[t]}))}(i);e["default"]=u.a}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/book-list/book-list-create-component',
    {
        'components/book-list/book-list-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('543d')['createComponent'](__webpack_require__("6896"))
        })
    },
    [['components/book-list/book-list-create-component']]
]);
