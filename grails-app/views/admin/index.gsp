<html>
    <head>
        <meta name="layout" content="${gspLayout ?: 'main'}"/>
        <title> ProductApp </title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

        <style type="text/css" media="screen">
            h1 {
                display: block;
                font-size: 2em;
                margin-top: 0.67em;
                margin-bottom: 0.67em;
                margin-left: 0;
                margin-right: 0;
                font-weight: bold;
            }

            h2 {
                display: block;
                font-size: 1.5em;
                margin-top: 0.83em;
                margin-bottom: 0.83em;
                margin-left: 0;
                margin-right: 0;
                font-weight: bold;
            }

            h3 {
                display: block;
                font-size: 1.17em;
                margin-top: 1em;
                margin-bottom: 1em;
                margin-left: 0;
                margin-right: 0;
                font-weight: bold;
            }

        </style>

</head>
    <body>

        <ul class="nav nav-tabs" style="">
            <li class="nav-item"><a class="nav-link active" href="/admin/index">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="/product/listProducts">Products</a></li>
            <li class="nav-item"><a class="nav-link" href="/product/createProduct">Create</a></li>
            <li class="nav-item"><a class="nav-link" href="/auth/logout#">Logout</a></li>
        </ul>


        <div style="padding-left:50px;padding-top:20px">
            <h1> Hi there, Admin!</h1>
            <h2> This is the requested test app. </h2>
            <h3 style="padding-top:10px"> All stuff is loaded when application bootstraps, in a local h2 mem database. </h3>
            <h3> All changes will be saved, but not persisted when application restarts.</h3>
            <h3> You can navigate through this minimal web-ui with the above navigation tabs. </h3>
            <br>
            <h2> It has been built with the following stack: </h2>
            <ul class="col-md-4" style="font-size:18px" >
                <li class="">Grails 3.3.10</li>
                <li class="">Groovy 2.4.17</li>
                <li class="">OpenJdk 8</li>
                <li class="">Intellij Idea 2017.1.5</li>
            </ul>
            <h2 style="padding-top:10px"> And plugins: </h2>
            <ul class="col-md-4" style="font-size:18px" >
                <li class="">Jquery 3.3.1</li>
                <li class="">Bootstrap 4.1.3</li>
                <li class="">DataTables 1.10.19</li>
                <li class="">Spring Security Core 3.2.3</li>
            </ul>
        </div>
    </body>
</html>
