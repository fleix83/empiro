<?php
// Start the session if not already started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Include database connection using absolute path
require_once __DIR__ . '/config/database.php';

// Check if user is banned
try {
    $stmt = $pdo->prepare("SELECT is_banned FROM users WHERE id = ?");
    $stmt->execute([$_SESSION['user_id']]);
    $user = $stmt->fetch();
    
    if ($user && $user['is_banned']) {
        $_SESSION['error'] = "Ihr Account ist derzeit eingeschränkt. Sie haben keinen Zugriff auf diese Seite.";
        header('Location: forum.php');
        exit;
    }
} catch (PDOException $e) {
    error_log("Error checking user ban status: " . $e->getMessage());
    header('Location: forum.php');
    exit;
}

// Check if post ID is provided in the URL
if (!isset($_GET['id'])) {
    echo "Post ID fehlt.";
    exit;
}



// Success Message or Error after Post edit
if (isset($_SESSION['message'])): ?>
    <div class="alert alert-success">
        <?php
        echo $_SESSION['message'];
        unset($_SESSION['message']);
        ?>
    </div>
<?php endif; ?>

<?php if (isset($_SESSION['error'])): ?>
    <div class="alert alert-danger">
        <?php
        echo $_SESSION['error'];
        unset($_SESSION['error']);
        ?>
    </div>
<?php endif; ?>

<?php
$post_id = $_GET['id'];

// Fetch the original post along with additional fields and tags
try {
    $stmt = $pdo->prepare("
        SELECT posts.id, posts.title, posts.content, posts.user_id, posts.canton, posts.therapist, posts.designation, 
               users.username, IFNULL(users.avatar_url, 'path/to/default-avatar.png') AS avatar_url, 
               categories.name_de AS category,
               posts.tags,
               therapists.form_of_address AS therapist_anrede,
               therapists.last_name AS therapist_nachname,
               therapists.first_name AS therapist_vorname,
               therapists.designation AS therapist_berufsbezeichnung,
               therapists.institution AS therapist_institution,
               therapists.canton AS therapist_canton
        FROM posts 
        JOIN users ON posts.user_id = users.id
        JOIN categories ON posts.category_id = categories.id
        LEFT JOIN therapists ON posts.therapist = therapists.id
        WHERE posts.id = :post_id
        LIMIT 1
    ");
    $stmt->execute(['post_id' => $post_id]);
    $post = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$post) {
        echo "Post nicht gefunden.";
        exit;
    }

    // Fetch comments for this specific post only
    $stmt = $pdo->prepare("SELECT comments.id, comments.content, comments.user_id, comments.created_at, users.username, IFNULL(users.avatar_url, 'path/to/default-avatar.png') AS avatar_url
                           FROM comments 
                           JOIN users ON comments.user_id = users.id 
                           WHERE comments.post_id = :post_id 
                           ORDER BY comments.created_at ASC");
    $stmt->execute(['post_id' => $post_id]);
    $comments = $stmt->fetchAll();

} catch (PDOException $e) {
    echo "Fehler: " . $e->getMessage();
    exit;
}

// Process comment submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['comment_content']) && !empty($_POST['comment_content'])) {
        $comment_content = $_POST['comment_content'];
        $user_id = $_SESSION['user_id']; // Assuming user is logged in and you have user ID in session

        try {
            // Insert the comment into database
            $stmt = $pdo->prepare("INSERT INTO comments (post_id, user_id, content) VALUES (?, ?, ?)");
            $stmt->execute([$post_id, $user_id, $comment_content]);
            
            // Redirect back to the same post page after saving comment
            header("Location: post.php?id=$post_id");
            exit;

        } catch (PDOException $e) {
            echo "Fehler beim Speichern des Kommentars: " . $e->getMessage();
        }
    } else {
        echo "Kommentarinhalt fehlt.";
    }
}

// Includes unter AJAX calls
require_once 'navbar.php';
require_once 'includes/summernote.php';
require_once __DIR__ . '/includes/header.php';
?>

<main class="container-fluid px-0 my-5">
    <div class="row justify-content-center">
        <div class="col-lg-11 col-md-12 col-sm-12">
            <!-- <article class="post-post-container card shadow-sm mb-4"> -->
                <div class="post card-body">
                    <!-- Post Meta Top -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <span class="badge bg-primary me-2"><?= htmlspecialchars($post['category']) ?></span>
                            <img src="uploads/kantone/<?= htmlspecialchars($post['canton']) ?>.png" alt="<?= htmlspecialchars($post['canton']) ?> Flagge" style="width: 20px; height: 20px;" class="me-1">
                            <small class="post-post-user text-muted"><?= htmlspecialchars($post['canton']) ?></small>
                        </div>
                        <div class="d-flex align-items-center">
                            <img src="<?= htmlspecialchars($post['avatar_url']) ?>" class="avatar rounded-circle me-2" alt="Avatar">
                            <span class="post-post-user text-muted"><?= htmlspecialchars($post['username']) ?></span>
                        </div>
                    </div>

                    <!-- Post Title -->
                    <div class="col-md-8">
                        <h2 class="post-post-title card-title"><?= htmlspecialchars($post['title']) ?></h2>
                    </div>

                    <!-- Therapist and Designation -->
                    <div class="therapist-info mb-3">
                        <?php if ($post['category'] === 'Erfahrung' && $post['therapist']): ?>
                            <div class="therapist-info">
                                <span><small>Erfahrung mit</small></span>
                                <a href="therapeut_profil.php?id=<?= htmlspecialchars($post['therapist']) ?>" class="therapist-link">
                                    <?php
                                    $therapistDetails = [];
                                    if (!empty($post['therapist_anrede'])) $therapistDetails[] = htmlspecialchars($post['therapist_anrede']);
                                    if (!empty($post['therapist_nachname'])) $therapistDetails[] = htmlspecialchars($post['therapist_nachname']);
                                    if (!empty($post['therapist_vorname'])) $therapistDetails[] = htmlspecialchars($post['therapist_vorname']);
                                    if (!empty($post['therapist_berufsbezeichnung'])) $therapistDetails[] = htmlspecialchars($post['therapist_berufsbezeichnung']);
                                    if (!empty($post['therapist_institution'])) $therapistDetails[] = htmlspecialchars($post['therapist_institution']);
                                    // if (!empty($post['therapist_canton'])) $therapistDetails[] = htmlspecialchars($post['therapist_canton']);
                                    
                                    echo implode(', ', $therapistDetails);
                                    ?>
                                </a>
                            </div>
                        <?php endif; ?>
                    </div>

                    <!-- Post Content -->
                    <div class="post-post-content">
                        <div class="card-text"><?= $post['content'] ?></div>
                        <!-- Display Tags -->
                        <?php if (!empty($post['tags'])): ?>
                            <div class="post-tags mt-3">
                                <?php foreach (explode(',', $post['tags']) as $tag): ?>
                                    <span class="badge bg-secondary me-1"><?= htmlspecialchars(trim($tag)) ?></span>
                                <?php endforeach; ?>
                            </div>
                        <?php endif; ?>
                    </div>

                    <!-- Button to reveal comments section - Antworten -->
                    <a href="#comments" id="toggle-comment-btn" class="btn btn-outline-primary btn-sm mb-5">Antworten</a>
                    <!-- Edit Post Link -->
                    <?php if (isset($_SESSION['user_id']) && $_SESSION['user_id'] == $post['user_id']): ?>
                        <a href="edit_post.php?id=<?= $post['id'] ?>" class="btn btn-outline-primary btn-sm">Beitrag bearbeiten</a>
                    <?php endif; ?>
                    <?php
                    // Check if user is logged in and not viewing their own post
                    if (isset($_SESSION['user_id']) && $_SESSION['user_id'] != $post['user_id']) {
                        // Check if private messages are enabled for both users and no blocks exist
                        $stmt = $pdo->prepare("
                            SELECT 
                                visitor.messages_active AS visitor_active,
                                author.messages_active AS author_active,
                                (SELECT COUNT(*) FROM user_blocks 
                                WHERE (blocker_id = ? AND blocked_id = ?) 
                                    OR (blocker_id = ? AND blocked_id = ?)
                                ) as is_blocked
                            FROM users visitor, users author 
                            WHERE visitor.id = ? AND author.id = ?
                        ");
                        $stmt->execute([
                            $_SESSION['user_id'], $post['user_id'],  // For first block check
                            $post['user_id'], $_SESSION['user_id'],  // For second block check
                            $_SESSION['user_id'], $post['user_id']   // For users lookup
                        ]);
                        $message_settings = $stmt->fetch(PDO::FETCH_ASSOC);
                        
                        if ($message_settings && 
                            $message_settings['visitor_active'] && 
                            $message_settings['author_active'] && 
                            !$message_settings['is_blocked']) {
                            ?>
                            <a href="messages.php?author_id=<?= $post['user_id'] ?>&post_id=<?= $post['id'] ?>" 
                               class="btn btn-outline-primary btn-sm ms-2 mb-5">Private Mitteilung</a>
                            <?php
                        }
                    }
                    ?>


                    <h3 class="card-title mb-4">Antworten</h3>
                        <?php if (empty($comments)): ?>
                            <p class="text-muted">Noch keine Kommentare. Sei der Erste!</p>
                        <?php else: ?>
                            <?php foreach ($comments as $comment): ?>
                                <div class="comment mb-3 pb-3 border-bottom">
                                    <div class="d-flex align-items-center mb-2">
                                        <img src="<?= htmlspecialchars($comment['avatar_url']) ?>" class="avatar rounded-circle me-2" alt="Avatar" style="width: 30px; height: 30px;">
                                        <strong><?= htmlspecialchars($comment['username']) ?></strong>
                                        <small class="text-muted ms-auto"><?= date('d.m.Y H:i', strtotime($comment['created_at'])) ?></small>
                                    </div>
                                    <p class="mb-0"><?= nl2br(htmlspecialchars($comment['content'])) ?></p>
                                </div>
                            <?php endforeach; ?>
                        <?php endif; ?>
                </div>

                <!-- Comments Section -->
                <section id="comments" class="card" style="display: none;">
                    <div class="card-body">
                        

                        <!-- Add Comment Form -->
                        <h4 class="mt-4 mb-3">Neue Antwort</h4>
                        <form id="comment-form" action="post.php?id=<?= $post_id ?>" method="post">
                            <div class="mb-3">
                                <textarea id="comment_content" name="comment_content" class="form-control" rows="3" placeholder="Deine Antwort..." required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Kommentar speichern</button>
                        </form>
                    </div>
                </section>
            <!-- </article> -->
        </div>           
    </div>
</main>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Comment Section -->
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const toggleCommentBtn = document.getElementById('toggle-comment-btn');
        const commentSection = document.getElementById('comments');

        // Toggle visibility of the comment section on button click
        toggleCommentBtn.addEventListener('click', function() {
            if (commentSection.style.display === 'none') {
                commentSection.style.display = 'block';
                toggleCommentBtn.style.display = 'none'; // Hide the button after revealing the comment section
            }
        });
    });
</script>

</body>
</html>