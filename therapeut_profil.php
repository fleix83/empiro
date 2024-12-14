<?php
require_once 'includes/init.php';
require_once 'config/database.php';

if (!isset($_GET['id'])) {
    echo "Therapeut ID fehlt.";
    exit;
}

$therapist_id = $_GET['id'];

try {
    // Fetch therapist details
    $stmt = $pdo->prepare("SELECT * FROM therapists WHERE id = ?");
    $stmt->execute([$therapist_id]);
    $therapist = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$therapist) {
        echo "Therapeut nicht gefunden.";
        exit;
    }

    // Fetch posts mentioning this therapist
    $stmt = $pdo->prepare("SELECT p.*, u.username FROM posts p JOIN users u ON p.user_id = u.id WHERE p.therapist = ? ORDER BY p.created_at DESC");
    $stmt->execute([$therapist_id]);
    $posts = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    echo "Fehler: " . $e->getMessage();
    exit;
}
// Navbar nach AJAX request
require_once 'includes/header.php';
require_once 'navbar.php';
?>

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($therapist['first_name'] . ' ' . $therapist['last_name']); ?> - Therapeutenprofil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <style>
        body {
            min-height: 100vh;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 48rem;
            margin: 0 auto;
        }
        .card {
            background-color: #ffffff;
            border-radius: 0.5rem;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }
        .card-header {
            padding: 1.5rem;
            border-bottom: 1px solid #e5e7eb;
        }
        .card-title {
            font-size: 1.875rem;
            font-weight: 600;
            text-align: center;
            color: #1f2937;
            font-family: Georgia, serif;
        }
        .card-content {
            padding: 1.5rem;
        }
        .therapist-info {
            background-color: #ffffff;
            border-radius: 0.5rem;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: inset 0 2px 4px 0 rgba(0, 0, 0, 0.06);
        }
        .therapist-name {
            font-size: 1.5rem;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 1rem;
            font-family: Georgia, serif;
        }
        .therapist-detail {
            display: flex;
            align-items: center;
            color: #4b5563;
            margin-bottom: 0.5rem;
        }
        .therapist-detail i {
            color: #14b8a6;
            margin-right: 0.5rem;
            font-size: 1.25rem;
        }
        .therapist-description {
            margin-top: 1.5rem;
        }
        .therapist-description h3 {
            font-size: 1.25rem;
            font-weight: 600;
            color: #1f2937;
            display: flex;
            align-items: center;
            margin-bottom: 0.5rem;
        }
        .therapist-description p {
            color: #4b5563;
            line-height: 1.5;
        }
        .posts-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 1rem;
            font-family: Georgia, serif;
        }
        .post-card {
            background-color: #ffffff;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            transition: box-shadow 0.3s ease-in-out;
        }
        .post-card:hover {
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }
        .post-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 0.5rem;
        }
        .post-meta {
            font-size: 0.875rem;
            color: #6b7280;
            margin-bottom: 0.75rem;
            display: flex;
            align-items: center;
        }
        .post-meta i {
            margin-right: 0.25rem;
        }
        .post-content {
            color: #4b5563;
            margin-bottom: 1rem;
        }
        .read-more {
            display: inline-block;
            padding: 0.5rem 1rem;
            background-color: #ffffff;
            color: #14b8a6;
            border: 1px solid #14b8a6;
            border-radius: 0.25rem;
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s;
        }
        .read-more:hover {
            background-color: #14b8a6;
            color: #ffffff;
        }

            .chat-message {
        margin-bottom: 15px;
        padding: 10px;
        border-radius: 8px;
    }

    .user-message {
        background-color: #e3f2fd;
        margin-left: 20%;
        margin-right: 5px;
    }

    .ai-message {
        background-color: #f5f5f5;
        margin-right: 20%;
        margin-left: 5px;
    }

    .system-message {
        background-color: #fff3e0;
        text-align: center;
        margin: 10px 25%;
        font-style: italic;
    }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h1 class="card-title">Therapeutenprofil</h1>
            </div>
            <div class="card-content">
                <div class="therapist-info">
                    <h2 class="therapist-name">
                        <?php echo htmlspecialchars($therapist['form_of_address'] . ' ' . $therapist['first_name'] . ' ' . $therapist['last_name']); ?>
                    </h2>
                    <p class="therapist-detail">
                        <i class="bi bi-geo-alt-fill"></i>
                        <?php echo htmlspecialchars($therapist['canton']); ?>
                    </p>
                    <p class="therapist-detail">
                        <i class="bi bi-person-badge"></i>
                        <?php echo htmlspecialchars($therapist['designation']); ?>
                    </p>
                    <?php if (!empty($therapist['institution'])): ?>
                        <p class="therapist-detail">
                            <i class="bi bi-building"></i>
                            <?php echo htmlspecialchars($therapist['institution']); ?>
                        </p>
                    <?php endif; ?>
                    <?php if (!empty($therapist['description'])): ?>
                        <div class="therapist-description">
                            <h3>
                                <i class="bi bi-file-text"></i>
                                Beschreibung
                            </h3>
                            <p><?php echo nl2br(htmlspecialchars($therapist['description'])); ?></p>
                        </div>
                    <?php endif; ?>
                </div>

                <h3 class="posts-title">Beiträge über diesen Therapeuten</h3>
                
                <?php if (empty($posts)): ?>
                    <p class="text-gray-600">Es wurden noch keine Beiträge über diesen Therapeuten verfasst.</p>
                <?php else: ?>
                    <?php foreach ($posts as $post): ?>
                        <div class="post-card">
                            <h4 class="post-title"><?php echo htmlspecialchars($post['title']); ?></h4>
                            <p class="post-meta">
                                <i class="bi bi-person"></i>
                                <?php echo htmlspecialchars($post['username']); ?>
                                <span class="mx-2">•</span>
                                <i class="bi bi-calendar"></i>
                                <?php echo date('d.m.Y', strtotime($post['created_at'])); ?>
                            </p>
                            <p class="post-content"><?php echo nl2br(htmlspecialchars(substr($post['content'], 0, 200) . '...')); ?></p>
                            <a href="post.php?id=<?php echo $post['id']; ?>" class="read-more">Weiterlesen</a>
                        </div>
                    <?php endforeach; ?>
                <?php endif; ?>
            </div>
        </div>
        <div class="analysis-section mt-4">
    <h3>Analyse der Beiträge</h3>
    <button id="analyzeBtn" class="btn btn-primary mb-3">Beiträge analysieren</button>
    
    <div id="analysisResults" style="display: none;">
        <div class="card">
            <div class="card-body">
                <div id="analysisStats" class="mb-3">
                    <!-- Stats will be inserted here -->
                </div>
                <div id="chatInterface" class="mt-3">
                    <div id="chatMessages" class="mb-3 p-3 border rounded" style="max-height: 300px; overflow-y: auto;">
                        <!-- Chat messages will appear here -->
                    </div>
                    <div class="input-group">
                        <input type="text" id="userQuery" class="form-control" 
                               placeholder="Stellen Sie eine Frage über diesen Therapeuten...">
                        <button id="submitQuery" class="btn btn-primary">Fragen</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    </div>


    <script>
document.addEventListener('DOMContentLoaded', function() {
    const analyzeBtn = document.getElementById('analyzeBtn');
    const analysisResults = document.getElementById('analysisResults');
    const analysisStats = document.getElementById('analysisStats');
    const chatMessages = document.getElementById('chatMessages');
    const userQuery = document.getElementById('userQuery');
    const submitQuery = document.getElementById('submitQuery');

    // Initialize therapistData in global scope
    let therapistData = null;

    analyzeBtn.addEventListener('click', async () => {
        try {
            // Show loading state
            analyzeBtn.disabled = true;
            analyzeBtn.textContent = 'Lädt...';

            // Fetch the analysis data
            const response = await fetch(`${window.location.origin}/pandoc_messages/therapeut_analysis.php?id=<?= $therapist['id'] ?>`);
            
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            // Store the response data in therapistData
            therapistData = await response.json();
            console.log('Received therapist data:', therapistData);  // Debug log

            if (therapistData.error) {
                throw new Error(therapistData.error);
            }

            // Display basic stats
            analysisStats.innerHTML = `
                <p><strong>Anzahl Beiträge:</strong> ${therapistData.summary.total_posts}</p>
                ${therapistData.summary.latest_post ? 
                    `<p><strong>Letzter Beitrag:</strong> ${new Date(therapistData.summary.latest_post).toLocaleDateString('de-CH')}</p>` 
                    : ''}
            `;

            // Show the results section
            analysisResults.style.display = 'block';
            
            // Reset button state
            analyzeBtn.disabled = false;
            analyzeBtn.textContent = 'Beiträge analysieren';

        } catch (error) {
            console.error('Error:', error);
            alert('Ein Fehler ist aufgetreten: ' + error.message);
            
            // Reset button state
            analyzeBtn.disabled = false;
            analyzeBtn.textContent = 'Beiträge analysieren';
        }
    });

    submitQuery.addEventListener('click', async () => {
        // Check if analysis has been run first
        if (!therapistData) {
            alert('Bitte zuerst die Analyse durchführen.');
            return;
        }

        if (!userQuery.value.trim()) {
            alert('Bitte geben Sie eine Frage ein.');
            return;
        }

        const query = userQuery.value.trim();
        
        // Add user question to chat
        const userMessageDiv = document.createElement('div');
        userMessageDiv.className = 'chat-message user-message';
        userMessageDiv.innerHTML = `<strong>Ihre Frage:</strong> ${query}`;
        chatMessages.appendChild(userMessageDiv);

        // Add loading indicator
        const loadingDiv = document.createElement('div');
        loadingDiv.className = 'chat-message system-message';
        loadingDiv.innerHTML = 'Analysiere...';
        chatMessages.appendChild(loadingDiv);

        // Clear input
        userQuery.value = '';
        
        try {
            const response = await fetch('ai_handler.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    query: query,
                    therapistData: therapistData
                })
            });

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            const data = await response.json();
            console.log('AI Response:', data);  // Debug log

            // Remove loading indicator
            loadingDiv.remove();

            // Add AI response to chat
            const aiMessageDiv = document.createElement('div');
            aiMessageDiv.className = 'chat-message ai-message';
            
            if (data.error) {
                aiMessageDiv.innerHTML = `<strong>Error:</strong> ${data.error}`;
            } else {
                aiMessageDiv.innerHTML = `<strong>Analyse:</strong> ${data.response}`;
            }
            
            chatMessages.appendChild(aiMessageDiv);
            
            // Scroll to bottom
            chatMessages.scrollTop = chatMessages.scrollHeight;

        } catch (error) {
            console.error('Error:', error);
            loadingDiv.innerHTML = `<strong>Error:</strong> ${error.message}`;
        }
    });

    // Allow Enter key to submit
    userQuery.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            submitQuery.click();
        }
    });
});
</script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>