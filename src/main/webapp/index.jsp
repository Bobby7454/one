<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Anime Realms — A 3D Illustrated Journey</title>
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;600;700&family=Playfair+Display:wght@700;900&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    html { scroll-behavior: smooth; }
    body {
      font-family: 'Quicksand', sans-serif;
      background: #05030f;
      color: #fff;
      overflow-x: hidden;
    }

    /* Fixed 3D canvas background */
    #canvas-container {
      position: fixed;
      top: 0; left: 0;
      width: 100vw;
      height: 100vh;
      z-index: 0;
      pointer-events: none;
    }

    /* Content overlay */
    .content {
      position: relative;
      z-index: 2;
    }

    /* Hero */
    .hero {
      height: 100vh;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      padding: 2rem;
      pointer-events: none;
    }
    .hero h1 {
      font-family: 'Playfair Display', serif;
      font-size: clamp(3rem, 12vw, 8rem);
      font-weight: 900;
      line-height: 1;
      background: linear-gradient(135deg, #ff9ec7 0%, #c084fc 40%, #60a5fa 80%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      filter: drop-shadow(0 0 40px rgba(192,132,252,0.5));
      letter-spacing: -2px;
      animation: floatTitle 6s ease-in-out infinite;
    }
    @keyframes floatTitle {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-15px); }
    }
    .hero p {
      font-size: clamp(1rem, 2.5vw, 1.4rem);
      margin-top: 1.5rem;
      max-width: 600px;
      opacity: 0.85;
      font-weight: 300;
      letter-spacing: 3px;
      text-transform: uppercase;
    }
    .scroll-hint {
      position: absolute;
      bottom: 40px;
      left: 50%;
      transform: translateX(-50%);
      font-size: 0.75rem;
      letter-spacing: 4px;
      opacity: 0.5;
      text-transform: uppercase;
      animation: bounce 2s infinite;
    }
    @keyframes bounce {
      0%, 100% { transform: translateX(-50%) translateY(0); }
      50% { transform: translateX(-50%) translateY(10px); }
    }

    /* Story sections */
    .section {
      min-height: 100vh;
      padding: 8rem 2rem;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .story-card {
      max-width: 780px;
      padding: 3.5rem 3rem;
      background: rgba(15, 8, 35, 0.65);
      backdrop-filter: blur(20px);
      -webkit-backdrop-filter: blur(20px);
      border: 1px solid rgba(192, 132, 252, 0.25);
      border-radius: 28px;
      box-shadow: 0 30px 80px rgba(0,0,0,0.6), inset 0 1px 0 rgba(255,255,255,0.08);
      position: relative;
      overflow: hidden;
    }
    .story-card::before {
      content: '';
      position: absolute;
      top: -2px; left: -2px; right: -2px; bottom: -2px;
      background: linear-gradient(135deg, rgba(255,107,157,0.3), transparent 40%, transparent 60%, rgba(96,165,250,0.3));
      border-radius: 28px;
      z-index: -1;
      opacity: 0.6;
    }
    .chapter {
      display: inline-block;
      font-size: 0.8rem;
      letter-spacing: 6px;
      text-transform: uppercase;
      color: #ff9ec7;
      margin-bottom: 1.5rem;
      padding: 0.4rem 1.2rem;
      border: 1px solid rgba(255,158,199,0.4);
      border-radius: 40px;
      background: rgba(255,158,199,0.08);
    }
    .story-card h2 {
      font-family: 'Playfair Display', serif;
      font-size: clamp(2rem, 5vw, 3.2rem);
      font-weight: 700;
      line-height: 1.15;
      margin-bottom: 1.5rem;
      background: linear-gradient(135deg, #fff 0%, #c084fc 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }
    .story-card p {
      font-size: 1.05rem;
      line-height: 1.9;
      opacity: 0.85;
      font-weight: 300;
      margin-bottom: 1.2rem;
      color: #e0d5f5;
    }
    .story-card p:last-child { margin-bottom: 0; }

    /* Feature grid */
    .features {
      padding: 6rem 2rem 10rem;
      max-width: 1200px;
      margin: 0 auto;
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 2rem;
    }
    .feature {
      padding: 2.5rem 2rem;
      background: rgba(20, 12, 45, 0.5);
      backdrop-filter: blur(15px);
      -webkit-backdrop-filter: blur(15px);
      border: 1px solid rgba(192, 132, 252, 0.2);
      border-radius: 20px;
      transition: transform 0.4s ease, border-color 0.4s ease, box-shadow 0.4s ease;
    }
    .feature:hover {
      transform: translateY(-8px);
      border-color: rgba(255,107,157,0.5);
      box-shadow: 0 20px 50px rgba(192,132,252,0.25);
    }
    .feature .icon {
      font-size: 2.5rem;
      margin-bottom: 1rem;
      display: block;
    }
    .feature h3 {
      font-family: 'Playfair Display', serif;
      font-size: 1.4rem;
      margin-bottom: 0.8rem;
      color: #ff9ec7;
    }
    .feature p {
      font-size: 0.95rem;
      line-height: 1.7;
      opacity: 0.75;
      font-weight: 300;
    }

    /* Footer */
    footer {
      text-align: center;
      padding: 4rem 2rem 6rem;
      position: relative;
      z-index: 2;
    }
    footer .sigil {
      font-size: 2rem;
      margin-bottom: 1rem;
      background: linear-gradient(135deg, #ff9ec7, #c084fc, #60a5fa);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }
    footer p {
      font-size: 0.85rem;
      letter-spacing: 3px;
      text-transform: uppercase;
      opacity: 0.4;
      font-weight: 300;
    }

    /* Loading screen */
    #loader {
      position: fixed;
      inset: 0;
      background: #05030f;
      z-index: 100;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
      transition: opacity 1s ease;
    }
    #loader.hidden {
      opacity: 0;
      pointer-events: none;
    }
    .loader-ring {
      width: 60px;
      height: 60px;
      border: 2px solid rgba(192,132,252,0.2);
      border-top-color: #ff9ec7;
      border-radius: 50%;
      animation: spin 1s linear infinite;
    }
    @keyframes spin { to { transform: rotate(360deg); } }
    #loader p {
      margin-top: 1.5rem;
      font-size: 0.75rem;
      letter-spacing: 5px;
      text-transform: uppercase;
      opacity: 0.5;
    }

    @media (max-width: 600px) {
      .story-card { padding: 2.5rem 1.8rem; }
      .section { padding: 5rem 1.2rem; }
    }
  </style>
</head>
<body>

  <div id="loader">
    <div class="loader-ring"></div>
    <p>Entering the realm</p>
  </div>

  <div id="canvas-container"></div>

  <div class="content">

    <!-- HERO -->
    <section class="hero">
      <h1>Anime Realms</h1>
      <p>A journey through light, color & imagination</p>
      <div class="scroll-hint">Scroll ↓</div>
    </section>

    <!-- CHAPTER 1 -->
    <section class="section">
      <div class="story-card">
        <span class="chapter">Chapter I</span>
        <h2>The Awakening Sky</h2>
        <p>In the hush before dawn, the heavens bloomed with colors no artist could name. Petals of light drifted across an endless canvas, each one carrying a whisper of a story waiting to be told.</p>
        <p>This is where every journey begins — not with a step, but with a breath. With the quiet certainty that something magical is about to unfold.</p>
      </div>
    </section>

    <!-- CHAPTER 2 -->
    <section class="section">
      <div class="story-card">
        <span class="chapter">Chapter II</span>
        <h2>The Crystal of Memory</h2>
        <p>Deep within the floating sanctuary, a crystal hums with the collected memories of a thousand lifetimes. Its facets refract not just light, but emotion — joy, sorrow, hope, and the ache of things long past.</p>
        <p>Those who dare to look into its heart see not the future, but the truth they've always carried within themselves.</p>
      </div>
    </section>

    <!-- CHAPTER 3 -->
    <section class="section">
      <div class="story-card">
        <span class="chapter">Chapter III</span>
        <h2>The Silent Constellation</h2>
        <p>Beyond the veil of waking dreams, stars drift like fireflies in an infinite garden. They do not burn — they bloom. Each one a soul, a wish, a promise made under a sky that never forgets.</p>
        <p>To walk among them is to understand that distance is only an illusion, and that every ending is simply a new beginning in disguise.</p>
      </div>
    </section>

    <!-- FEATURES -->
    <div class="features">
      <div class="feature">
        <span class="icon">🌸</span>
        <h3>Ethereal Design</h3>
        <p>Soft gradients, glowing edges and dreamlike textures inspired by the finest anime aesthetics.</p>
      </div>
      <div class="feature">
        <span class="icon">✨</span>
        <h3>Living Light</h3>
        <p>Every particle, ring and crystal is animated with subtle motion — the world breathes around you.</p>
      </div>
      <div class="feature">
        <span class="icon">🌌</span>
        <h3>Infinite Depth</h3>
        <p>A fixed 3D backdrop that evolves as you scroll, creating a continuous sense of wonder.</p>
      </div>
      <div class="feature">
        <span class="icon">💫</span>
        <h3>Story-Driven</h3>
        <p>Each chapter unfolds like a page from a light novel, blending narrative with visual poetry.</p>
      </div>
    </div>

    <footer>
      <div class="sigil">⛩</div>
      <p>Anime Realms — Crafted with light & code</p>
    </footer>

  </div>

  <script type="importmap">
  {
    "imports": {
      "three": "https://unpkg.com/three@0.160.0/build/three.module.js",
      "three/addons/": "https://unpkg.com/three@0.160.0/examples/jsm/"
    }
  }
  </script>

  <script type="module">
    import * as THREE from 'three';
    import { EffectComposer } from 'three/addons/postprocessing/EffectComposer.js';
    import { RenderPass } from 'three/addons/postprocessing/RenderPass.js';
    import { UnrealBloomPass } from 'three/addons/postprocessing/UnrealBloomPass.js';

    // ============ SCENE SETUP ============
    const container = document.getElementById('canvas-container');
    const scene = new THREE.Scene();
    scene.fog = new THREE.FogExp2(0x05030f, 0.012);

    const camera = new THREE.PerspectiveCamera(
      55,
      window.innerWidth / window.innerHeight,
      0.1,
      300
    );
    camera.position.set(0, 2, 18);

    const renderer = new THREE.WebGLRenderer({
      antialias: true,
      alpha: true,
      powerPreference: 'high-performance'
    });
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
    renderer.toneMapping = THREE.ACESFilmicToneMapping;
    renderer.toneMappingExposure = 1.1;
    container.appendChild(renderer.domElement);

    // ============ POST PROCESSING ============
    const composer = new EffectComposer(renderer);
    composer.addPass(new RenderPass(scene, camera));

    const bloom = new UnrealBloomPass(
      new THREE.Vector2(window.innerWidth, window.innerHeight),
      0.9,   // strength
      0.6,   // radius
      0.15   // threshold
    );
    composer.addPass(bloom);

    // ============ LIGHTING ============
    scene.add(new THREE.AmbientLight(0x554477, 1.2));

    const keyLight = new THREE.PointLight(0xffb3d9, 2.5, 60);
    keyLight.position.set(8, 12, 10);
    scene.add(keyLight);

    const fillLight = new THREE.PointLight(0x6d9eff, 2, 60);
    fillLight.position.set(-10, 6, 8);
    scene.add(fillLight);

    const rimLight = new THREE.PointLight(0xc084fc, 1.8, 60);
    rimLight.position.set(0, -4, -12);
    scene.add(rimLight);

    const accent1 = new THREE.PointLight(0xff6b9d, 1.5, 40);
    accent1.position.set(6, 0, 6);
    scene.add(accent1);

    const accent2 = new THREE.PointLight(0x60a5fa, 1.5, 40);
    accent2.position.set(-6, 3, 6);
    scene.add(accent2);

    // ============ CENTRAL CRYSTAL ============
    const crystalGroup = new THREE.Group();
    crystalGroup.position.set(0, 1, 0);

    const crystalGeo = new THREE.IcosahedronGeometry(1.6, 1);
    const crystalMat = new THREE.MeshPhysicalMaterial({
      color: 0xc084fc,
      emissive: 0x8b5cf6,
      emissiveIntensity: 0.4,
      roughness: 0.15,
      metalness: 0.3,
      transmission: 0.6,
      thickness: 1.5,
      clearcoat: 1,
      clearcoatRoughness: 0.1,
      transparent: true,
      opacity: 0.95
    });
    const crystal = new THREE.Mesh(crystalGeo, crystalMat);
    crystalGroup.add(crystal);

    // Inner glowing core
    const coreGeo = new THREE.IcosahedronGeometry(0.9, 2);
    const coreMat = new THREE.MeshBasicMaterial({
      color: 0xff9ec7,
      transparent: true,
      opacity: 0.55
    });
    const core = new THREE.Mesh(coreGeo, coreMat);
    crystalGroup.add(core);

    // Wireframe shell
    const wireGeo = new THREE.IcosahedronGeometry(1.7, 1);
    const wireMat = new THREE.MeshBasicMaterial({
      color: 0xff9ec7,
      wireframe: true,
      transparent: true,
      opacity: 0.15
    });
    const wireShell = new THREE.Mesh(wireGeo, wireMat);
    crystalGroup.add(wireShell);

    scene.add(crystalGroup);

    // ============ ORBITING RINGS ============
    function makeRing(radius, tube, color, emissive, tilt) {
      const geo = new THREE.TorusGeometry(radius, tube, 24, 128);
      const mat = new THREE.MeshStandardMaterial({
        color,
        emissive,
        emissiveIntensity: 1.2,
        roughness: 0.3,
        metalness: 0.5,
        transparent: true,
        opacity: 0.8
      });
      const ring = new THREE.Mesh(geo, mat);
      ring.rotation.x = tilt.x;
      ring.rotation.y = tilt.y;
      ring.rotation.z = tilt.z;
      return ring;
    }

    const ringA = makeRing(2.8, 0.05, 0x60a5fa, 0x3b82f6, { x: Math.PI / 2.4, y: 0.2, z: 0.1 });
    const ringB = makeRing(3.4, 0.04, 0xff6b9d, 0xec4899, { x: Math.PI / 1.9, y: 0.7, z: 0.3 });
    const ringC = makeRing(2.2, 0.03, 0xa78bfa, 0x8b5cf6, { x: Math.PI / 3.1, y: 1.4, z: 0.5 });
    scene.add(ringA, ringB, ringC);

    // ============ STAR FIELD ============
    function createStars(count, radiusMin, radiusMax, size, color) {
      const positions = new Float32Array(count * 3);
      const colors = new Float32Array(count * 3);
      const baseColor = new THREE.Color(color);
      for (let i = 0; i < count; i++) {
        const r = radiusMin + Math.random() * (radiusMax - radiusMin);
        const theta = Math.random() * Math.PI * 2;
        const phi = Math.acos(2 * Math.random() - 1);
        positions[i * 3] = r * Math.sin(phi) * Math.cos(theta);
        positions[i * 3 + 1] = r * Math.sin(phi) * Math.sin(theta);
        positions[i * 3 + 2] = r * Math.cos(phi);

        const c = baseColor.clone();
        c.offsetHSL((Math.random() - 0.5) * 0.15, 0, (Math.random() - 0.5) * 0.3);
        colors[i * 3] = c.r;
        colors[i * 3 + 1] = c.g;
        colors[i * 3 + 2] = c.b;
      }
      const geo = new THREE.BufferGeometry();
      geo.setAttribute('position', new THREE.BufferAttribute(positions, 3));
      geo.setAttribute('color', new THREE.BufferAttribute(colors, 3));
      const mat = new THREE.PointsMaterial({
        size,
        vertexColors: true,
        transparent: true,
        opacity: 0.9,
        blending: THREE.AdditiveBlending,
        depthWrite: false,
        sizeAttenuation: true
      });
      return new THREE.Points(geo, mat);
    }

    const nearStars = createStars(600, 15, 35, 0.12, 0xff9ec7);
    const farStars = createStars(1500, 40, 120, 0.35, 0xc084fc);
    const distantStars = createStars(2000, 100, 200, 0.6, 0x60a5fa);
    scene.add(nearStars, farStars, distantStars);

    // ============ FLOATING SPARKLES ============
    const sparklesGroup = new THREE.Group();
    const sparkleCount = 250;
    const sparkleGeo = new THREE.SphereGeometry(0.05, 6, 6);
    const sparkleColors = [0xff9ec7, 0xc084fc, 0x60a5fa, 0xffd1e8, 0xa78bfa];

    for (let i = 0; i < sparkleCount; i++) {
      const mat = new THREE.MeshBasicMaterial({
        color: sparkleColors[Math.floor(Math.random() * sparkleColors.length)],
        transparent: true,
        opacity: 0.7 + Math.random() * 0.3
      });
      const spark = new THREE.Mesh(sparkleGeo, mat);
      const r = 4 + Math.random() * 14;
      const theta = Math.random() * Math.PI * 2;
      const phi = Math.acos(2 * Math.random() - 1);
      spark.position.set(
        r * Math.sin(phi) * Math.cos(theta),
        r * Math.sin(phi) * Math.sin(theta) * 0.6 + 1,
        r * Math.cos(phi)
      );
      spark.userData = {
        phase: Math.random() * Math.PI * 2,
        speed: 0.5 + Math.random() * 1.5,
        baseY: spark.position.y,
        basePos: spark.position.clone()
      };
      sparklesGroup.add(spark);
    }
    scene.add(sparklesGroup);

    // ============ FLOATING PETALS ============
    const petalsGroup = new THREE.Group();
    const petalGeo = new THREE.CircleGeometry(0.18, 5);
    const petalColors = [0xff9ec7, 0xffb3d9, 0xc084fc, 0xffd1e8];

    for (let i = 0; i < 60; i++) {
      const mat = new THREE.MeshStandardMaterial({
        color: petalColors[Math.floor(Math.random() * petalColors.length)],
        emissive: 0xff6b9d,
        emissiveIntensity: 0.3,
        roughness: 0.6,
        side: THREE.DoubleSide,
        transparent: true,
        opacity: 0.85
      });
      const petal = new THREE.Mesh(petalGeo, mat);
      const r = 5 + Math.random() * 10;
      const theta = Math.random() * Math.PI * 2;
      petal.position.set(
        Math.cos(theta) * r,
        Math.random() * 12 - 2,
        Math.sin(theta) * r
      );
      petal.rotation.set(
        Math.random() * Math.PI,
        Math.random() * Math.PI,
        Math.random() * Math.PI
      );
      petal.userData = {
        rotSpeed: new THREE.Vector3(
          (Math.random() - 0.5) * 0.01,
          (Math.random() - 0.5) * 0.01,
          (Math.random() - 0.5) * 0.01
        ),
        floatPhase: Math.random() * Math.PI * 2,
        floatSpeed: 0.3 + Math.random() * 0.7,
        baseY: petal.position.y
      };
      petalsGroup.add(petal);
    }
    scene.add(petalsGroup);

    // ============ DISTANT TORUS KNOTS ============
    function makeKnot(x, y, z, color, emissive, scale) {
      const geo = new THREE.TorusKnotGeometry(1, 0.25, 80, 12, 2, 3);
      const mat = new THREE.MeshStandardMaterial({
        color,
        emissive,
        emissiveIntensity: 0.6,
        roughness: 0.3,
        metalness: 0.5,
        transparent: true,
        opacity: 0.4,
        wireframe: true
      });
      const knot = new THREE.Mesh(geo, mat);
      knot.position.set(x, y, z);
      knot.scale.setScalar(scale);
      return knot;
    }

    const knot1 = makeKnot(-11, 3, -8, 0xff6b9d, 0xec4899, 1.2);
    const knot2 = makeKnot(12, -1, -10, 0x60a5fa, 0x3b82f6, 1.5);
    const knot3 = makeKnot(-8, -3, -6, 0xc084fc, 0x8b5cf6, 0.9);
    scene.add(knot1, knot2, knot3);

    // ============ LARGE BACKGROUND ORBS ============
    for (let i = 0; i < 6; i++) {
      const geo = new THREE.SphereGeometry(0.6 + Math.random() * 1.2, 16, 16);
      const mat = new THREE.MeshBasicMaterial({
        color: [0xff9ec7, 0xc084fc, 0x60a5fa][i % 3],
        transparent: true,
        opacity: 0.15,
        blending: THREE.AdditiveBlending
      });
      const orb = new THREE.Mesh(geo, mat);
      const r = 15 + Math.random() * 10;
      const theta = Math.random() * Math.PI * 2;
      orb.position.set(
        Math.cos(theta) * r,
        (Math.random() - 0.5) * 15,
        Math.sin(theta) * r
      );
      orb.userData = { floatPhase: Math.random() * Math.PI * 2 };
      scene.add(orb);
    }

    // ============ SCROLL INTERACTION ============
    let scrollY = 0;
    let targetScrollY = 0;
    window.addEventListener('scroll', () => {
      targetScrollY = window.scrollY;
    });

    // ============ ANIMATION ============
    const clock = new THREE.Clock();

    function animate() {
      const t = clock.getElapsedTime();
      const dt = clock.getDelta();

      // Smooth scroll
      scrollY += (targetScrollY - scrollY) * 0.08;
      const scrollProgress = Math.min(scrollY / (document.body.scrollHeight - window.innerHeight), 1);

      // Crystal animation
      crystal.rotation.y += 0.004;
      crystal.rotation.x = Math.sin(t * 0.3) * 0.15;
      core.rotation.y -= 0.006;
      core.rotation.x += 0.003;
      wireShell.rotation.y -= 0.002;
      wireShell.rotation.z += 0.001;

      // Pulse core scale
      const pulse = 1 + Math.sin(t * 2) * 0.08;
      core.scale.setScalar(pulse);

      // Rings rotation
      ringA.rotation.z += 0.003;
      ringB.rotation.z -= 0.002;
      ringC.rotation.z += 0.004;
      ringA.rotation.y += 0.001;
      ringB.rotation.x += 0.0015;

      // Crystal group gentle float
      crystalGroup.position.y = 1 + Math.sin(t * 0.8) * 0.25;
      crystalGroup.rotation.y = t * 0.1;

      // Stars rotation
      nearStars.rotation.y += 0.0004;
      farStars.rotation.y -= 0.0002;
      distantStars.rotation.y += 0.0001;

      // Sparkles float
      sparklesGroup.children.forEach((spark) => {
        const d = spark.userData;
        spark.position.y = d.baseY + Math.sin(t * d.speed + d.phase) * 0.6;
        spark.scale.setScalar(0.7 + Math.sin(t * 2 + d.phase) * 0.4);
      });
      sparklesGroup.rotation.y += 0.0008;

      // Petals drift
      petalsGroup.children.forEach((petal) => {
        const d = petal.userData;
        petal.rotation.x += d.rotSpeed.x;
        petal.rotation.y += d.rotSpeed.y;
        petal.rotation.z += d.rotSpeed.z;
        petal.position.y = d.baseY + Math.sin(t * d.floatSpeed + d.floatPhase) * 0.8;
      });
      petalsGroup.rotation.y += 0.0006;

      // Knots rotation
      knot1.rotation.x += 0.005;
      knot1.rotation.y += 0.008;
      knot2.rotation.x -= 0.004;
      knot2.rotation.y += 0.006;
      knot3.rotation.x += 0.003;
      knot3.rotation.y -= 0.005;

      // Camera movement based on scroll
      camera.position.z = 18 - scrollProgress * 4;
      camera.position.y = 2 + scrollProgress * 3;
      camera.lookAt(0, 1 + scrollProgress * 1.5, 0);

      // Slight camera drift
      camera.position.x = Math.sin(t * 0.15) * 1.5;

      composer.render();
      requestAnimationFrame(animate);
    }

    animate();

    // ============ RESIZE ============
    window.addEventListener('resize', () => {
      camera.aspect = window.innerWidth / window.innerHeight;
      camera.updateProjectionMatrix();
      renderer.setSize(window.innerWidth, window.innerHeight);
      composer.setSize(window.innerWidth, window.innerHeight);
    });

    // ============ HIDE LOADER ============
    setTimeout(() => {
      document.getElementById('loader').classList.add('hidden');
    }, 1200);
  </script>

</body>
</html>
