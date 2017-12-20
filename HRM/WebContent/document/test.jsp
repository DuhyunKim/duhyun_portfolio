<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${root}/css/jquery.treemenu.css" rel="stylesheet">
<script src="${root}/js/jquery.js"></script>
<script src="${root}/js/bootstrap.min.js"></script>
<script src="${root}/js/jquery.treemenu.js"></script>
<script type="text/javascript" src="jquery.easyui.min.js">
<script>
function memberlist(pg) {
    $.ajax({
      type: "GET",
      url: "${root}/doc/ajax",
      data: {act: "listDept"},
      dataType: "json",
      success: function(data) {
    	  fnTreeMaker(jsonData, $("#tt"));
      },
      error: function(e) {
    	  alert("에러발생 : " + e);
      }
    });
}


var root = [];
var depth = {};

depth[0] = root;

function fnTreeMaker(jsonData, target){
    jsonLength = jsonData.layerList.length;
    
    fnMakeLayerTree(root, jsonData.layerList, 0, jsonLength - 1);
    
    target.tree({
        data: root
    });
}
function fnMakeLayerTree(targetNode, layerList, currentIndex, maxIndex){
    currentTree = layerList[currentIndex];
    currentNode = {
        "id": currentTree.layerTreePk,
        "text": currentTree.korName,
        "state": (currentTree.opened == 0) ? "closed" : "open",
        "attributes": {
            "layerName": currentTree.layerName,
            "symbolizer": currentTree.symbolizer
        }
    };
    
    targetNode.push(currentNode);
    
    depth[currentTree.treeDepth] = currentNode;
    
    if (currentIndex < maxIndex) { 
        curretTreeDepth = currentTree.treeDepth;
        nextTreeDepth = layerList[currentIndex + 1].treeDepth;
        
        if (curretTreeDepth == nextTreeDepth) {

        } else if (curretTreeDepth < nextTreeDepth) {
            currentNode.children = [];
            targetNode = currentNode.children;
        } else if (curretTreeDepth > nextTreeDepth) {
            if (nextTreeDepth == 1) {
                targetNode = root
            } else {
                targetNode = depth[nextTreeDepth - 1].children;
            }
        }
        
        fnMakeLayerTree(targetNode, layerList, currentIndex + 1, maxIndex);
    }
}
</script>
</head>
<body onload="javascript:memberlist();">
	<div class="list"></div>
</body>
</html>