<%@ page import="java.text.SimpleDateFormat" %>

<html>
    <head>
        <meta name="layout" content="main"/>
        <asset:javascript src="jquery-3.3.1.min.js"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/jquery.dataTables.css">
        <title> ${product.name} </title>

    </head>
    <body>

        <ul class="nav nav-tabs" style="">
            <li class=""><a href="/">Home</a></li>
            <li class=""><a href="/product/listProducts">Products</a></li>
            <li class="active"><a href="/product/createProduct">Create</a></li>
        </ul>

        <g:render template="/alerts" model="[flash:flash]" />

        <div class="col-md-12" style="padding-left:20px;padding-right:20px;padding-top:20px;display:inline-block">
            <div class="col-md-12" style="padding:0;padding-bottom:10px">
                <h3 class="name"><strong>${product.name}</strong> </h3>
            </div>

            <div class="col-md-12">
                <form>

                    <sec:ifAllGranted roles='ROLE_ADMIN'>
                        <div class="form-group">
                            <label for="productName">Database ID</label>
                            <input type="text" disabled class="form-control" id="productId" placeholder="" value="${product.id}">
                        </div>

                    </sec:ifAllGranted>

                    <div class="form-group">
                        <label for="productCreated">Created at </label>
                        <input type="text" disabled class="form-control" placeholder="" id="productCreated" value="${product.dateCreated}">
                    </div>

                    <div class="form-group">
                        <label for="productName">Product Name</label>
                        <input type="text" class="form-control" id="productName" placeholder="" value="${product.name}">
                    </div>
                    <div class="form-group">
                        <label for="productPrice">Product Price</label>
                        <input class="col-md-12" type="number" onchange="setTwoNumberDecimal" step="0.01" id="productPrice" value="${product.price}">
                    </div>
                    <div class="form-group">
                        <label for="productEnabled">Available</label>
                        <select class="form-control" id="productEnabled">
                            <g:if test="${product.available}">
                                <option value="true" selected> True</option>
                                <option value="false"> False </option>
                            </g:if>
                            <g:else>
                                <option value="true"> True</option>
                                <option value="false" selected> False </option>
                            </g:else>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="productDescription">Description</label>
                        <textarea class="form-control" id="productDescription" rows="2">${product.description}</textarea>
                    </div>

                </form>
                <sec:ifAllGranted roles='ROLE_ADMIN'>
                    <button style="padding-left:20px;padding-right:20px;margin-right:30px" class="btn btn-primary" id="updateProduct">Update</button>
                    <button style="padding-left:20px;padding-right:20px;" class="btn btn-dark" id="deleteProduct">Delete</button>
                </sec:ifAllGranted>

            </div>

        </div>



        <g:javascript>

            function setTwoNumberDecimal(event) { this.value = parseFloat(this.value).toFixed(2); }

            $('#updateProduct').on("click", function(e){
                $.ajax({
                    url: "/product/update",
                    method:"POST",
                    data: {
                        product     : $('#productId').val(),
                        name        : $('#productName').val(),
                        description : $('#productDescription').val(),
                        available   : $('#productEnabled').val(),
                        price       : $('#productPrice').val()
                    },
                    success: function(data){
                        if(data.success) {
                            showAlert("Product updated successfully!", "success") }
                        else{
                            var html = ""
                            data.errors.forEach(function(i){ html = html + "<br>" + i })
                            showAlert(html,"error") } } })})

            $('#deleteProduct').on("click", function(e){
                $.ajax({
                    url: "/product/delete",
                    method:"POST",
                    data: {
                        product     : $('#productId').val(),
                    },
                    success: function(data){
                        if(data.success) {
                            showAlert("Product deleted successfully!", "success")

                            setTimeout(function() {
                                window.location.href="/product/listProducts"
                                }, 1200); }
                        else{
                            var html = ""
                            data.errors.forEach(function(i){ html = html + "<br>" + i })
                            showAlert(html,"error")
                        } } })})
        </g:javascript>

    </body>



</html>


