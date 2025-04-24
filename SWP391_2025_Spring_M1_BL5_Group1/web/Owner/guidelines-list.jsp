

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="model.Guideline" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guildlines List</title>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"></jsp:include>
            <div class="hero page-inner overlay" style="background-image: url('images/hero_bg_1.jpg');">

                <div class="container">
                    <div class="row justify-content-center align-items-center">
                        <div class="col-lg-9 text-center mt-5">
                            <h1 class="heading" data-aos="fade-up">GuideLines</h1>

                            <nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
                                <ol class="breadcrumb text-center justify-content-center">
                                    <li class="breadcrumb-item "><a href="index.html">Manager</a></li>
                                    <li class="breadcrumb-item active text-white-50" aria-current="page">GuideLine</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="main">
                <div class="container" style="margin-top: 2em">
                    <div class="col-3"><a href="addGuideline"><button type="button" class="btn btn-primary">Add Guideline</button></div></a>
                    <table id="guildLineTable" class="display">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        <jsp:include page="footer.jsp" flush="true"></jsp:include>
        </body>
        <script>
            $(document).ready(function () {
                var dataList = ${dataList};
                //var realData = JSON.parse(dataList);
                $('#guildLineTable').DataTable({
                    data: dataList,
                    columns: [
                        {title: "ID", data: "guideID"},
                        {title: "Name", data: "guideName"},
                        {
                            title: "Image",
                            data: "img",
                            render: function (data, type, row) {
return '<img src="' + data + '" alt="Image" width="300" height="300">';
                            }
                        },
                        {
                            title: "Action",
                            data: "guideID",
                            render: function (data, type, row) {

                                return '\
            <a href="updateGuideline?id=' + data + '"><button type="button" class="btn btn-success"><i class="fa fa-edit"></i></button></a>\
<button type="button"class="btn btn-danger" onclick="deleteItem(' + data + ')"><i class="fa fa-trash"></i></button>';
                            },
                            orderable: false
                        }
                    ]
                });

            });

            function deleteItem(data) {
                var confirmDialog = confirm('Do you want to delete this item ?');
                if (confirmDialog === true) {
                    window.location.href = 'deleteGuideline?id=' + data;
                }
            }
    </script>
</html>