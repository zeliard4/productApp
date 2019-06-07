<html>
    <head>
        <meta name="layout" content="main"/>
        <asset:javascript src="jquery-3.3.1.min.js"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/jquery.dataTables.css">
        <title> ProductApp Products </title>

    </head>
    <body>

        <ul class="nav nav-tabs" style="">
            <li class="nav-item"><a class="nav-link" href="/user/index">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="/product/listProducts">Products</a></li>
            <li class="nav-item"><a class="nav-link active" href="/product/createProduct">Create</a></li>
            <li class="nav-item"><a class="nav-link" href="/auth/logout#">Logout</a></li>


        </ul>

        <g:render template="/alerts" model="[flash:flash]" />

        <div class="col-md-12" style="padding-left:20px;padding-right:20px;padding-top:20px;display:inline-block">
            <div class="col-md-12" style="padding:0;padding-bottom:10px">
                <h3 class="name"><strong>Create Product </strong> </h3>
            </div>

            <div class="col-md-12">
                <form>
                    <div class="form-group">
                        <label for="productName">Product Name</label>
                        <input type="text" class="form-control" id="productName" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="productPrice">Product Price</label>
                        <input class="col-md-12" type="number" onchange="setTwoNumberDecimal" step="0.01" value="0.00" id="productPrice">
                    </div>
                    <div class="form-group">
                        <label for="productEnabled">Available</label>
                        <select class="form-control" id="productEnabled">
                            <option value="true" selected> True</option>
                            <option value="false"> False </option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="productDescription">Description</label>
                        <textarea class="form-control" id="productDescription" rows="2"></textarea>
                    </div>

                </form>

                <button class="btn btn-primary" id="createProduct">Create Product</button>
            </div>

        </div>



        <g:javascript>

            function setTwoNumberDecimal(event) { this.value = parseFloat(this.value).toFixed(2); }

            $('#createProduct').on("click", function(e){
                $.ajax({
                    url: "/product/create",
                    method:"POST",
                    data: {
                        name        : $('#productName').val(),
                        description : $('#productDescription').val(),
                        available   : $('#productEnabled').val(),
                        price       : $('#productPrice').val()
                    },
                    success: function(data){
                        if(data.success) {
                            showAlert("Product created successfully!", "success") }
                        else{
                            var html = ""
                            data.errors.forEach(function(i){ html = html + "<br>" + i })
                            showAlert(html,"error") } } })})
        </g:javascript>

    </body>



</html>


