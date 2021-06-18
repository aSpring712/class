<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="jumbotron jumbotron-fluid mb-5">
	<div class="container">
		<h1>상품 상세보기</h1>
	</div>
</div>
<script type="text/javascript">
	function addToCart() {
		if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>

<div class="d-flex container"> <!-- 전체 레이아웃 : 두 부분으로 나눌 것-->
	<!-- 1. 이미지 -->
	<div class="card" style="width: 400px">
		<img class="card-img-top" src="/MD_Market/upload/${product.filename }" alt="Card image">
	</div>

	<!-- 2. 상품 내용 부분  -->
	<div class="container">
		<table class="table table-borderless">
			<tr>
				<td width="200px">상품명(분류)</td>
				<td>${product.pname }(${product.category })</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>${product.unitPrice }원</td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td>${product.description }</td>
			</tr>
			<tr>
				<td>제조사</td>
				<td>${product.manufacturer }</td>
			</tr>
			<tr>
				<td>재고수</td>
				<td>${product.unitsInStock }</td>
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${empty sessionScope.user || sessionScope.user.admin==0 }">
						<%-- 일반회원 --%>
						<form name="addForm" action="./addCart.jsp?productId=${product.productId }" method="post">
							<a href="#" class="btn btn-info" onclick="addToCart()">장바구니</a>
							<a href="./credit.jsp" class="btn btn-warning">구매하기</a>
							<a href="plist?category=${product.category }" class="btn btn-secondary">전체보기</a>
						</form>
					</c:if>
					<c:if test="${sessionScope.user.admin==1}">
						<%-- 관리자 --%>
						<button class="btn btn-primary" onClick="location.href='productView?productId=${product.productId}'">수정하기</button>
						<button class="btn btn-info" onClick="location.href='productDelete?productId=${product.productId}'">삭제하기</button>
						<a href="plist?category=${product.category }" class="btn btn-secondary">전체보기</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</div>

<hr/>

<div class="container">
	
</div>

<%@ include file="../include/footer.jsp"%>