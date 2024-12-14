<?php
require_once '../includes/init.php';
require_once '../config/database.php';

// Check if user is logged in and has moderator privileges
if (!isset($_SESSION['user_id']) /* || !is_moderator($_SESSION['user_id']) */) {
    header('Location: ../login.php');
    exit;
}

$post_id = $_GET['id'] ?? null;

if (!$post_id) {
    die("No post ID provided");
}

try {
    $stmt = $pdo->prepare("SELECT posts.*, users.username, users.id AS user_id, categories.name_de AS category_name 
                           FROM posts 
                           JOIN users ON posts.user_id = users.id
                           JOIN categories ON posts.category_id = categories.id
                           WHERE posts.id = ?");
    $stmt->execute([$post_id]);
    $post = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$post) {
        die("Post not found");
    }
} catch (PDOException $e) {
    die("Database error: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post Moderation Preview</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        .action-buttons {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container my-5">
        <h1 class="text-center mb-4">Moderation Vorschau</h1>
        
        <div class="card">
            <div class="card-header">
                <h2><?php echo htmlspecialchars($post['title']); ?></h2>
            </div>
            <div class="card-body">
                <p class="card-text"><?= $post['content'] ?></p>
            </div>
            <div class="card-footer">
                <p>Category: <?php echo htmlspecialchars($post['category_name']); ?></p>
                <p>Author: <?php echo htmlspecialchars($post['username']); ?></p>
                <p>Created at: <?php echo date('d/m/Y H:i', strtotime($post['created_at'])); ?></p>
                <p>Status: <?php echo $post['is_published'] ? 'Published' : 'Unpublished'; ?></p>
            </div>
        </div>

        <div class="action-buttons">
            <button class="btn btn-danger" onclick="deletePost(<?php echo $post['id']; ?>)">Delete</button>
            <button class="btn btn-warning" onclick="deactivatePost(<?php echo $post['id']; ?>)">Deactivate</button>
            <button class="btn btn-secondary" onclick="blockPost(<?php echo $post['id']; ?>)">Block</button>
            <button class="btn btn-info" onclick="messageUser(<?php echo $post['user_id']; ?>, <?php echo $post['id']; ?>)">Message</button>
            <button class="btn btn-success" onclick="publishPost(<?php echo $post['id']; ?>)">Publish</button>
            <a href="moderation.php" class="btn btn-primary">Back to Moderation Panel</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    function performAction(action, postId) {
        $.ajax({
            url: 'post_actions.php',
            type: 'POST',
            data: {
                action: action,
                post_id: postId
            },
            dataType: 'json',
            success: function(response) {
                if (response.success) {
                    alert(response.message);
                    window.location.href = 'moderation.php'; // Redirect back to moderation panel
                } else {
                    alert('Error: ' + response.message);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('AJAX error:', textStatus, errorThrown);
                alert('An error occurred while processing your request. Check the console for more details.');
            }
        });
    }

    function deletePost(postId) {
        if (confirm('Are you sure you want to delete this post?')) {
            performAction('delete', postId);
        }
    }

    function deactivatePost(postId) {
        if (confirm('Are you sure you want to deactivate this post?')) {
            performAction('deactivate', postId);
        }
    }

    function blockPost(postId) {
        if (confirm('Are you sure you want to block this post?')) {
            performAction('block', postId);
        }
    }

    function publishPost(postId) {
        if (confirm('Are you sure you want to publish this post?')) {
            performAction('publish', postId);
        }
    }

    function messageUser(userId, postId) {
        window.location.href = 'send_message.php?user_id=' + userId + '&post_id=' + postId;
    }
    </script>
</body>
</html>