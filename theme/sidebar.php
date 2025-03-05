<aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">
        <?php 
            if (isset($_SESSION['ACCOUNT_USERNAME'])) {
                $username = $_SESSION['ACCOUNT_USERNAME'];

                switch ($username) {
                    case 'admin':
                        ?>
                        <!-- Admin Menu -->
                        <li class="nav-item">
                            <a class="nav-link <?php echo ($_SERVER['REQUEST_URI'] == WEB_ROOT) ? '' : ' collapsed'; ?>" href="<?php echo WEB_ROOT ?>">
                                <i class="bi bi-grid"></i>
                                <span>Admin Dashboard</span>
                            </a>
                        </li>
                      <!--   <li class="nav-item">
                            <a class="nav-link collapsed" href="module/manage_users.php">
                                <i class="bi bi-people"></i>
                                <span>Manage Users</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link collapsed" href="module/reports.php">
                                <i class="bi bi-file-earmark-bar-graph"></i>
                                <span>Reports</span>
                            </a>
                        </li> -->
                        <?php
                        break;

                    case 'kiosk1':
                        ?>
                        <!-- Counter 2 Menu -->
                        <li class="nav-item">
                            <a class="nav-link <?php echo ($_SERVER['REQUEST_URI'] == WEB_ROOT) ? '' : ' collapsed'; ?>" href="<?php echo WEB_ROOT ?>">
                                <i class="bi bi-grid"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>
                        <?php
                        break;

                    case 'cashier1':
                        ?>
                        <!-- Counter 1 Menu -->
                        <li class="nav-item">
                            <a class="nav-link <?php echo ($_SERVER['REQUEST_URI'] == WEB_ROOT) ? '' : ' collapsed'; ?>" href="<?php echo WEB_ROOT ?>">
                                <i class="bi bi-grid"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>

                        <?php
                        break;

                    case 'cashier2':
                        ?>
                        <!-- Counter 2 Menu -->
                        <li class="nav-item">
                            <a class="nav-link <?php echo ($_SERVER['REQUEST_URI'] == WEB_ROOT) ? '' : ' collapsed'; ?>" href="<?php echo WEB_ROOT ?>">
                                <i class="bi bi-grid"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>
                        <?php
                        break;

                     case 'cashier3':
                        ?>
                        <!-- Counter 2 Menu -->
                        <li class="nav-item">
                            <a class="nav-link <?php echo ($_SERVER['REQUEST_URI'] == WEB_ROOT) ? '' : ' collapsed'; ?>" href="<?php echo WEB_ROOT ?>">
                                <i class="bi bi-grid"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>
                        <?php
                        break;



                    default:
                        ?>
                        <!-- General User Menu -->
                        <li class="nav-item">
                            <a class="nav-link <?php echo ($_SERVER['REQUEST_URI'] == WEB_ROOT) ? '' : ' collapsed'; ?>" href="<?php echo WEB_ROOT ?>">
                                <i class="bi bi-grid"></i>
                                <span>User Dashboard</span>
                            </a>
                        </li>
                      <!--   <li class="nav-item">
                            <a class="nav-link collapsed" href="module/profile.php">
                                <i class="bi bi-person"></i>
                                <span>Profile</span>
                            </a>
                        </li> -->
                        <?php
                        break;
                }
            }
        ?>
    </ul>
</aside>
