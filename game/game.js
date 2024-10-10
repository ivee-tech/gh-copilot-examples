// Initialize scene, camera, and renderer
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

// Initialize OrbitControls
const controls = new THREE.OrbitControls(camera, renderer.domElement);
controls.enableDamping = true; // Enable damping (inertia)
controls.dampingFactor = 0.25; // Damping factor

// Create player (a simple cube)
const playerGeometry = new THREE.BoxGeometry();
const playerMaterial = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
const player = new THREE.Mesh(playerGeometry, playerMaterial);
scene.add(player);

// Set camera position
camera.position.z = 5;

// Initialize points
let points = 0;

// Create a DOM element to display points
const pointsDisplay = document.createElement('div');
pointsDisplay.style.position = 'absolute';
pointsDisplay.style.top = '10px';
pointsDisplay.style.left = '10px';
pointsDisplay.style.color = 'white';
pointsDisplay.style.fontSize = '20px';
pointsDisplay.innerHTML = `Points: ${points}`;
document.body.appendChild(pointsDisplay);

// Add some obstacles
const obstacles = [];
for (let i = 0; i < 5; i++) {
    const obstacleGeometry = new THREE.BoxGeometry();
    const obstacleMaterial = new THREE.MeshBasicMaterial({ color: 0xff0000 });
    const obstacle = new THREE.Mesh(obstacleGeometry, obstacleMaterial);
    obstacle.position.x = Math.random() * 10 - 5;
    obstacle.position.y = Math.random() * 10 - 5;
    scene.add(obstacle);
    obstacles.push(obstacle);
}

// Player movement
const playerSpeed = 0.1;
const keys = {};
document.addEventListener('keydown', (event) => {
    keys[event.key] = true;
});
document.addEventListener('keyup', (event) => {
    keys[event.key] = false;
});

// Collision detection
function checkCollisions() {
    const playerBox = new THREE.Box3().setFromObject(player);
    for (const obstacle of obstacles) {
        const obstacleBox = new THREE.Box3().setFromObject(obstacle);
        if (playerBox.intersectsBox(obstacleBox)) {
            console.log('Collision detected!');
            points -= 10; // Decrease points on collision
            updatePointsDisplay();
            return true;
        }
    }
    return false;
}

// Update points display
function updatePointsDisplay() {
    pointsDisplay.innerHTML = `Points: ${points}`;
}

// Animation loop
function animate() {
    requestAnimationFrame(animate);

    let moved = false;

    // Move player
    if (keys['ArrowUp']) {
        player.position.y += playerSpeed;
        moved = true;
    }
    if (keys['ArrowDown']) {
        player.position.y -= playerSpeed;
        moved = true;
    }
    if (keys['ArrowLeft']) {
        player.position.x -= playerSpeed;
        moved = true;
    }
    if (keys['ArrowRight']) {
        player.position.x += playerSpeed;
        moved = true;
    }

    // Check for collisions
    if (!checkCollisions() && moved) {
        points += 1; // Increase points if no collision and player moved
        updatePointsDisplay();
    }

    renderer.render(scene, camera);
}

animate();