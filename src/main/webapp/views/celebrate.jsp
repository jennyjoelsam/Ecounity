<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Registered</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #228B22;
            --text-color: #333333;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: white;
            color: var(--text-color);
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            margin: 0;
            padding: 0;
            overflow: hidden;
            text-align: center;
            position: relative;
        }

        .message {
            font-size: 28px;
            font-weight: 600;
            color: var(--primary-color);
            z-index: 10;
            position: relative;
        }

        /* Tree falling animation */
        .tree {
            position: absolute;
            width: 40px;
            height: 40px;
            user-select: none;
            pointer-events: none;
            top: -50px;
            animation: fall linear infinite;
        }

        @keyframes fall {
            0% { transform: translateY(0); opacity: 1; }
            100% { transform: translateY(100vh); opacity: 0; }
        }
    </style>
</head>
<body>

    <div class="message">Event Successfully Registered 🎉</div>

    <script>
        const treeImages = ["tree.png", "tree1.png", "tree2.png", "tree3.png", "tree4.png"];

        function createTree() {
            const tree = document.createElement('img');
            tree.src = treeImages[Math.floor(Math.random() * treeImages.length)];
            tree.classList.add('tree');

            // Random horizontal position across the full width
            tree.style.left = `${Math.random() * window.innerWidth}px`;

            // Random fall speed between 3s and 6s
            tree.style.animationDuration = `${Math.random() * 3 + 3}s`;

            document.body.appendChild(tree);

            // Remove tree after animation ends
            setTimeout(() => { tree.remove(); }, 6000);
        }

        // Create falling trees at intervals
        setInterval(createTree, 300);
    </script>

</body>
</html>
