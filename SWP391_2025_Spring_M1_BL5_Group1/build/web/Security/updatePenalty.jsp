
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="chartServlet">Security</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

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
                            <a class="nav-link" href="shift">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Shift
                            </a>
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
                            <a class="nav-link" href="rule">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Rule
                            </a>
                            <a class="nav-link" href="newlist">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                News
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
                    <div class="container">
                        <h1 class="mt-4">Penalty Form</h1>

                        <form action="update" method="post">
                            <input type="hidden" name="penId" value="${detail.penId}">


                            <br>
                            <div class="form-group">

                                <label for="roomID" class="form-label">RoomID:</label>

                                <input type="number" id="roomID" name="roomID" class="form-control" value="${detail.roomId}" readonly>

                            </div>
                            <br>
                            <div class="form-group">

                                <label for="description" class="form-label">Description:</label>

                                <input type="text" id="description" name="description" class="form-control" value="${detail.description}" readonly>

                            </div>
                            <br>
                            <div class="form-group">
                                <label for="penDate" class="form-label">Date:</label>
                                <input type="date" id="penDate" name="penDate" class="form-control" value="${detail.penDate}" readonly>
                            </div>
                            <br>
                            <div class="form-group">
                                <label for="RuleName" class="form-label">RuleName:</label>
                                <input type="text" id="RuleName" name="RuleName" class="form-control" value="${detail.ruleName}" readonly>
                            </div>
                            <br>
                            <div  class="form-group">
                                <label for="rule" class="form-label">Status: </label>
                                <select class="form-select" name="status">
                                    <option value="-1" ${detail.penStatus==-1?"Selected":""}>Removed</option>
                                    <option value="0" ${detail.penStatus==0?"Selected":""}>Waiting</option>
                                    <option value="1" ${detail.penStatus==1?"Selected":""}>Penalty</option>
                                </select>
                            </div>
                            <br>
                            <div class="modal-footer">
                                <input type="submit" name="submit" class="btn btn-success" value="Update">
                            </div>
                        </form>
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