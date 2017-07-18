/**
 * Created by Administrator on 2017-04-12.
 */
//function changeFrameHeight(){
//    var ifm= document.getElementById("myiframe");
//    ifm.height=document.documentElement.clientHeight;
//    //document.documentElement.clie
//    console.log(ifm.height);
//}
//window.onresize=function(){
//    changeFrameHeight();
//}
//    $(function(){
//        var iframeHeight = $("#myiframe").contents().find("body").height();
//        $("#myiframe").height(iframeHeight);
//    });
function setIframeHeight(id){
    try{
        var iframe = document.getElementById(id);
        if(iframe.attachEvent){
            iframe.attachEvent("onload", function(){
                iframe.height =  iframe.contentWindow.document.documentElement.scrollHeight;
            });
            console.log(iframe.height);
            return;
        }else{
            iframe.onload = function(){
                iframe.height = iframe.contentDocument.body.scrollHeight;
            };
            return;
        }
    }catch(e){
        throw new Error('setIframeHeight Error');
    }
}
