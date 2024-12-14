<?php
require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/includes/init.php';
require_once __DIR__ . '/includes/language_handler.php';
require_once __DIR__ . '/includes/language_utils.php';
require_once __DIR__ . '/includes/header.php';

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Add language switcher
$availableLanguages = [
    'de' => 'Deutsch',
    'fr' => 'Français',
    'it' => 'Italiano'
];

// Function to check if user has required role
function hasRole($requiredRole) {
    $userRole = $_SESSION['role'] ?? '';
    if ($requiredRole === 'moderator') {
        return $userRole === 'moderator' || $userRole === 'admin';
    } elseif ($requiredRole === 'admin') {
        return $userRole === 'admin';
    }
    return false;
}

// Get the avatar filename from the session
$avatarFilename = $_SESSION['avatar'] ?? 'default-avatar.png';

// Build the full avatar path
$avatarPath = BASE_URL . 'uploads/avatars/' . $avatarFilename;

// Generate a unique query parameter to prevent caching
$avatarCacheBuster = '?t=' . time(); // You can also use a hash of the file if preferred
?>

<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div id="logo">
        <a class="navbar-brand" href="<?php echo BASE_URL; ?>forum.php">
            <!-- <h1 class="logo">MEINE<br>ERFAHRUNG</h1> -->
            <h1 class="logo">EMPIRO</h1>
            <!-- <h2 class="logo">MIT PSYCHOTHERAPEUTEN* <br> IN DER SCHWEIZ</h2> -->
            <h2 class="logo">MEINE ERFAHRUNG <BR> MIT PSYCHOTHERAPEUTEN* <br> IN DER SCHWEIZ</h2>
        </a>
    </div>

    <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button> -->
    <div class="collapse navbar-collapse d-none d-lg-flex" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <?php if (isset($_SESSION['user_id']) && isset($_SESSION['role']) && ($_SESSION['role'] === 'admin' || $_SESSION['role'] === 'moderator')): ?>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle badge bg-navlinks" href="#" id="navbarPanel" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <?= __('nav_panel') ?>
                    </a>
                    <div class="dropdown-menu panel-dropdown" aria-labelledby="navbarPanel">
                        <?php if (hasRole('moderator')): ?>
                            <a class="dropdown-item" href="<?php echo BASE_URL; ?>panel/moderation.php"><?= __('nav_moderation') ?></a>
                        <?php endif; ?>
                        <?php if (hasRole('admin')): ?>
                            <a class="dropdown-item" href="<?php echo BASE_URL; ?>panel/user_admin.php"><?= __('nav_user_admin') ?></a>
                            <a class="dropdown-item" href="<?php echo BASE_URL; ?>panel/category_panel.php"><?= __('nav_category_panel') ?></a>
                            <a class="dropdown-item" href="<?php echo BASE_URL; ?>panel/designation_panel.php"><?= __('nav_designation_panel') ?></a>
                        <?php endif; ?>
                    </div>
                </li>
            <?php endif; ?>

            <li class="nav-item">
                <a class="nav-link badge bg-navlinks" href="<?php echo BASE_URL; ?>forum.php"><?= __('nav_forum') ?></a>
            </li>
            <li class="nav-item">
                <a class="nav-link badge bg-navlinks" href="<?php echo BASE_URL; ?>guidelines.php"><?= __('nav_guidelines') ?></a>
            </li>

            <!-- Language Switcher -->
            <!-- <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="langDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <?= $availableLanguages[getCurrentLanguage()] ?>
                </a>
                <ul class="dropdown-menu" aria-labelledby="langDropdown">
                    <?php foreach ($availableLanguages as $code => $name): ?>
                        <li>
                            <a class="dropdown-item <?= getCurrentLanguage() === $code ? 'active' : '' ?>" 
                               href="?lang=<?= $code ?>">
                                <?= $name ?>
                            </a>
                        </li>
                    <?php endforeach; ?>
                </ul>
            </li> -->

            <?php if (isset($_SESSION['user_id'])): ?>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarAvatar" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="<?php echo htmlspecialchars($avatarPath . $avatarCacheBuster); ?>" alt="User Avatar" class="navbar-avatar">
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarAvatar">
                    <a class="dropdown-item" href="<?php echo BASE_URL; ?>user.php"><?= __('nav_profile') ?></a>
                        
                        <!-- Language Selection as nested dropdown -->
                        <div class="dropdown-divider"></div>
                        <div class="dropdown"> <!-- Changed from dropend to dropstart -->
                            <a class="dropdown-item menu d-flex justify-content-between align-items-center" href="#" id="languageDropdown" role="button">
                                <i class="fas fa-chevron-left"></i> <!-- Changed from right to left -->
                                <span><?= __('nav_language') ?> (<?= $availableLanguages[getCurrentLanguage()] ?>)</span>
                            </a>
                            <ul class="dropdown-menu dropdown-submenu" aria-labelledby="languageDropdown">
                                <?php foreach ($availableLanguages as $code => $name): ?>
                                    <li>
                                        <a class="dropdown-item submenu <?= getCurrentLanguage() === $code ? 'active' : '' ?>" 
                                        href="?lang=<?= $code ?>">
                                        <?= $name ?>
                                        </a>
                                    </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="<?php echo BASE_URL; ?>logout.php"><?= __('nav_logout') ?></a>
                    </div>
                </li>
            <?php else: ?>
                <!-- Keep the non-logged in version as is -->
                <li class="nav-item">
                    <a class="nav-link badge bg-navlinks" href="<?php echo BASE_URL; ?>login.php"><?= __('nav_login') ?></a>
                </li>
            <?php endif; ?>
        </ul>
    </div>
</nav>

<!-- Mobile Menu (displays below md breakpoint) -->
<div class="mobile-menu d-block d-lg-none">
    <button class="mobile-menu-trigger" id="mobileMenuTrigger">
        <img src="<?php echo htmlspecialchars($avatarPath . $avatarCacheBuster); ?>" 
             alt="Menu" 
             class="mobile-avatar">
    </button>
    
    <div class="mobile-menu-panel" id="mobileMenuPanel">
        <!-- User Header -->
        <div class="mobile-user-header">
            <img src="<?php echo htmlspecialchars($avatarPath . $avatarCacheBuster); ?>" 
                 alt="<?php echo htmlspecialchars($_SESSION['username'] ?? 'User'); ?>" 
                 class="mobile-panel-avatar">
            <span class="mobile-username"><?php echo htmlspecialchars($_SESSION['username'] ?? 'User'); ?></span>
        </div>

        <!-- Menu Items -->
        <div class="mobile-menu-items">
            <a href="<?php echo BASE_URL; ?>forum.php" class="mobile-menu-item">
                <i class="bi bi-house"></i> <?= __('nav_forum') ?>
            </a>

            <!-- Language Submenu -->
            <div class="mobile-submenu">
                <button class="mobile-menu-item submenu-trigger">
                    <i class="bi bi-globe"></i> <?= __('nav_language') ?>
                    <i class="bi bi-chevron-down submenu-icon"></i>
                </button>
                <div class="submenu-content">
                    <?php foreach ($availableLanguages as $code => $name): ?>
                        <a href="?lang=<?= $code ?>" 
                           class="mobile-menu-item submenu-item <?= getCurrentLanguage() === $code ? 'active' : '' ?>">
                            <?= $name ?>
                        </a>
                    <?php endforeach; ?>
                </div>
            </div>

            <!-- Profile Link -->
            <a href="<?php echo BASE_URL; ?>user.php" class="mobile-menu-item">
                <i class="bi bi-person"></i> <?= __('nav_profile') ?>
            </a>

            <!-- Panel Submenu (if user has permissions) -->
            <?php if (isset($_SESSION['user_id']) && isset($_SESSION['role']) && ($_SESSION['role'] === 'admin' || $_SESSION['role'] === 'moderator')): ?>
                <div class="mobile-submenu">
                    <button class="mobile-menu-item submenu-trigger">
                        <i class="bi bi-gear"></i> <?= __('nav_panel') ?>
                        <i class="bi bi-chevron-down submenu-icon"></i>
                    </button>
                    <div class="submenu-content">
                        <?php if (hasRole('moderator')): ?>
                            <a href="<?php echo BASE_URL; ?>panel/moderation.php" class="mobile-menu-item submenu-item">
                                <i class="bi bi-shield"></i> <?= __('nav_moderation') ?>
                            </a>
                        <?php endif; ?>
                        <?php if (hasRole('admin')): ?>
                            <a href="<?php echo BASE_URL; ?>panel/user_admin.php" class="mobile-menu-item submenu-item">
                                <i class="bi bi-people"></i> <?= __('nav_user_admin') ?>
                            </a>
                            <a href="<?php echo BASE_URL; ?>panel/category_panel.php" class="mobile-menu-item submenu-item">
                                <i class="bi bi-tags"></i> <?= __('nav_category_panel') ?>
                            </a>
                            <a href="<?php echo BASE_URL; ?>panel/designation_panel.php" class="mobile-menu-item submenu-item">
                                <i class="bi bi-list-check"></i> <?= __('nav_designation_panel') ?>
                            </a>
                        <?php endif; ?>
                    </div>
                </div>
            <?php endif; ?>

            <!-- Logout Divider and Link -->
            <div class="mobile-menu-divider"></div>
            <a href="<?php echo BASE_URL; ?>logout.php" class="mobile-menu-item">
                <i class="bi bi-box-arrow-right"></i> <?= __('nav_logout') ?>
            </a>
        </div>
    </div>
</div>

<style>
    .navbar-expand-lg .navbar-nav  {
        flex-direction: row;
        align-items: center;
    }

    .bg-light {
        background-color: none !important;
    }

    .navbar-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
    }

    .dropdown-menu {
        background-color: #ffffff;
    }
    .dropdown-menu>a {
        margin: 0 0;
    }

    .nav-item.dropdown {
        position: relative;
    }

    .dropdown-menu.panel-dropdown {
        margin-top: 5px;
    }

    .dropdown-item.menu {
        margin: 0 0;
    }

    .dropdown-item {
        padding: 0.5rem 1rem;
        width: 90%;
    }

    .dropdown-item:hover {
        background-color: #f8f9fa;
    }

    /* Main dropdown menu styles */
    .nav-item.dropdown > .dropdown-menu,
    .dropdown-menu-right {
        left: auto;
        right: 0;
    }

    /* Show main dropdown on hover for desktop only */
    @media (min-width: 992px) {
        .nav-item.dropdown:hover > .dropdown-menu,
        .nav-item.dropdown:hover > .dropdown-menu-right {
            display: block;
        }

        .nav-item.dropdown .dropdown-toggle::after {
            display: none;
        }
    }

    /* Language submenu specific styles */
    .dropdown-submenu {
    display: none !important; /* Force hide initially */
    position: absolute;
    left: auto;
    right: 100%; /* Changed from left:100% to right:100% */
    top: 0;
    margin-top: -1px;
}
    .dropdown-submenu.show {
        display: block !important;
    }

    ul.dropdown-menu.dropdown-submenu > li:hover {
        background-color: #f8f9fa;
        color: #000;
    }

    .dropdown-item.submenu.active {
        margin: 0 0;
    }

    /* Mobile adjustments */
    @media (max-width: 991px) {
        .navbar-nav .dropdown-menu,
        .dropdown-submenu {
            position: static;
            float: none;
        }

        .dropdown-submenu {
            margin-left: 1rem;
        }
    }

   /* Chevron icon styling */
    .dropdown-item .svg-inline--fa  { 
        font-size: 0.8em;
        margin-right: 0.5rem; 
    }

    .dropdown-item.active {
        background-color: #f8f9fa;
        color: #000;
    }

    .dropstart .dropdown-item {
        display: flex;
        flex-direction: row-reverse; /* Reverse the direction of flex items */
        justify-content: space-between;
    }

    /* Mobile adjustments */
    @media (max-width: 991px) {
        .navbar-nav .dropdown-menu,
        .dropdown-submenu {
            position: static;
            float: none;
        }

        .dropdown-submenu {
            margin-right: 1rem; /* Changed from margin-left to margin-right */
        }
        
        /* Keep the submenu on the left side even on mobile */
        .dropstart .dropdown-item {
            flex-direction: row-reverse;
        }
    }

/* Mobile Menu Styles */
.mobile-menu {
    position: relative;
}

.mobile-menu-trigger {
    position: fixed;
    top: 1rem;
    right: 1rem;
    z-index: 1020;
    background: none;
    border: none;
    padding: 0;
}

.mobile-avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    border: 2px solid #fff;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.mobile-menu-panel {
    position: fixed;
    top: 0;
    right: -100%;
    width: 33%;
    min-width: 230px;
    max-width: 350px;
    height: 100vh;
    background: #fff;
    z-index: 1030;
    transition: right 0.2s ease;
    box-shadow: -2px 0 5px rgba(0,0,0,0.1);
}

.mobile-menu-panel.active {
    right: 0;
}

.mobile-user-header {
    padding: 1.5rem 1rem;
    display: flex;
    align-items: center;
    gap: 1rem;
    border-bottom: 1px solid #eee;
}

.mobile-panel-avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    border: 2px solid #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.mobile-username {
    font-weight: 500;
    font-size: 1.1rem;
}

.mobile-menu-items {
    padding: 1rem 0;
}

.mobile-menu-item {
    display: flex;
    align-items: center;
    padding: 0.75rem 1.5rem;
    color: #333;
    text-decoration: none;
    transition: background-color 0.15s;
    gap: 0.75rem;
    width: 100%;
    border: none;
    background: none;
    text-align: left;
}

.mobile-menu-item:hover {
    background-color: #f8f9fa;
    color: #333;
}

.mobile-menu-item.active {
    background-color: #e9ecef;
}

.submenu-trigger {
    justify-content: flex-start;
}

.submenu-icon {
    transition: transform 0.15s;
}

.submenu-trigger[aria-expanded="true"] .submenu-icon {
    transform: rotate(180deg);
}

.submenu-content {
    display: none;
    background-color: #f8f9fa;
}

.submenu-content.active {
    display: block;
}

.submenu-item {
    padding-left: 3rem;
}

.mobile-menu-divider {
    height: 1px;
    background-color: #dee2e6;
    margin: 0.5rem 0;
}
</style>

<!-- Dropdown User Menu -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const languageDropdown = document.getElementById('languageDropdown');
    
    if (languageDropdown) {
        languageDropdown.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            const submenu = this.nextElementSibling;
            if (submenu) {
                // Toggle show class instead of inline style
                submenu.classList.toggle('show');
            }
        });

        // Close submenu when clicking outside
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.dropend')) {
                const submenu = languageDropdown.nextElementSibling;
                if (submenu) {
                    submenu.classList.remove('show');
                }
            }
        });

        // Close submenu when main dropdown closes
        const mainDropdown = languageDropdown.closest('.dropdown-menu');
        if (mainDropdown) {
            document.addEventListener('click', function(e) {
                if (!mainDropdown.contains(e.target)) {
                    const submenu = languageDropdown.nextElementSibling;
                    if (submenu) {
                        submenu.classList.remove('show');
                    }
                }
            });
        }
    }
});

// Mobile Menu JavaScript
document.addEventListener('DOMContentLoaded', function() {
    const mobileMenuTrigger = document.getElementById('mobileMenuTrigger');
    const mobileMenuPanel = document.getElementById('mobileMenuPanel');
    const submenuTriggers = document.querySelectorAll('.submenu-trigger');

    if (mobileMenuTrigger && mobileMenuPanel) {
        mobileMenuTrigger.addEventListener('click', function(e) {
            e.stopPropagation();
            mobileMenuPanel.classList.toggle('active');
        });

        // Close menu when clicking outside
        document.addEventListener('click', function(e) {
            if (!mobileMenuPanel.contains(e.target) && 
                !mobileMenuTrigger.contains(e.target)) {
                mobileMenuPanel.classList.remove('active');
            }
        });

        // Prevent menu close when clicking inside
        mobileMenuPanel.addEventListener('click', function(e) {
            e.stopPropagation();
        });
    }

    // Submenu toggles
    submenuTriggers.forEach(trigger => {
        trigger.addEventListener('click', function(e) {
            e.preventDefault();
            const submenuContent = this.nextElementSibling;
            const isExpanded = this.getAttribute('aria-expanded') === 'true';
            
            // Close other submenus
            document.querySelectorAll('.submenu-content.active').forEach(submenu => {
                if (submenu !== submenuContent) {
                    submenu.classList.remove('active');
                    submenu.previousElementSibling.setAttribute('aria-expanded', 'false');
                }
            });

            // Toggle current submenu
            submenuContent.classList.toggle('active');
            this.setAttribute('aria-expanded', !isExpanded);
        });
    });
});
</script>