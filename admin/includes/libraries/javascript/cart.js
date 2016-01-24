function delChecked(){
    $('.firstItem .checkboxSimulateChecked').each(function(){
        var store_rec_id = $(this).attr("id");
       //alert(store_rec_id);
        var strs = store_rec_id.split("-");
        drop_cart_item(strs[0], strs[1]);
    });
}

function drop_cart_item(store_id, rec_id){
    var tr = $('#cart_item_' + rec_id);
    var amount_span = $('#cart' + store_id + '_amount');
    var amount1_span = $('#cart' + store_id + '_amount1'); //优惠过后的总价
    var cart_goods_kinds = $('#cart_goods_kinds');
    $.getJSON('index.php?app=cart&act=drop&rec_id=' + rec_id, function(result){
        if(result.done){
            //删除成功
            if(result.retval.cart.quantity == 0){
                window.location.reload();    //刷新
            }
            else{
				
                tr.remove();        //移除
				//alert(tr.parent().find(".trActive").length);
				if(tr.parent().find(".trActive").length==0)
				{
					window.location.reload();
					//alert(tr.parent().attr('class'));
					//tr.parent().parent().parent().remove();
				}
                //amount_span.html(price_format(result.retval.amount));  //刷新总费用
                //amount1_span.html(price_format(result.retval.amount));  //刷新总费用
                //cart_goods_kinds.html(result.retval.cart.kinds);       //刷新商品种类
            }
        }
    });
}
function move_favorite(store_id, rec_id, goods_id){
    var tr = $('#cart_item_' + rec_id);
    $.getJSON('index.php?app=my_favorite&act=add&type=goods&item_id=' + goods_id, function(result){
        //没有做收藏后的处理，比如从购物车移除
        if(result.done){
            //drop_cart_item(store_id, rec_id);
            alert(result.msg);
        }
        else{
            alert(result.msg);
        }

    });
}
function change_quantity(store_id, rec_id, spec_id, input, orig){
    var subtotal_span = $('#item' + rec_id + '_subtotal'); //小计
    var amount_span = $('#cart' + store_id + '_amount');
    var amount1_span = $('#cart' + store_id + '_amount1'); //优惠过后的总价
    var total_quantity = $('.finalChooseNum');
    //暂存为局部变量，否则如果用户输入过快有可能造成前后值不一致的问题
    var _v = input.value;
    $.getJSON('index.php?app=cart&act=update&spec_id=' + spec_id + '&quantity=' + _v, function(result){
        if(result.done){
            //更新成功
            $(input).attr('changed', _v);
            subtotal_span.html(price_format(result.retval.subtotal));
            amount_span.html(price_format(result.retval.amount));
            amount1_span.html(price_format(result.retval.amount));
            total_quantity.html(result.retval.cart.quantity);
            // if (result.retval.amount > 1000 && result.retval.cart.quantity > 1) {
            //     $('.goToPayNotice').show();
            // } else if (result.retval.amount <= 1000) {
            //     $('.goToPayNotice').hide();
            // } 
        }
        else{
            //更新失败
            alert(result.msg);
            $(input).val($(input).attr('changed'));
        }
    });
}
function decrease_quantity(rec_id){
    var item = $('#input_item_' + rec_id);
    var orig = Number(item.val());
    if(orig > 1){
        item.val(orig - 1);
        item.keyup();
    }
}
function add_quantity(rec_id){
    var item = $('#input_item_' + rec_id);
    var orig = Number(item.val());
    item.val(orig + 1);
    item.keyup();
}

var cartPlugin = {
    init:function(){
        cartPlugin.additive();
        cartPlugin.subduction();
        // cartPlugin.changedCart();
        cartPlugin.changedInput();
    },
    //加法运算
    accAdd:function(num1,num2){
        var n1,n2,m;
        try{
            n1 = num1.toString().split(".")[1].length;
        }catch(e){
            n1 = 0;
        }
        try{
            n2 = num2.toString().split(".")[1].length;
        }catch(e){
            n2 = 0;
        }
        m = Math.pow(10,Math.max(n1,n2));
        return (num1*m + num2*m)/m;
    },

    //乘法运算
    accMul:function(num1,num2){
        var m = 0,n1,n2,
            s1 = num1.toString(),
            s2 = num2.toString();
        try{
            m += s1.split(".")[1].length;
        }catch(e){

        }
        try{
            m += s2.split(".")[1].length;
        }catch(e){

        }
        n1 = Number(s1.replace(".",""));
        n2 = Number(s2.replace(".",""));
        return n1 * n2 / Math.pow(10,m);
    },
    cuter:function(num){
        num = num.toString().replace(/\$|\,/g,'');  
        if(isNaN(num))  
        num = "0";  
        sign = (num == (num = Math.abs(num)));  
        num = Math.floor(num*100+0.50000000001);  
        cents = num%100;  
        num = Math.floor(num/100).toString();  
        if(cents<10)  
        cents = "0" + cents;  
        for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)  
        num = num.substring(0,num.length-(4*i+3))+','+  
        num.substring(num.length-(4*i+3));  
        return (((sign)?'':'-') + num + '.' + cents);  
    },
    amountMoney:function(id,number){
        var _initaccount = 0,_price = 0,_amount = 0,_acc_price = 0;
        //初始价格
        try{
            _initaccount = $("#js_change_"+id).attr("data-account").split("¥")[1].replace(",","");
        }catch(e){
            _initaccount = $("#js_change_"+id).attr("data-account").replace(",","");
        }

        //单价
        try{
            _price = $("#js_change_"+id).attr("data-price").split("¥")[1].replace(",","");
        }catch(e){
            _price = $("#js_change_"+id).attr("data-price").replace(",","");
        }

        //赋值数量
        $("#js_change_"+id).val(number);
        _acc_price = cartPlugin.accMul(_price,number);
        $("#js_change_"+id).closest(".trActive").find(".goodsPrice").html("¥"+cartPlugin.cuter(_acc_price));

        cartPlugin.changedCart(id);
    },
    additive:function(){
        $(".js_add").click(function(){
            var number = 0,_id = null;
            _id = $(this).attr("data-id");
			
            number = $("#js_change_"+_id).val();
            number++;
			spec_id = $(this).attr("spec_id");
			$.getJSON('index.php?app=cart&act=update&spec_id=' + spec_id + '&quantity=' + number,function(){});
            cartPlugin.amountMoney(_id,number);
        })

    },
    subduction:function(id){
        $(".js_sub").click(function(){
            var number = 0,_id = null;
            _id = $(this).attr("data-id");
            number = $("#js_change_"+_id).val();
            number--;
            if(number <= 1){
                number = 1;
            }
			spec_id = $(this).attr("spec_id");
			$.getJSON('index.php?app=cart&act=update&spec_id=' + spec_id + '&quantity=' + number,function(){});
            cartPlugin.amountMoney(_id,number);
        })
    },
    changedCart:function(id){
        var _account = 0,_goodsPrice,_count = 0;
        var _thisgoodsPrice = $("#js_change_"+id).closest("form").find(".goodsPrice");
        var _input_change = $("#js_change_"+id).closest("form").find(".js_input_change");
        for (var i = 0,len = _thisgoodsPrice.length; i < len; i++) {

            try{
                _goodsPrice = _thisgoodsPrice[i].innerHTML.split("¥")[1].replace(",","");
            }catch(e){
                _goodsPrice = _thisgoodsPrice[i].innerHTML.replace(",","");
            }

            _count = cartPlugin.accAdd(_count,_input_change[i].value);

            _account = cartPlugin.accAdd(_account,_goodsPrice);

        };

        cartPlugin.account(id,_account,_count);

    },
    changedInput:function(){

        var js_account_len = $(".js_account").length,init_account;

        if(js_account_len > 1){
            for (var i = 0; i < js_account_len; i++) {                
                try{
                    init_account = $(".js_account")[i].innerHTML.split("¥")[1].replace(",","");
                }catch(e){
                    init_account = $(".js_account")[i].innerHTML.replace(",","");
                }
                if(init_account > 1000){      
                    $(".js_account").closest("form").find(".goToPayBtn").eq(i).addClass("godisabled");
                    $(".js_account").closest("form").find(".goToPayNotice").eq(i).show();
                    $(".js_account").closest("form").find(".goToPayBtn").eq(i).unbind( "click" );
                }
            }
        }else if(js_account_len <= 1){            
            try{
                init_account = $(".js_account")[0].innerHTML.split("¥")[1].replace(",","");
            }catch(e){
                init_account = $(".js_account")[0].innerHTML.replace(",","");
            }

            if(init_account > 1000){      
                $(".js_account").closest("form").find(".goToPayBtn").eq(0).addClass("godisabled");
                $(".js_account").closest("form").find(".goToPayNotice").eq(0).show();
                $(".js_account").closest("form").find(".goToPayBtn").eq(0).unbind( "click" );
            }
        }

        $('.js_input_change').bind('input propertychange', function() {
            var number = 0,_id = null;
            _id = $(this).attr("data-id");
            number = $("#js_change_"+_id).val();

            console.log("_id："+_id+"number："+number);
            if(isNaN(number)){
                number = 1;
            }

            cartPlugin.amountMoney(_id,number);
        });
    },
    account:function(id,account,count){

        $("#js_change_"+id).closest("form").find(".val").html("¥"+cartPlugin.cuter(account));
        $("#js_change_"+id).closest("form").find(".js_account").html("¥"+cartPlugin.cuter(account));
        $("#js_change_"+id).closest("form").find(".finalChooseNum").html(count);

        if(account>1000){
            $("#js_change_"+id).closest("form").find(".goToPayBtn").addClass("godisabled");
            $("#js_change_"+id).closest("form").find(".goToPayNotice").show();
            $("#js_change_"+id).closest("form").find(".goToPayBtn").unbind( "click" );
        }else{
            $("#js_change_"+id).closest("form").find(".goToPayBtn").removeClass("godisabled");
            $("#js_change_"+id).closest("form").find(".goToPayNotice").hide();
            //表单提交
            $(".goToPayBtn").bind("click",function() {
                var pr = $(this).closest("form").find(".goodsPrice"),
                pr_len = pr.length,
                price_count = 0;
                for (var i = 0; i < pr_len; i++) {
                    price_count += parseInt(pr.eq(i).html().split("¥")[1]);
                };

                idx = $(this).attr('id').split("_");
                arr = new Array();
                $("#f_" + idx[1] + " .checkboxSimulate").each(function() {
                    if ($(this).hasClass('checkboxSimulateChecked')) {
                        ids = $(this).attr('id').split("_");
                        arr.push(ids[1]);

                    }
                });
                if (arr.length == 0) {
                    alert('请选择要结算的货物');
                    return false;
                }
                data = arr.join(',');
                var tag = 0;
                url = $("#f_" + idx[1]).attr('action') + '&rec_id=' + data;
                $.ajax({
                    url: url + "&ajax=1",
                    type: "GET",
                    dataType: 'json',
                    async: false,
                    success: function(res) {

                        if (res.done == 'false') {

                            location.href = url;
                        }
                        //  else {
                        //     if (res.more == 1) {
                        //         //超过1000
                        //         tag = 1;
                        //     } else {
                        //         tag = 0;

                        //     }
                        // }

                    }
                });

                // if (tag == 1) {

                //     $("#show_" + idx[1]).show();
                //     return false;
                // } else {
                //     $("#show_" + idx[1]).hide();
                // }

                location.href = url;

            });
        }
        
    }
}