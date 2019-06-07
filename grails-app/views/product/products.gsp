<html>
    <head>


        <meta name="layout" content="main"/>
        <asset:javascript src="jquery-3.3.1.min.js"/>
        <asset:javascript src="datatables.js"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/jquery.dataTables.css">
        <title> ProductApp Products </title>

    </head>
    <body>

        <ul class="nav nav-tabs" style="">
            <li class="nav-item"><a class="nav-link" href="/user/index">Home</a></li>
            <li class="nav-item"><a class="nav-link active" href="/product/listProducts">Products</a></li>
            <sec:ifAllGranted roles='ROLE_ADMIN'>
                <li class=""><a href="/product/createProduct">Create</a></li>
            </sec:ifAllGranted>
            <li><a href="/auth/logout#">Logout</a></li>
        </ul>

        <g:render template="/alerts" model="[flash:flash]" />


        <div class="col-md-12" style="padding-left:20px;padding-right:20px;padding-top:20px;display:inline-block">
            <div class="col-md-12" style="padding:0;padding-bottom:10px">
                <h3 class="name"><strong>Products </strong> </h3>
            </div>

            <table id="products" class="table table-bordered table table-hover" cellspacing="0" width="100%">
                <colgroup><col><col><col></colgroup>
                <thead>
                <tr>
                    <th style="font-size: 14px; width: 10%">Id</th>
                    <th style="font-size: 14px; width: 60%">Name</th>
                    <th style="font-size: 14px; width: 30%">Price</th>
                    <th style="font-size: 14px; width: 10%">Availability</th>
                </tr>
                </thead>
                <tbody id="emp_body">
                </tbody>
            </table>
            %{--<div id="pager">--}%
                %{--<ul id="pagination" class="pagination-sm" style="padding:0; margin:0"></ul>--}%
            %{--</div>--}%

        </div>



    <script>




        $(document).ready( function () {
            $('#products').DataTable({
                serverSide: true,
                processing: true,
                paging: true,
                searching: { "regex": false },
                lengthMenu: [ [5, 10, 25, 50], [5, 10, 25, 50] ],
                pageLength: 5,
                "ajax": {
                    "type": "POST",
                    "url": "/product/list",
                    "dataType": "json",
                    "contentType": 'application/json; charset=utf-8',
                    "data": function (data) {

                        // Add options used by Datatables

                        var info = $('#products').DataTable().page.info();
                        var send =  {"offset": info.page, "max": info.length};

                        return JSON.stringify(send);
                    },
                    dataFilter: function(data){
                        var json = jQuery.parseJSON( data );
                        json.recordsTotal = json.total;
                        json.recordsFiltered = json.total;
                        json.data = json.data;

                        return JSON.stringify( json ); // return JSON string
                    },
                    "complete": function (response) {
                        console.log("jarl")
                    }
                },
                "columns": [
                    { "data": "id" },
                    { "data": null, render: function( data, type, row){ return '<a style="text-decoration:none" href="/product/showProduct?id='+data.id+'">'+data.name+'</a>'} },
                    { "data": "price" },
                    { "data": "available" }
                ]
            })
        })


    </script>

    </body>



</html>


