
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="SecurityCSS/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            .card_container{
                padding: 20px;
                box-shadow: 0 0 10px 2px rgba(100, 100, 100, 0.1);
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }
            .avatar{
                border: 5px solid rgb(79, 72, 72);
                width: 400px;
                height: 400px;
                padding: 3px;
                box-shadow: 0 0 10px 2px rgba(100, 100, 100, 0.1);
            }
            img{
                width: 100%;
                height: 100%;
            }
            .title{
                font-size: 15px;
                text-align: left;
            }
            .value{
                font-size: 15px;
                font-weight: bold;
                text-align: left;
                width: 600px;
            }
            .information{
                display: flex;
                margin-bottom: 5px;
                padding-bottom: 20px;
                border-bottom: 1px solid gray;
            }
            h3 {
                color: rgb(35, 177, 224);
            }
            .user_info{
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }
            .contact{
                display: flex;
                justify-content: space-between;
                width: 60%;
                padding-top: 20px;
                margin-bottom: 20px;
            }
            .content_box{
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100%;
            }

        </style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="chartServlet">Security</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">

                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="chartServlet">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>


                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="dbrenter">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Renter List
                            </a>
                            <a class="nav-link" href="dbroom">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Room List
                            </a>
                            <a class="nav-link" href="pen">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Penalty List
                            </a>
                            <a class="nav-link" href="newlist">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                News
                            </a>
                            <a class="nav-link" href="rule">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Rule
                            </a>

                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Security
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Profile</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="chartServlet">Dashboard</a></li>
                            <li class="breadcrumb-item active">Profile</li>
                        </ol>
                        <!--                            USER PROFILE-->
                        <div class="container">

                            <div class="card card_container" style="width: 100%;">
                                <div class="row content_box">
                                    <div class="col-md-5">
                                        <div class="rounded-circle avatar">
                                            <img src="images.jpg" class="rounded-circle" alt="Avatar">
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="row information">
                                            <h3><i class="fa-regular fa-user"></i> User Infomation:</h3>
                                            <div class="col-md-6">
                                                <div class="row user_info">
                                                    <div class="col-md-5">
                                                        <span class="title">UserID: </span>
                                                    </div>
                                                    <div class="col-md-7">
                                                        
                                                        
                                                    </div>
                                                </div>
                                                <div class="row user_info">
                                                    <div class="col-md-5">
                                                        <span class="title">SecurityID: </span>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <span class="value"> 001</span>
                                                    </div>
                                                </div>
                                                <div class="row user_info">
                                                    <div class="col-md-5">
                                                        <span class="title">Shift Status: </span>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <span class="value">Open</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="row user_info">
                                                    <div class="col-md-5">
                                                        <span class="title">User Name: </span>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <span class="value">Joe Doe </span>
                                                    </div>
                                                </div>
                                                <div class="row user_info">
                                                    <div class="col-md-5">
                                                        <span class="title">Gender: </span>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <span class="value"> Male</span>
                                                    </div>
                                                </div>
                                                <div class="row user_info">
                                                    <div class="col-md-5">
                                                        <span class="title">Birth: </span>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <span class="value">26/12/2000</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row contact">
                                            <h3><i class="fa-regular fa-address-card"></i> User Contact:</h3>
                                            <div class="row user_info">
                                                <div class="col-md-5">
                                                    <span class="title"><i class="fa-regular fa-address-book"></i></i> Phone: </span>
                                                </div>
                                                <div class="col-md-7">
                                                    <span class="value">0123456789</span>
                                                </div>
                                            </div>
                                            <div class="row user_info">
                                                <div class="col-md-5">
                                                    <span class="title"><i class="fa-regular fa-envelope"></i> Email: </span>
                                                </div>
                                                <div class="col-md-7">
                                                    <span class="value"> 0k4pO@example.com</span>
                                                </div>
                                            </div>
                                            <div class="row user_info">
                                                <div class="col-md-5">
                                                    <span class="title"><i class="fa-regular fa-map"></i> Address: </span>
                                                </div>
                                                <div class="col-md-7">
                                                    <span class="value"> Hanoi</span>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <a type="editbtn" href="updateProfile" class="btn btn-primary">Update Profile</a>
                                    </div>
                                </div>

                            </div>
                        </div>


                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="SecurityCSS/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="SecurityCSS/js/datatables-simple-demo.js"></script>
    </body>
</html>
