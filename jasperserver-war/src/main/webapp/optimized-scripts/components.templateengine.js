jaspersoft.components.templateEngine=function(t,e,n){return{render:function(t,r,a){if(!a)return n.to_html(t,r);if(a==this.STD_PLACEHOLDERS){var o=String(t);return e.each(r,function(t,e){var n=new RegExp("\\{"+e+"\\}");o=o.replace(n,t)}),o}},renderUrl:function(t,e,r){var a=n.to_html(t,e);return r&&(a=encodeURI(a)),a},getTemplateText:function(e){var n=t("#"+e);return n.html()},createTemplate:function(e){var r=t("#"+e),a=r.html();return a&&a.length>0?function(t){return n.to_html(a,t)}:void 0},createTemplateFromText:function(t){return t&&t.length>0?function(e){return n.to_html(t,e)}:void 0},createTemplateSection:function(t,e){var r="\\{\\{#val\\}\\}(\\s|\\S)*\\{\\{/val\\}\\}",a=r.replace(/val/g,t),o=new RegExp(a,"g"),u=this.getTemplateText(e),c=u.match(o)[0];return function(t){return n.to_html(c,t)}},STD_PLACEHOLDERS:"std_placeholder"}}(jQuery,_,Mustache);