 /* THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
!function(e,r){"function"==typeof define&&define.amd?define([],r):"object"==typeof module&&module.exports?module.exports=r():e.fuzzysort=r()}(this,function e(){var r="undefined"!=typeof require&&"undefined"==typeof window,n=new Map,o=new Map,t=[];t.total=0;var a=[],i=[];function l(){n.clear(),o.clear(),a=[],i=[]}function $(e){for(var r=-9007199254740991,n=e.length-1;n>=0;--n){var o=e[n];if(null!==o){var t=o.score;t>r&&(r=t)}}return -9007199254740991===r?null:r}function f(e,r){var n=e[r];if(void 0!==n)return n;var o=r;Array.isArray(r)||(o=r.split("."));for(var t=o.length,a=-1;e&&++a<t;)e=e[o[a]];return e}function u(e){return"object"==typeof e}var s=function(){var e=[],r=0,n={};function o(){for(var n=0,o=e[n],t=1;t<r;){var a=t+1;n=t,a<r&&e[a].score<e[t].score&&(n=a),e[n-1>>1]=e[n],t=1+(n<<1)}for(var i=n-1>>1;n>0&&o.score<e[i].score;i=(n=i)-1>>1)e[n]=e[i];e[n]=o}return n.add=function(n){var o=r;e[r++]=n;for(var t=o-1>>1;o>0&&n.score<e[t].score;t=(o=t)-1>>1)e[o]=e[t];e[o]=n},n.poll=function(){if(0!==r){var n=e[0];return e[0]=e[--r],o(),n}},n.peek=function(n){if(0!==r)return e[0]},n.replaceTop=function(r){e[0]=r,o()},n},p=s();return function e(c){var g={single:function(e,r,n){return e&&(u(e)||(e=g.getPreparedSearch(e)),r)?(u(r)||(r=g.getPrepared(r)),((n&&void 0!==n.allowTypo?n.allowTypo:!c||void 0===c.allowTypo||c.allowTypo)?g.algorithm:g.algorithmNoTypo)(e,r,e[0])):null},go:function(e,r,n){if(!e)return t;var o=(e=g.prepareSearch(e))[0],a=n&&n.threshold||c&&c.threshold||-9007199254740991,i=n&&n.limit||c&&c.limit||9007199254740991,l=(n&&void 0!==n.allowTypo?n.allowTypo:!c||void 0===c.allowTypo||c.allowTypo)?g.algorithm:g.algorithmNoTypo,s=0,d=0,v=r.length;if(n&&n.keys)for(var _=n.scoreFn||$,h=n.keys,x=h.length,w=v-1;w>=0;--w){for(var y=r[w],k=Array(x),T=x-1;T>=0;--T){var b=h[T],B=f(y,b);if(!B){k[T]=null;continue}u(B)||(B=g.getPrepared(B)),k[T]=l(e,B,o)}k.obj=y;var I=_(k);null!==I&&!(I<a)&&(k.score=I,s<i?(p.add(k),++s):(++d,I>p.peek().score&&p.replaceTop(k)))}else if(n&&n.key)for(var b=n.key,w=v-1;w>=0;--w){var y=r[w],B=f(y,b);if(B){u(B)||(B=g.getPrepared(B));var m=l(e,B,o);null!==m&&!(m.score<a)&&(m={target:m.target,_targetLowerCodes:null,_nextBeginningIndexes:null,score:m.score,indexes:m.indexes,obj:y},s<i?(p.add(m),++s):(++d,m.score>p.peek().score&&p.replaceTop(m)))}}else for(var w=v-1;w>=0;--w){var B=r[w];if(B){u(B)||(B=g.getPrepared(B));var m=l(e,B,o);null!==m&&!(m.score<a)&&(s<i?(p.add(m),++s):(++d,m.score>p.peek().score&&p.replaceTop(m)))}}if(0===s)return t;for(var C=Array(s),w=s-1;w>=0;--w)C[w]=p.poll();return C.total=s+d,C},goAsync:function(e,n,o){var a=!1,i=new Promise(function(i,l){if(!e)return i(t);var p=(e=g.prepareSearch(e))[0],d=s(),v=n.length-1,_=o&&o.threshold||c&&c.threshold||-9007199254740991,h=o&&o.limit||c&&c.limit||9007199254740991,x=(o&&void 0!==o.allowTypo?o.allowTypo:!c||void 0===c.allowTypo||c.allowTypo)?g.algorithm:g.algorithmNoTypo,w=0,y=0;function k(){if(a)return l("canceled");var s=Date.now();if(o&&o.keys)for(var c=o.scoreFn||$,T=o.keys,b=T.length;v>=0;--v){for(var B=n[v],I=Array(b),m=b-1;m>=0;--m){var C=T[m],L=f(B,C);if(!L){I[m]=null;continue}u(L)||(L=g.getPrepared(L)),I[m]=x(e,L,p)}I.obj=B;var P=c(I);if(null!==P&&!(P<_)&&(I.score=P,w<h?(d.add(I),++w):(++y,P>d.peek().score&&d.replaceTop(I)),v%1e3==0&&Date.now()-s>=10)){r?setImmediate(k):setTimeout(k);return}}else if(o&&o.key)for(var C=o.key;v>=0;--v){var B=n[v],L=f(B,C);if(L){u(L)||(L=g.getPrepared(L));var j=x(e,L,p);if(null!==j&&!(j.score<_)&&(j={target:j.target,_targetLowerCodes:null,_nextBeginningIndexes:null,score:j.score,indexes:j.indexes,obj:B},w<h?(d.add(j),++w):(++y,j.score>d.peek().score&&d.replaceTop(j)),v%1e3==0&&Date.now()-s>=10)){r?setImmediate(k):setTimeout(k);return}}}else for(;v>=0;--v){var L=n[v];if(L){u(L)||(L=g.getPrepared(L));var j=x(e,L,p);if(null!==j&&!(j.score<_)&&(w<h?(d.add(j),++w):(++y,j.score>d.peek().score&&d.replaceTop(j)),v%1e3==0&&Date.now()-s>=10)){r?setImmediate(k):setTimeout(k);return}}}if(0===w)return i(t);for(var N=Array(w),S=w-1;S>=0;--S)N[S]=d.poll();N.total=w+y,i(N)}r?setImmediate(k):k()});return i.cancel=function(){a=!0},i},highlight:function(e,r,n){if(null===e)return null;void 0===r&&(r="<b>"),void 0===n&&(n="</b>");for(var o="",t=0,a=!1,i=e.target,l=i.length,$=e.indexes,f=0;f<l;++f){var u=i[f];if($[t]===f){if(++t,a||(a=!0,o+=r),t===$.length){o+=u+n+i.substr(f+1);break}}else a&&(a=!1,o+=n);o+=u}return o},prepare:function(e){if(e)return{target:e,_targetLowerCodes:g.prepareLowerCodes(e),_nextBeginningIndexes:null,score:null,indexes:null,obj:null}},prepareSlow:function(e){if(e)return{target:e,_targetLowerCodes:g.prepareLowerCodes(e),_nextBeginningIndexes:g.prepareNextBeginningIndexes(e),score:null,indexes:null,obj:null}},prepareSearch:function(e){if(e)return g.prepareLowerCodes(e)},getPrepared:function(e){if(e.length>999)return g.prepare(e);var r=n.get(e);return void 0!==r||(r=g.prepare(e),n.set(e,r)),r},getPreparedSearch:function(e){if(e.length>999)return g.prepareSearch(e);var r=o.get(e);return void 0!==r||(r=g.prepareSearch(e),o.set(e,r)),r},algorithm:function(e,r,n){for(var o=r._targetLowerCodes,t=e.length,l=o.length,$=0,f=0,u=0,s=0;;){var p=n===o[f];if(p){if(a[s++]=f,++$===t)break;n=e[0===u?$:u===$?$+1:u===$-1?$-1:$]}if(++f>=l)for(;;){if($<=1)return null;if(0===u){var c=e[--$];if(n===c)continue;u=$}else{if(1===u)return null;n=e[($=--u)+1];var c=e[$];if(n===c)continue}f=a[(s=$)-1]+1;break}}var $=0,d=0,v=!1,_=0,h=r._nextBeginningIndexes;null===h&&(h=r._nextBeginningIndexes=g.prepareNextBeginningIndexes(r.target));var x=f=0===a[0]?0:h[a[0]-1];if(f!==l)for(;;)if(f>=l){if($<=0){if(++d>t-2)break;if(e[d]===e[d+1])continue;f=x;continue}--$,f=h[i[--_]]}else{var p=e[0===d?$:d===$?$+1:d===$-1?$-1:$]===o[f];if(p){if(i[_++]=f,++$===t){v=!0;break}++f}else f=h[f]}if(v)var w=i,y=_;else var w=a,y=s;for(var k=0,T=-1,b=0;b<t;++b){var f=w[b];T!==f-1&&(k-=f),T=f}v?0!==d&&(k+=-20):(k*=1e3,0!==u&&(k+=-20)),k-=l-t,r.score=k,r.indexes=Array(y);for(var b=y-1;b>=0;--b)r.indexes[b]=w[b];return r},algorithmNoTypo:function(e,r,n){for(var o=r._targetLowerCodes,t=e.length,l=o.length,$=0,f=0,u=0;;){var s=n===o[f];if(s){if(a[u++]=f,++$===t)break;n=e[$]}if(++f>=l)return null}var $=0,p=!1,c=0,d=r._nextBeginningIndexes;if(null===d&&(d=r._nextBeginningIndexes=g.prepareNextBeginningIndexes(r.target)),(f=0===a[0]?0:d[a[0]-1])!==l)for(;;)if(f>=l){if($<=0)break;--$,f=d[i[--c]]}else{var s=e[$]===o[f];if(s){if(i[c++]=f,++$===t){p=!0;break}++f}else f=d[f]}if(p)var v=i,_=c;else var v=a,_=u;for(var h=0,x=-1,w=0;w<t;++w){var f=v[w];x!==f-1&&(h-=f),x=f}p||(h*=1e3),h-=l-t,r.score=h,r.indexes=Array(_);for(var w=_-1;w>=0;--w)r.indexes[w]=v[w];return r},prepareLowerCodes:function(e){for(var r=e.length,n=[],o=e.toLowerCase(),t=0;t<r;++t)n[t]=o.charCodeAt(t);return n},prepareBeginningIndexes:function(e){for(var r=e.length,n=[],o=0,t=!1,a=!1,i=0;i<r;++i){var l=e.charCodeAt(i),$=l>=65&&l<=90,f=$||l>=97&&l<=122||l>=48&&l<=57,u=$&&!t||!a||!f;t=$,a=f,u&&(n[o++]=i)}return n},prepareNextBeginningIndexes:function(e){for(var r=e.length,n=g.prepareBeginningIndexes(e),o=[],t=n[0],a=0,i=0;i<r;++i)t>i?o[i]=t:(t=n[++a],o[i]=void 0===t?r:t);return o},cleanup:l,new:e};return g}()});