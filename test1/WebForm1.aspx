<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="test1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>

        function f10() {
            console.log(typeof "123");
            console.log(typeof 123);
            console.log(typeof true);
            console.log(typeof null);
            console.log(typeof f9);
        }

        var geval = eval;
        var x = "global", y = "global";
        function f7() {
            var x = "local";
            eval("x+='changed';");
            return x;
        }
        function f8() {
            var y = "local";
            geval("y+='changed';");
            return y;
        }
        function f9() {
            console.log(f7(), x);
            console.log(f8(), y);
        }

        function f6_1() {
            console.log(f6("3*9"));
        }

        function f6(a) {
            var x = a;
            return eval(x);
        }

        function f5() {
            var i = 7;
            console.log(eval(33));
        }

        function f4() {
            var a = [1, 2, 3];
            var i = 0;
            a[i++] = a[i++] *7;
            console.log(a);
        }


        function f3() {
            var o = { x: 0 };
            var p = null;
            console.log(o && o.x);
            console.log(p && p.x);
        }

        function f2() {
            var d = new Date();
            console.log(d instanceof Date);
            console.log(d instanceof Object);
            console.log(d instanceof Number);

            var a = [1,2,3];
            console.log(a instanceof Array);
            console.log(a instanceof Object);
            console.log(a instanceof RegExp);
        }

        function f1() {
            var point = { x: 1, y: 1 };          
            console.log("x" in point);
            console.log("z" in point);
            console.log("toString" in point);

            var data =[7,8,9];
            console.log("0" in data);
            console.log(1 in data);
            console.log(3 in data);
            console.log("toString" in data);
        }

        function f11() {
            var o = { x: 1, y: 2 };
            console.log(delete o.x);
            console.log("x" in o);

            var a = [1, 2, 3];
            console.log(delete a);
            console.log(2 in a);
            console.log(a.length);
        }

        function f12() {
            var o = { x: 77, y: 99 };
            for(var p in o)
            {
                console.log(p);
            }
        }

        function f13() {
            var o = { x: 77, y: 99, z: 66 };
            var a = [], i = 0;
            for (a[i++] in o); 
            for (i in a) console.log(i);
        }

        function factorial(x) {
            if (x < 0) throw new Error("x不能为负数");
            for (var f = 1; x > 1; f *= x, x--);
            return f;
        }

        function f14() {
            try {
                var n = Number(prompt("请输入一个正整数",""));
                var f = factorial(n);
                alert(n+"!="+f);
            }
            catch(ex)
            {
                alert(ex);
                
            }
            finally
            {
                
            }
        
        }

        function f15() {
            var o = {};
            o.x = 55;
            console.log(o.x);
            with(o)
            {
                x = 33;
            }
            console.log(o.x);
        }

        function f16(o) {
            if (o === undefined) debugger;
            console.log("123");
        }

        function f17() {
            "use strict";  
            console.log(this);
        }

        function inherit(p) {
            if (p == null) throw TypeError();
            if (Object.create)
                return Object.create(p);
            var t = typeof p;
            if (t !== "object" && t !== "function") throw TypeError();
            function f() { }
            f.prototype = p;
            return new f();
        }

        function f18() {
            var o = {};
            o.x = 1;
            var p = inherit(o);
            p.y = 2;
            var q = inherit(p);
            q.z = 3;
            q.x = 10;
            var s = q.toString();
            console.log(s);
            console.log(q.x + q.y);
            console.log(q.x +","+ o.x);
        }

        function f19() {
            "use strict";
            Object.prototype = 0;
        }

        function f20() {
            var a = { p: { x: 1 } };
            b = a.p;
            console.log(delete a.p);
            console.log(b.x);
        }

        var ga = {};
        gb = {};
        function f21() {
            var a = {};
            b = {};
            console.log(delete a);
            console.log(delete b);
            console.log(delete this.ga);
            console.log(delete gb);
            
        }

        function f22() {
            var o = { x: 1 };
            console.log("x" in o);
            console.log("y" in o);
            console.log("toString" in o);

            console.log(o.hasOwnProperty("x"));
            console.log(o.hasOwnProperty("y"));
            console.log(o.hasOwnProperty("toString"));
        }

        function f23() {
            var o = inherit({ y: 2 });
            o.x = 1;
            console.log(o.propertyIsEnumerable("x"));
            console.log(o.propertyIsEnumerable("y"));
            console.log(o.propertyIsEnumerable("toString"));
        }

        function f24() {
            var o = { x: 1, y: 2, z: 3 };
            var arr = Object.keys(o);
            console.log(arr);
        }

        function f25() {
            var o = { x: 1, y: 2, z: 3 };
            var arr = Object.getOwnPropertyNames(o);
            console.log(arr);
        }

        function f26() {
            var p = {
                x: 1.0,
                y:1.0,

                get r() { return Math.sqrt(this.x * this.x + this.y * this.y);},
                set r(newvalue) {
                    var oldvalue = Math.sqrt(this.x * this.x + this.y * this.y);
                    var ratio = newvalue / oldvalue;
                    this.x *= ratio;
                    this.y *= ratio;
                },

                get theta() {
                    return Math.atan2(this.y,this.x);
                }
            };
            
            var q = inherit(p);
            q.x = 5, q.y = 5;
            console.log(p.x + "," + p.y);
            console.log(q.x + "," + q.y);
            console.log(q.r);
            console.log(q.theta);

        }

        function f27() {
            var serialnum = {
                $n: 0,
                get next() { return this.$n; },
                set next(n)
                {
                    if (n >= this.$n) this.$n = n;
                    else throw "序号的值不能比当当前的值小";
                }
            };
            console.log(serialnum.next);
            serialnum.next = 5;
            try {
                serialnum.next = 3;
            }
            catch (ex) {
                alert(ex.name + "," + ex.message);
            }
        }

        function f28() {
            var obj = { x: 1 };
            var propertyDes = Object.getOwnPropertyDescriptor(obj, "x");
            console.log(propertyDes);

            var serialnum = {
                $n: 0,
                get next() { return this.$n; },
                set next(n) {
                    if (n >= this.$n) this.$n = n;
                    else throw "序号的值不能比当当前的值小";
                }
            };
            propertyDes = Object.getOwnPropertyDescriptor(serialnum, "next");
            console.log(propertyDes);
        }

        function f29() {
            var o = {};
            Object.defineProperty(o, "x", {
                value: 1,
                writable: true,
                enumerable: false,
                configuration:true
            });
            console.log(o.x);
            for (var v in Object.keys(o)) {
                console.log(v); 
            }
            Object.defineProperty(o, "x", { writable: false });
            o.x = 2;
            console.log(o.x);

            //Object.defineProperty(o, "x", { value: 2 });
            //console.log(o.x);

            Object.defineProperty(o, "xx", { get: function () { return 66; } });
            console.log(o.xx);
        }

        function f30() {
            Object.defineProperty(Object.prototype, "extend", {
                writable: true,
                enumerable: false,
                configurable: true,
                value: function (o) {
                    var names = Object.getOwnPropertyNames(o);
                    for (var i = 0; i < names.length; i++) {
                        if (names[i] in this) continue;
                        var desc = Object.getOwnPropertyDescriptor(o, names[i]);
                        Object.defineProperty(this, names[i], desc);
                    }
                }
            });
            var obj1 = {};
            var obj2 = { x: 1, y: 2, z: 3, get sum() { return x + y + z;} };
            obj1.extend(obj2);
            console.log(obj1);
        }

        function f31() {
            var p = { x: 1 };
            var o = Object.create(p);
            console.log(p.isPrototypeOf(o));
            console.log(Object.prototype.isPrototypeOf(p));
            console.log(o.__proto__);
        }

        function classof(o)
        {
            if (0 === null) return "Null";
            if (0 === undefined) return "Undefined";
            return Object.prototype.toString.call(o).slice(8,-1);
        }

        function f32() {
            console.log(classof(""));
            console.log(classof(1));
            console.log(classof(false));
            console.log(classof({}));
            console.log(classof([]));
        }

        function f33() {
            "use strict";
            var o = { x: 1, set tt(value) { this.x = value; }, get tt() { return this.x; } };
            console.log(Object.isExtensible(o));
            o.y = 2;
            Object.preventExtensions(o);
            console.log(Object.isExtensible(o));
            //o.z = 3;
            var PropertyName = Object.getOwnPropertyNames(o);
            for(var i=0;i<PropertyName.length;i++)
            {
                var des = Object.getOwnPropertyDescriptor(o, PropertyName[i]);
                console.log(des);
            }
            console.log(Object.isSealed(o));
            Object.seal(o);
            console.log(Object.isSealed(o));
            var PropertyName = Object.getOwnPropertyNames(o);
            for (var i = 0; i < PropertyName.length; i++) {
                var des = Object.getOwnPropertyDescriptor(o, PropertyName[i]);
                console.log(des);
            }
            console.log(Object.isFrozen(o));
            Object.freeze(o);
            console.log(Object.isFrozen(o));
            var PropertyName = Object.getOwnPropertyNames(o);
            for (var i = 0; i < PropertyName.length; i++) {
                var des = Object.getOwnPropertyDescriptor(o, PropertyName[i]);
                console.log(des);
            }

        }

        function f34() {
            var obj = Object.create({ x: 1 }, { y: {value:2,writable:true}});
        }

        function f35() {
            var o = { x: 1, y: { z: [false, null, ""] } };
            s = JSON.stringify(o);
            console.log(s);
            p = JSON.parse(s);
            console.log(p);
        }

        function f36() {
            var o = Object.create({}, { x: { value: 1, enumerable: true }, y: { value: 2, enumerable: false }, z: { value: 3, enumerable: true } });
            var s = JSON.stringify(o, ["x", "z"]); 
            console.log(s);
            var p = JSON.parse(s);
            console.log(p);
        }

        function f37() {
            var o = Object.create({}, { x: { value: 1, enumerable: true }, y: { value: 2, enumerable: false }, z: { value: 3, enumerable: true } });
            var s = JSON.stringify(o, ["x", "z"]);
            console.log(s);
            var p = JSON.parse(s);
            console.log(p);
        }

        function f38() {
            var a = [];
            a[1] = 1;
            a[3] = 3;
            console.log(a.length);
        }

        function f39() {
            var a = [];
            a[-1.23] = true;
            console.log(a["-1.23"]);
            a["1000"] = 0;
            console.log(a.length);
        }

        function f40() {
            var a1 = [1,,3];
            var a2 = new Array(3);
            console.log(1 in a1);
            console.log(0 in a2);
            console.log(a1.length);
            console.log(a2.length);
        }

        function f41() {
            var a = [1, 2, 3, 4, 5];
            console.log(a);
            a.length = 3;
            console.log(a);
            a.length = 0;
            console.log(a);
            a.length = 5;
            console.log(a);
        }

        function f42() {
            var a = [1, 2, 3];
            Object.defineProperty(a, "length", { writable: false });
            a.length = 0;
            console.log(a);
            a[4] = 5;
            console.log(a);
        }

        function f43() {
            var a = [1, 2, 3];
            Object.seal(a);
            a.length = 0;
            console.log(a);
            a[4] = 5;
            console.log(a);
        }

        function f44() {
            var a = [1, 2, 3];
            a.push(4, 5, 6);
            console.log(a);
            a.pop();
            console.log(a);
            a.shift();
            console.log(a);
            a.unshift(-1);
            console.log(a);
        }

        function f45() {
            var a = [1, null, 3,undefined];
            for (var i = 0, len = a.length; i < len; i++)
            {
                if (!a[i]) continue;
                console.log(a[i]);
            }
        }

        function f46() {
            var a = [1, null, 3, undefined];
            for (var i = 0, len = a.length; i < len; i++) {
                if (a[i]===undefined) continue;
                console.log(a[i]);
            }
        }

        function f47() {
            var a = [1, null, 3, undefined];
            delete a[2];
            for (var i = 0, len = a.length; i < len; i++) {
                if (!(i in a)) continue;
                console.log(a[i]);
            }
        }

        function f48() {
            var a = [1, null, 3, undefined];
            a[1.23] = 6;
            //delete a[2];
            for (var i in a)
            {
                if (String(Math.floor(Math.abs(Number(i)))) !== i) continue;
                console.log(a[i]);
            }
        }

        function f49() {
            var a = [1, 2, 3, 4,5];
            var sum = 0;
            a.forEach(function (x) {
                sum += x * x;
            });
            console.log(sum);
        }

        function f50() {
            var table = new Array(10);
            for (var i = 0; i < table.length; i++)
                table[i] = new Array(10);
            for(var row=0,rowLen=table.length;row<rowLen;row++)
            {
                for(var col=0,colLen=table[row].length;col<colLen;col++)
                {
                    table[row][col] = row * col;
                }
            }
            var res = table[5][7];
            console.log(res);
        }

        function f51() {
            var a = [1,2,3];
            console.log(a.join());
            console.log(a.join(" "));
            console.log(a.join(""));
            var b = new Array(10);
            console.log(b.join("-"));
            var s = "7,8,9";
            var arr = s.split(',',2);
            console.log(arr);
        }

        function f52() {
            var a = [1, 2, 3];
            console.log(a.reverse());

        }

        function f53() {
            var a = ["banana", "cherry", "apple"];
            a.sort();
            console.log(a);

        }

        function f54() {
            var a = [33,4,111,222];
            a.sort();
            console.log(a);
            a.sort(function (a, b) {
                return a - b;
            });
            console.log(a);
            a.sort(function (a, b) {
                return b - a;
            });
            console.log(a);
        }

        function f55() {
            var a = ["ant","Bug","cat","Dog"];
            a.sort();
            console.log(a);
            a.sort(function (s,t) {
                var a = s.toLowerCase();
                var b = t.toLowerCase();
                if (a < b) return -1;
                if (a > b) return 1;
                return 0;
            });
            console.log(a);
        }

        function f56() {
            var a = [1,2,3];
            a.concat(4,5);
            console.log(a.concat(4, 5));
            console.log(a.concat([4, 5]));
            console.log(a.concat([4, 5], [6, 7]));
            console.log(a.concat(4, [5, [6, 7]]));
        }

        function f57() {
            var a = [1, 2, 3,4,5];
            console.log(a.slice(0,3));
            console.log(a.slice(3));
            console.log(a.slice(1, -1));
            console.log(a.slice(-3, -2));
        }

        function f58() {
            var a = [1, 2, 3, 4, 5, 6, 7, 8];
            console.log(a.splice(4));
            console.log(a);
            console.log(a.splice(1,2));
            console.log(a);
            console.log(a.splice(1, 1));
            console.log(a);
        }

        function f59() {
            var a = [1, 2, 3, 4, 5];
            console.log(a.splice(2,0,'a','b'));
            console.log(a);
            console.log(a.splice(2, 2,[1,2], 3));
            console.log(a);
        }

        function f60() {
            var a = [];
            console.log(a.unshift(1));
            console.log(a.unshift(22));
            console.log(a.unshift(3,[4,5]));
            console.log(a.shift());
        }

        function f61() {
            var a = [4,5,6];
            console.log(a);
            console.log(a.toString());
            console.log(a.join());
            console.log(a.toLocaleString());
        }

        function f62() {
            var a = [1, 2, 3, 4, 5];
            var sum = 0;
            a.forEach((x) => { sum += x; });
            console.log(sum);
            a.forEach((x, i, o) => { o[i] = x + 1; });
            console.log(a.toString());
        }

        function f63() {
            var a = [1, 2, 3, 4, 5];
            var sum = 0;
            try {
                a.forEach((x) => {
                    if (x > 4) throw new Error("StopIteration");
                    sum += x;
                });
            }
            catch (ex) {
                console.log(ex.name+","+ex.message);
            }
            finally
            {
                console.log(sum);
            }
        }

        function f64() {
            var a = [1, 2, 3, 4, 5];
            var b = a.map((x) => { return x * x });
            console.log(b);
        }

        function f65() {
            var a = [1, 2, 3, 4, 5];
            var b = a.filter((x) => { return x < 3;});
            console.log(b);
            b = a.filter((x,i) => { return i%2==0; });
            console.log(b);
        }

        function f66() {
            var a = [1, null, 3, undefined, 5];
            delete a[2];
            var b = a.filter((x) => { return true; });
            console.log(b);
            b = a.filter((x) => { return x!==undefined && x!=null; });
            console.log(b);
        }

        function f67() {
            var a = [1,2,3,4,5];
            console.log(a.every((x) => { return x < 10;}));
            console.log(a.every((x) => { return x % 2 === 0; }));
        }

        function f68() {
            var a = [1, 2, 3, 4, 5];
            console.log(a.some((x) => { return x % 2 == 0; }));
            console.log(a.some(isNaN));
        }

        function f69() {
            var a = [1, 2, 3, 4, 5];
            console.log(a.reduce((a, b) => { return a > b?a:b;}));

            var b = [2];
            console.log(b.reduce((m, n) => { return m + n; }));

            var c = [];
            console.log(c.reduce((m, n) => { return m + n; },2));
        }

        function union(a,b) {
            for(var i in b)
            {
                if (i in a) continue;
                a[i] = b[i];
            }
            return a;
        }

        function f70() {
            var a = [{x:1}, {y:2}, {z:3}];
            console.log(a.reduce(union));

        }

        function f71() {
            var a = [0, 1, 2, 1, 0];
            console.log(a.indexOf(1));
            console.log(a.lastIndexOf(1));
            console.log(a.indexOf(3));
        }

        function findall(a,x)
        {
            var results = [],
                len = a.length,
                pos = 0;
            while(pos<len)
            {
                pos = a.indexOf(x, pos);
                if (pos === -1) break;
                results.push(pos);
                pos += 1;
            }
            return results;
        }

        function f72() {
            var a = [0, 1, 2, 1, 0];
            console.log(findall(a,1));
        }

        function f73() {
            var a = [0, 1, 2, 1, 0];
            var b = {};
            console.log(Array.isArray(a));
            console.log(Array.isArray(b));

            console.log(a instanceof Array);
            console.log(b instanceof Array);

            console.log(Object.prototype.toString.call(a));
            
        }

        function f74() {
            var a = {};
            var i = 0;
            while(i<10)
            {
                a[i] = i * i;
                i++;
            }
            a.length = i;
            var total = 0;
            for(var j=0;j<a.length;j++)
            {
                total += a[j];
            }
            console.log(total);
        }

        function f75()
        {
            var a = { "0": "a", "1": "b", "2": "c", length: 3 };
            console.log(Array.prototype.join.call(a, "+"));
            console.log(Array.prototype.slice.call(a, 0));
            console.log(Array.prototype.map.call(a, (x) => { return x.toUpperCase(); }));
        }

        
        function f76() {
            Array.join = Array.join || function (a, sep) { return Array.prototype.join.call(a, sep); };
            Array.slice = Array.slice || function (a, from, to) { return Array.prototype.slice.call(a, from, to); };
            Array.map = Array.map || function (a, f, thisArg) { return Array.prototype.map.call(a, f, thisArg); };

            var a = { "0": "a", "1": "b", "2": "c", length: 3 };
            console.log(Array.join(a, "+"));
            console.log(Array.slice(a, 0));
            console.log(Array.map(a, (x) => { return x.toUpperCase(); }));
        }

        function f77() {
            var s = "test";
            console.log(s.charAt(0));
            console.log(s[1]);
        }

        function f78() {
            var s = "test";
            console.log(Array.isArray(s));

        }

        function f79() {
            var s = "JavaScript";
            console.log(Array.prototype.join.call(s, "+"));
            console.log(Array.prototype.filter.call(s, (x) => { return x.match(/[^aeiou]/)}).join(""));

        }

        function f80() {
            var f = function fact(x) { if (x <= 1) return 1; else return x * fact(x - 1); };
            console.log(f(5));
        }

        function f81() {
            var res = function (x) { return x * x; }(5);
            console.log(res);
        }

        function f82() {
            var f82_1 = function (x) {
                return x * x;
            }
            var res = f82_1(5);

            //var f82_1 = function (x) {
            //    return x * x;
            //}
            console.log(res);
        }

        function f83() {
            //function f83_1(x) {
            //    return x * x;
            //}
            var res = f83_1(5);
            function f83_1(x) {
                return x * x;
            }
            console.log(res);
        }

        function f84() {
            "use strict"
            var strict = function () { return !this; }();
            console.log(strict);
        }

        function f85() {
            var calculator = {
                operand1: 1,
                operand2: 1,
                add:function()
                {
                    this.result=this.operand1+this.operand2
                }
            }
            calculator.add();
            console.log(calculator.result);
        }

        function f86() {
            var o = {
                m:function()
                {
                    var self = this;
                    console.log(this === o);
                    f();
                    function f()
                    {
                        console.log(this === o);
                        console.log(self === o);
                    }
                }
            };
            o.m();
        }

        function f87() {
            function getPropertyNames(o,a)
            {
                a = a || [];
                for(var property in o)
                {
                    a.push(property);
                }
                return a;
            }
            var o = { x: 1, y: 2, z: 3 };
            var p = { m: 8, n: 9};
            var a = getPropertyNames(o);
            console.log(a.toString());
            getPropertyNames(undefined, a);
            console.log(a);
        }

        function f88() {
            function f(x,y,z) {
                if(arguments.length!=3)
                {
                    throw new Error("function f called with "+arguments.length+
                        "argumnets,but it expects 3 arguments.");
                }
                console.log("hello");
            }
            try{
                f(1,2,3);
            }
            catch(ex)
            {
                console.log(ex.message);
            }
        }

        function f89() {
            function max(/*...*/) {
                var max = Number.NEGATIVE_INFINITY;
                for (var i = 0; i < arguments.length; i++) {
                    if (arguments[i] > max) max = arguments[i];
                }
                return max;
            }
            var largest = max(1, 10, 100, 2, 3, 1000, 4, 5, 10000, 6);
            console.log(largest);
        }

        function f90() {
            function f(x) {
                console.log(x);
                arguments[0] = null;
                console.log(x);
            }
            var largest = f(9, 10, 100, 2, 3, 1000, 4, 5, 10000, 6);
        }

        function f91() {
            var factorial=function(x)
            {
                if (x <= 1) return 1;
                return x * arguments.callee(x - 1);
            }
            console.log(factorial(5));
        }

        function f92() {
            function arraycopy(from,from_start,
                to,to_start,length)
            {
                if (!Array.isArray(from) && !isArrayLike(from)) { throw new Error("from isn't LikeArray!"); }
                if (Object.prototype.toString.call(to) !== "[object Array]" && !isArrayLike(from)) { throw new Error("to isn't LikeArray!"); }
                for(var i=0;i<length;i++)
                {
                    to[to_start + i] = from[from_start + i];
                }
            }
            function easycopy(args) {
                arraycopy(args.from,
                    args.from_start||0,
                    args.to,
                    args.to_start||0,args.length);
            }
            //var a = [1,2,3,4,5,6,7,8];
            //var b = [11,22,33,44,55];
            //try{
            //    easycopy({from:a,to:b,length:5});
            //    console.log(b);
            //}
            //catch(ex)
            //{
            //    console.log(ex.message);
            //}

            var a = { "0": 1, "1": 2, "2": 3, "3": 4 ,"length":4};
            var b = [11, 22, 33, 44, 55];
            try {
                easycopy({ from: a, to: b, length: 4 });
                console.log(b);
            }
            catch (ex) {
                console.log(ex.message);
            }
        }

        function isArrayLike(o)
        {
            if (o &&
                typeof o === "object" &&
                isFinite(o.length) &&
                o.length >= 0 &&
                o.length === Math.floor(o.length) &&
                o.length < 4294967296)
                return true;
            else {
                return false;
            }
        }

        function f93() 
        {
            function sum(a)
            {
                if (isArrayLike(a)) {
                    var total = 0;
                    for (var i = 0, len = a.length; i < len; i++) {
                        var element = a[i];
                        if (element == null) continue;
                        if (isFinite(element)) total += element;
                        else throw new Error("sum():element must be finite numbers");
                    }
                    return total;
                }
                else throw new Error("sum():argument must be array-like");
            }

            var a = [1, 2, 3, null, undefined, 4, 5];
            console.log(sum(a));
            var b = { "0": 1, "1": 2, "2": 3, "3": 4, "4": 5, "length": 5 };
            console.log(sum(b));
        }

        function f94()
        {
            function flexisum(a)
            {
                var total = 0;
                for (var i = 0, len = arguments.length; i<len;i++)
                {
                    var element = arguments[i], n = 0;;
                    if (element == null) continue;
                    if (isArrayLike(element))
                        n = flexisum.apply(this, element);
                    else if (typeof element === "function")
                        n = Number(element());
                    else
                        n = Number(element);
                    if (isNaN(n))
                        throw Error("flexisum():can't convert " + element + " to number");
                    total += n;
                }
                return total;
            }

            var a = [1, 2, 3, [4, 5]];
            var res = flexisum(a);
            console.log(res);
        }

        function f95()
        {
            var o = { square: function (x) { return x * x; } };
            var y = o.square(16);
            console.log(y);
        }

        function f96() {
            var a = [ function (x) { return x * x; },4 ];
            console.log(a[0](a[1]));
        }

        function f97() {
            function add(x, y) { return x + y; }
            function subtract(x, y) { return x - y; }
            function multiply(x, y) { return x * y; }
            function divide(x, y) { return x / y; }

            function operate(operator,operand1,operand2)
            {
                return operator(operand1, operand2);
            }

            var i = operate(add, operate(add, 2, 3), operate(multiply, 4, 5));
            console.log(i);
        }

        function f98() {
            var operators = {
                add: function (x, y) { return x + y; },
                subtract: function (x, y) { return x - y },
                multiply: function (x, y) { return x * y },
                divide: function (x, y) { return x * y },
                pow:Math.pow
            };

            function operate(operation,operand1,operand2)
            {
                if (typeof operators[operation] === "function")
                    return operators[operation](operand1, operand2);
                else
                    throw "Unknown operator";
            }

            var j = operate("add", "hello", " world");
            var k = operate("pow", 10, 2);
            console.log(j+","+k);
        }

        function f99()
        {
            uniqueInteger.counter = 0;
            function uniqueInteger()
            {
                return uniqueInteger.counter++;
            }
            console.log(uniqueInteger());
            console.log(uniqueInteger());
            console.log(uniqueInteger());
        }

        function f99() {
            function factorial(n)
            {
                if (isFinite(n) && n > 0 && n == Math.round(n)) {
                    if (!(n in factorial)) {
                        factorial[n] = n * factorial(n - 1);
                    }
                    return factorial[n];
                }
                else
                    return NaN;
            }
            factorial[1] = 1;
            console.log(factorial(5));
        }

        function f100() {
            var scope = "global scope";
            function checkscope()
            {
                var scope = "local scope";
                function f() { return scope; }
                return f;
            }
            console.log(checkscope()());
        }

        function f101() {
            var scope = (function () {
                var counter = 0;
                return function()
                {
                    return counter++;
                }
            }());
            console.log(scope());
            console.log(scope());
            console.log(scope());
        }

        function f102() {
            function counter() {
                var n = 0;
                return {
                    count: function () { return n++; },
                    reset: function () { n = 0; }
                };
            }
            var a = counter();
            var b = counter();
            console.log(a.count());
            console.log(b.count());
            console.log(a.reset());
            console.log(b.count());
            console.log(a.count());
        }

        function f103() {
            function counter(n) {
                return {
                    get count() { return n++; },
                    set count(m)
                    {
                        if (m >= n) n = m;
                        else throw Error("count can only be set to a larger value");
                    }
                };
            }
            var a = counter(1000);
            console.log(a.count);
            console.log(a.count);
            console.log(a.count=2000);
            console.log(a.count);
            console.log(a.count=2000);
        }

        function f104()
        {
            function addPrivateProperty(o,name,predicate)
            {
                var value;
                o["get" + name] = function () { return value; };
                o["set" + name] = function (v)
                {
                    if (predicate && !predicate(v))
                        throw Error("set" + name + ":invalid value " + v);
                    else
                        value = v;
                }
            }

            var o = {};
            addPrivateProperty(o, "Name", function (x) { return typeof x == "string"; });

            o.setName("Frank");
            console.log(o.getName());
            o.setName(0);
        }

        function f105()
        {
            function constfunc(v) { return function () { return v; }; }
            var funcs = [];
            for (var i = 0; i < 10; i++) funcs[i] = constfunc(i);
            console.log(funcs[5]());
        }

        function f106() {
            function constfuncs()
            {
                var funcs = [];
                for (var i = 0; i < 10; i++)
                {
                    funcs[i] = function () { return i;}
                }
                return funcs;
            }
            var funcs = constfuncs();
            console.log(funcs[5]());
        }

        function f107() {
            function check(args)
            {
                var actual = args.length;
                var expected = args.callee.length;
                if (actual !== expected)
                    throw Error("Expected "+expected+"args;got "+actual);
            }
            function f(x,y,z)
            {
                check(arguments);
                return x + y + z;
            }

            console.log(f(1,2,3,4));
        }

        function f108()
        {
            function f_max(args)
            {
                var biggest = Math.max.apply(Math, arguments);
                return biggest;
            }
            console.log(f_max(1,2,3,4,5));
        }

        function f109() {
            var o = {
                m: function () { return "hello " + arguments[0];}
            }
            function trace(o, m) {
                var original = o[m];
                o[m] = function ()
                {
                    console.log(new Date(), "Extering:", m);
                    var result = original.apply(this, arguments);
                    console.log(new Date(), "Extering:", m);
                    return result;
                }
            }
            console.log(o.m("world"));
            trace(o, "m");
            console.log(o.m("tt"));
        }

        function f110()
        {
            function f(y)
            {
                return this.x + y;
            }
            var o = { x: 1 };
            var g = f.bind(o);
            console.log(g(2));
        }

        function f111() {
            var sum = function (x, y) { return x + y; };
            var succ = sum.bind(null, 1);
            console.log(succ(2));

            function f(y, z) { return this.x + y + z }
            var g = f.bind({ x: 1 }, 2);
            console.log(g(3));
        }

        function f112() {
            if(!Function.prototype.bindEx)
            {
                Function.prototype.bindEx = function (o) {
                    var self = this;
                    var boundArgs = arguments;

                    return function()
                    {
                        var args = [], i;
                        for (i = 1; i < boundArgs.length; i++) args.push(boundArgs[i]);
                        for (i = 0; i < arguments.length; i++) args.push(arguments[i]);
                        return self.apply(o, args);
                    }
                }
            }
            function f(x,y,z)
            {
                return this.m + x + y + z;
            }
            var res = f.bindEx({ m: 6 }, 1, 2);
            console.log(res(7));
        }

        function f113()
        {
            var f = new Function("x", "y", "return x*y");
            console.log(f(2,3));
        }

        var scope = "global";
        function f114() {
            function constructFunction()
            {
                var scope = "local";
                return new Function("return scope");
            }
            console.log(constructFunction()());
        }

        function f115() {
            var sum = function (x, y) { return x + y; };
            var square = function (x) { return x * x; };
            var data = [1,1,3,5,5];

            var mean = data.reduce(sum) / data.length;
            var deviations = data.map((x) => { return x - mean; });
            var stddev = Math.sqrt(deviations.map(square).reduce(sum)) / (data.length-1);
            console.log(stddev);
        }

        function f116() {
            function not(f)
            {
                return function()
                {
                    var result = f.apply(this, arguments);
                    return !result;
                }
            }

            var even=function(x)
            {
                return x % 2 === 0;
            }

            var f = not(even);
            console.log([1,1,3,5,5].every(f));
        }

        function f117() {
            function mapper(f) {
                return function (a) {
                    return a.map(f);
                }
            }
            var increment = function (x) { return x + 1; }
            var incrementer = mapper(increment);
            console.log(incrementer([1, 2, 3]));
        }

        function f118() {
            function compose(f,g) {
                return function () {
                    return f.call(this, g.apply(this, arguments));
                }
            }
            var f = compose((x) => { return x * x;},
                (x, y) => { return x + y;});
            console.log(f(2,3));
        }

        function f119() {
            range.methods = {
                includes: function (x) {
                    return this.from <= x && x <= this.to;
                },
                foreach: function (f) {
                    for (var x = Math.ceil(this.from) ; x <=this.to; x++) f(x);
                },
                toString: function () { return "(" + this.from + "..." + this.to + ")"; }
            };

            function range(from,to)
            {
                var r = inherit(range.methods);
                r.from = from;
                r.to = to;
                return r;
            }

            var r = range(1, 3);
            console.log(r.includes(2));
            r.foreach(console.log);
            console.log(r.toString());
            console.log(r);
        }

        function Range(from, to) {
            this.from = from;
            this.to = to;
        }
        Range.prototype = {
            includes: function (x) {
                return this.from <= x && x <= this.to;
            },
            foreach: function (f) {
                for (var x = Math.ceil(this.from) ; x <= this.to; x++) f(x);
            },
            toString: function () { return "(" + this.from + "..." + this.to + ")"; }
        };
        Range.prototype.Status = true;
        
        function f120()
        {
            var r = new Range(1, 3);
            console.log(r.includes(2));
            r.foreach(console.log);
            console.log(r.toString());
            console.log(r);

            var r2 = new Range(4, 7);
            console.log(r2.includes(2));
            r2.foreach(console.log);
            console.log(r2.toString());
            console.log(r2);

            r.Status = false;
            r2.Status = true;

            console.log(r.Status);
            console.log(r2.Status);
        }

        function f121()
        {
            var F = function () { };
            var o = F.prototype;
            var c = o.constructor;
            console.log(c === F);

            var a = new F();
            console.log(a.constructor === F);
        }

        var extend = (function () {
            for (var p in { toString: null }) {
                return function extend(o) {
                    for (var i = 1; i < arguments.length; i++) {
                        var source = arguments[i];
                        for (var prop in source) o[prop] = source[prop];
                    }
                    return o;
                }
            }

            return function patched_extend(o) {
                for (var i = 1; i < arguments.length; i++) {
                    var source = arguments[i];
                    for (var prop in source) o[porp] = source[porp];

                    for (var j = 0; i < protoprops.length; j++) {
                        prop = protoprops[j];
                        if (source.hasOwnProperty(prop)) o[prop] = source[prop];
                    }
                }
                return o;
            };

            var protoprops = ["toString", "valueOf", "constructor", "hasOwnProperty",
            "isPrototypeOf", "propertyIsEnumerable", "toLocaleString"];
        }());

        function f122()
        {
            var obj = { a: 1, "b": 2, "toString": function () { return this.a + this.b; } };
            console.log(obj.a);
            console.log(obj.b);
            console.log(obj.toString());

            var obj2 = { c: 3, "d": 4, "toString": function () { return this.c + this.d; } };
            var objAll = extend(obj, obj2);
            console.log(objAll.a);
            console.log(objAll.b);
            console.log(objAll.c);
            console.log(objAll.d);
            console.log(objAll.toString());
        }

        function f123() {
            function defineClass(constructor,methods,statics)
            {
                if (methods) extend(constructor.prototype, methods);
                if (statics) extend(constructor, statics);
                return constructor;
            }

            var SimpleRange =
                defineClass(function (f, t) { this.f = f; this.t = t; },
                {
                    includes: function (x) { return this.f <= x && x <= this.t; },
                    toString: function () { return this.f + "..." + this.t;}
                },
                { upto: function (t) { return new SimpleRange(0, t); } });
            var obj =new SimpleRange(1, 4);
            console.log(obj.includes(2));
            console.log(obj.toString()); 
            var obj2 =SimpleRange.upto(9);
            console.log(obj2.includes(2));
            console.log(obj2.toString());         
        }

        function Complex(real, imaginary) {
            if (isNaN(real) || isNaN(imaginary))
                throw new TypeError();
            this.r = real;
            this.i = imaginary;
        }

        Complex.prototype.add = function (that) {
            return new Complex(this.r + that.r, this.i + that.i);
        };

        Complex.prototype.mul = function (that) {
            return new Complex(this.r * that.r - this.i * that.i, this.r * that.i + this.i * that.r);
        };

        Complex.prototype.mag = function () {
            return new Complex(this.r * that.r + this.i * that.i);
        }

        Complex.prototype.neg = function () {
            return new Complex(-this.r, -this.i);
        };

        Complex.prototype.toString = function () {
            return "{" + this.r + "," + this.i + "}";
        };

        Complex.prototype.equals = function (that) {
            return that != null && that.constructor===Complex && this.r===that.r && this.i===that.i;
        };

        Complex.ZERO = new Complex(0, 0);
        Complex.ONE = new Complex(1, 0);
        Complex.I = new Complex(0, 1);

        //Complex.parse = function (s) {
        //    try {
        //        var m = Complex._format.exec(s);
        //        return new Complex(parseFloat(m[1]), parseFloat(m[2]));
        //    }
        //    catch (x) {
        //        throw new TypeError("Can't parse '" + s + "' as a complex number.");
        //    }
        //};

        //Complex.format = /^\{([^,]+),([^}]+)\}$/;

        Complex.parse = (function () {
            var format = /^\{([^,]+),([^}]+)\}$/;
            return function(s)
            {
                try {
                    var m = format.exec(s);
                    return new Complex(parseFloat(m[1]), parseFloat(m[2]));
                }
                catch (x) {
                    throw new TypeError("Can't parse '" + s + "' as a complex number.");
                }
            }
        }());

        Complex.prototype.conj = function () { return new Complex(this.r, -this.i);};

        function f124()
        {
            var c = new Complex(2, 3);
            var d = new Complex(c.i, c.r);
            console.log(c.add(d).toString());
            console.log(Complex.parse(c.toString()).add(c.neg()).equals(Complex.ZERO));
        }

        function f125() {
            Number.prototype.times = function (f) {
                var n = Number(this);
                for (var i = 0; i < n; i++)
                    f.call(null,i);
            };

            var val = 7;
            val.times(function (n) { console.log(n + "hello"); });
        }

        function f126() {
            String.prototype.trimEx = function () {
                if (!this) return this;
                return this.replace(/^\s+|\s+$/g, "");
            };

            var s = "   hello,world   ";
            console.log(s);
            console.log(s.trimEx());
        }

        function f127() {
            var rg = new Range(2, 4);
            console.log(rg instanceof Range);
            console.log(rg instanceof Object);
        }

        function f128() {
            function typeAndValue(x)
            {
                if (x == null) return "";
                switch(x.constructor)
                {
                    case Number: return "Number:" + x;
                    case String: return "String:" + x;
                    case Date: return "Date:" + x;
                    case RegExp: return "Regexp:" + x;
                    case Complex: return "Complex:" + x;
                }
            }
            console.log(typeAndValue(new Complex(1, 3)));
            console.log(typeAndValue(22));
            console.log(typeAndValue("33"));
            console.log(typeAndValue(new Date()));
        }
        
        function typeEx(o)
        {
            var t, c, n;
            if (o === null) return "null";
            if (o !== o) return "nan";
            if ((t = typeof o) !== "object") return t;
            if ((c = classof(o)) !== "Object") return c;
            if (o.constructor && typeof o.constructor === "function" &&
                (n = o.constructor.name)) return n; 
            return "Obejct";
        }

        function quacks(o)
        {
            for(var i=1;i<arguments.length;i++)
            {
                var arg = arguments[i];
                switch(typeof arg)
                {
                    case "string":
                        if (typeof o[arg] !== "function") return false;
                        continue;
                    case "function":
                        arg = arg.prototype;
                    case "object":
                        for(var m in arg)
                        {
                            if (typeof arg[m] !== "function") continue;
                            if (typeof o[m] !== "function") return false;
                        }
                }
            }
            return true;
        }

        function f129()
        {
            var cpl = new Complex(1, 4);

            function LikeComplex()
            {

            }
            LikeComplex.prototype.mag = function () { };
            var obj = new LikeComplex();

            var res = quacks(cpl, "add", LikeComplex, obj);
            console.log(res);
        }

        function Set()
        {
            this.values = {};
            this.n = 0;
            this.add.apply(this,arguments);
        }
        Set.prototype.add=function()
        {
            for(var i=0;i<arguments.length;i++)
            {
                var val = arguments[i];
                var str = Set._v2s(val);
                if(!this.values.hasOwnProperty(str))
                {
                    this.values[str] = val;
                    this.n++;
                }
            }
            return this;
        }
        Set.prototype.remove=function()
        {
            for(var i=0;i<arguments.length;i++)
            {
                var str = Set._v2s(arguments[i]);
                if(this.values.hasOwnProperty(str))
                {
                    delete this.values[str];
                    this.n--;
                }
            }
            return this;
        }
        Set.prototype.contains=function(value)
        {
            return this.values.hasOwnProperty(Set._v2s(value));
        }
        Set.prototype.size=function()
        {
            return this.n;
        }
        Set.prototype.foreach=function(f,context)
        {
            for(var s in this.values)
            {
                if (this.values.hasOwnProperty(s))
                    f.call(context, this.values[s]);
            }
        }
        Set._v2s = function (val) {
            switch (val) {
                case undefined: return "u";
                case null: return "n";
                case true: return "t";
                case false: return "f";
                default: switch (typeof val) {
                    case "number": return "#" + val;
                    case "string": return "\"" + val;
                    default: return "@" + objectId(val);
                }
            }
            function objectId(o) {
                var prop = "|**objectid**|";
                if (!o.hasOwnProperty(prop))
                    o[prop] = Set._v2s.next++;
                return o[prop];
            }
        };
        Set._v2s.next = 100;

        function f130()
        {
            var obj = new Set();
            obj.add(1, 3, 5);
            obj.foreach((x) => { console.log(x); });
            obj.remove(3);
            console.log(obj.contains(5));
            console.log(obj.size());
            obj.foreach((x) => { console.log(x); });
        }

        function enumeration(namesToValues) {
            var enumeration = function () { throw "Can't Instantiate Enumerations"; };
            var proto = enumeration.prototype = {
                constructor: enumeration,
                toString: function () { return this.name; },
                valueOf: function () { return this.value; },
                toJSON: function () { return this.name; }
            };
            enumeration.values = [];
            for (name in namesToValues) {
                var e = inherit(proto);
                e.name = name;
                e.value = namesToValues[name];
                enumeration[name] = e;
                enumeration.values.push(e);
            }
            enumeration.foreach = function (f, c) {
                for (var i = 0; i < this.values.length; i++)
                    f.call(c, this.values[i]);
            };
            return enumeration;
        }

        function f131()
        {
            var Coin = enumeration({ Penny: 1, Nickel: 5, Dime: 10, Quarter: 25 });
            var c = Coin.Dime;
            console.log(c instanceof Coin);
            console.log(c.constructor == Coin);
            console.log(Coin.Quarter + 3 * Coin.Nickel);
            console.log(Coin.Dime == 10);
            console.log(Coin.Dime > Coin.Nickel);
            console.log(String(Coin.Dime) + ":" + Coin.Dime);
            Coin.foreach((x) => { console.log(x.name)});
        }

        function Card(suit, rank) {
            this.suit = suit;
            this.rank = rank;
        }
        Card.Suit = enumeration({ Clubs: 1, Diamonds: 2, Hearts: 3, Spades: 4 });
        Card.Rank = enumeration({
            Two: 2, Three: 3, Four: 4, Five: 5, Six: 6,
            Seven: 7, Eight: 8, Nine: 9, Ten: 10,
            Jack: 11, Queen: 12, King: 13, Ace: 14
        });

        Card.prototype.toString=function()
        {
            return this.rank.toString() + " of " + this.suit.toString();
        }
        Card.prototype.compareTo=function(that)
        {
            if (this.rank < that.rank) return -1;
            if (this.rank > that.rank) return 1;
            return 0;
        }
        Card.orderByRank=function(a,b)
        {
            return a.compareTo(b);
        }
        Card.orderBySuit=function(a,b)
        {
            if (a.suit < b.suit) return -1;
            if (a.suit > b.suit) return 1;
            Card.orderByRank(a, b);
        }
        function Deck()
        {
            var cards = this.cards = [];
            Card.Suit.foreach((x) => {
                Card.Rank.foreach((y) => {
                    cards.push(new Card(x,y));
                })
            });
        }
        Deck.prototype.shuffle = function () {
            var deck = this.cards, len = deck.length;
            for (var i = len - 1; i > 0; i--) {
                var r = Math.floor(Math.random() * (i + 1)), temp;
                temp = deck[i], deck[i] = deck[r], deck[r] = temp;
            }
            return this;
        };
        Deck.prototype.deal = function (n) {
            if (this.cards.length < n) throw "Out of cards";
            return this.cards.splice(this.cards.length - n, n);
        };

        function f132() {
            extend(Set.prototype, {
                toString: function () {
                    var s = "{", i = 0;
                    this.foreach((v) => { s += ((i++ > 0) ? "," : "") + v });
                    return s + "}";
                }
            },
            {
                toLocaleString:function()
                {
                    var s = "{", i = 0;
                    this.foreach((v) => {
                        if (i++ > 0) s += ",";
                        if (v == null) s += v;
                        else s += v.toLocaleString();
                    });
                    return s += "}";
                }
            },{
                toArray:function()
                {
                    var a = [];
                    this.foreach((v) => { a.push(v); });
                    return a;
                }
            });
            Set.prototype.toJSON = Set.prototype.toArray;

            var obj = new Set(1, 2, 3, 4, 5);
            console.log(obj.toLocaleString());
            console.log(obj.toArray());
            console.log(obj.toJSON());
        }

        function f133() {
            Range.prototype.constructor=Range;
            Range.prototype.equals=function(that)
            {
                if (that == null) return false;
                if (that.constructor !== Range) return false;
                return this.from == that.from && this.to == that.to;
            }
            var obj1 = new Range(1, 4);
            var obj2 = new Range(1, 4);
            console.log(obj1.equals(obj2));
        }

        function f134() {
            Set.prototype.equals = function (that) {
                if (this === that) return true;
                if (!(this instanceof Set)) return false;
                if (this.size() != that.size()) return false;

                try {
                    this.foreach((v) => { if (!that.contains(v)) throw false; });
                    return true;
                }
                catch (x) {
                    if (x === false) return false;
                    throw x;
                }
            };

            var s1 = new Set(1);
            var s2 = new Set(1);
            console.log(s1===s1);


        }
    </script>
</head>
<body>
    <button onclick="f134()">test</button>
    <button onclick="<script>console.log(eval('3+2'))</script>">test2</button>
    <a href="javascript:void window.open();">打开一个新窗口</a>
</body>
</html>
