<?php
require_once 'config/database.php';

session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $sender_id = $_SESSION['user_id'];
    $receiver_id = $_POST['receiver'];
    $content = $_POST['content'];

    try {
        $stmt = $pdo->prepare("INSERT INTO messages (sender_id, receiver_id, content) VALUES (?, ?, ?)");
        $stmt->execute([$sender_id, $receiver_id, $content]);
        header('Location: inbox.php');
    } catch (PDOException $e) {
        echo "Fehler beim Senden der Nachricht: " . $e->getMessage();
    }
}
?>
