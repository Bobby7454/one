<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
  <meta name="description" content="An immersive 3D anime experience built with Three.js — ethereal, stunning, and interactive.">
  <meta name="theme-color" content="#0a0a1a">
  <meta property="og:title" content="Anime Dreams · 3D Stunning World">
  <meta property="og:description" content="An immersive 3D anime experience with a glowing crystal, floating rings, and ethereal sparkles.">
  <meta property="og:type" content="website">
  <title>Anime Dreams · 3D Stunning World</title>

  <!-- Inline SVG favicon (no 404) -->
  <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>✨</text></svg>">

  <!-- Preconnect to font host -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600;700&display=swap" rel="stylesheet">

  <style>
    /* ============================================================
       RESET & BASE
       ============================================================ */
    *, *::before, *::after {
      box-sizing: border-box;
    }

    html, body {
      margin: 0;
      padding: 0;
    }

    body {
      overflow: hidden;
      font-family: 'Quicksand', system-ui, -apple-system, sans-serif;
      color: #ffffff;
      background-color: #0a0a1a;
    }

    canvas {
      display: block;
    }

    /* ============================================================
       INFO OVERLAY
       ============================================================ */
    #info {
      position: absolute;
      bottom: 30px;
      left: 0;
      width: 100%;
      text-align: center;
      pointer-events: none;
      z-index: 10;
      text-shadow: 0 0 30px rgba(0, 0, 0, 0.9);
      letter-spacing: 2px;
    }

    #info h1 {
      font-size: clamp(2.5rem, 10vw, 6rem);
      font-weight: 700;
      margin: 0;
      background: linear-gradient(45deg, #ff6b9d, #c084fc, #60a5fa);
      -webkit-background-clip: text;
      background-clip: text;
      -webkit-text-fill-color: transparent;
      color: transparent;
      animation: glowPulse 3s ease-in-out infinite alternate;
      filter: drop-shadow(0 0 20px rgba(192, 132, 252, 0.4));
    }

    #info p {
      font-size: clamp(1rem, 3vw, 1.6rem);
      margin: 0.8rem 0 0;
      opacity: 0.95;
      font-weight: 400;
      background: rgba(10, 5, 20, 0.5);
      display: inline-block;
      padding: 0.4rem 2rem;
      border-radius: 60px;
      backdrop-filter: blur(8px);
      border: 1px solid rgba(255, 255, 255, 0.2);
      color: #e0d0ff;
    }

    @keyframes glowPulse {
      0%   { filter: drop-shadow(0 0 5px rgba(255, 107, 157, 0.3)); }
      100% { filter: drop-shadow(0 0 35px rgba(192, 132, 252, 0.7)); }
    }

    /* ============================================================
       CREDIT
       ============================================================ */
    #credit {
      position: absolute;
      bottom: 12px;
      right: 20px;
      font-size: 0.8rem;
      opacity: 0.55;
      z-index: 10;
      pointer-events: none;
      letter-spacing: 1.5px;
      background: rgba(0, 0, 0, 0.4);
      padding: 6px 16px;
      border-radius: 30px;
      backdrop-filter: blur(6px);
      border: 1px solid rgba(255, 255, 255, 0.1);
      color: #d0c0ff;
    }

    /* ============================================================
       LOADING OVERLAY
       ============================================================ */
    #loading {
      position: fixed;
      inset: 0;
      background: #0a0a1a;
      display: flex;
      align-items: center;
      justify-content: center;
      z-index: 999;
      color: #e0b0ff;
      font-size: 1.6rem;
      font-weight: 600;
      letter-spacing: 3px;
      transition: opacity 1.8s ease;
      pointer-events: none;
      text-shadow: 0 0 30px #c084fc;
    }

    #loading.hidden {
      opacity: 0;
    }

    /* ============================================================
       NOSCRIPT FALLBACK
       ============================================================ */
    .noscript-message {
      color: #ffffff;
      text-align: center;
      padding: 2rem;
      font-size: 1.2rem;
    }

    /* ============================================================
       REDUCED MOTION
       ============================================================ */
    @media (prefers-reduced-motion: reduce) {
      #info h1 {
        animation: none;
      }
    }

    @media (max-width: 600px) {
      #info {
        bottom: 20px;
      }
      #credit {
        display: none;
      }
    }
  </style>
</head>
<body>
  <noscript>
    <p class="noscript-message">
      ✨ Please enable JavaScript to view this 3D anime experience.
    </p>
  </noscript>

  <div id="loading" aria-live="polite">✦ loading anime universe ✦</div>

  <header id="info" role="banner" aria-label="Anime Dreams 3D scene">
    <h1>✨ Anime Dreams ✨</h1>
    <p aria-hidden="true">3D · Ethereal · Stunning</p>
  </header>

  <div id="credit" aria-hidden="true">🌸 anime vibe · three.js</div>

  <script type="importmap">
    {
      "imports": {
        "three": "https://unpkg.com/three@0.128.0/build/three.module.js",
        "three/addons/": "https://unpkg.com/three@0.128.0/examples/jsm/"
      }
    }
  </script>

  <script type="module">
    import * as THREE from 'three';
    import { OrbitControls } from 'three/addons/controls/OrbitControls.js';
    import { EffectComposer } from 'three/addons/postprocessing/EffectComposer.js';
    import { RenderPass } from 'three/addons/postprocessing/RenderPass.js';
    import { UnrealBloomPass } from 'three/addons/postprocessing/UnrealBloomPass.js';
    import { ShaderPass } from 'three/addons/postprocessing/ShaderPass.js';
    import { FXAAShader } from 'three/addons/shaders/FXAAShader.js';

    // ============================================================
    // CONFIGURATION CONSTANTS (no magic numbers)
    // ============================================================
    const CONFIG = Object.freeze({
      BG_COLOR: 0x0a0a1a,
      FOG_DENSITY: 0.012,
      CAMERA_FOV: 45,
      CAMERA_NEAR: 0.1,
      CAMERA_FAR: 1000,
      CAMERA_POS: { x: 9, y: 5, z: 16 },
      TONE_EXPOSURE: 1.3,
      BLOOM_STRENGTH: 0.7,
      BLOOM_RADIUS: 0.5,
      BLOOM_THRESHOLD: 0.15,
      AUTO_ROTATE_SPEED: 1.0,
      DAMPING_FACTOR: 0.05,
      MAX_PIXEL_RATIO: 2,
      SPARKLE_COUNT: 500,
      PETAL_COUNT: 100,
      STAR_COUNT: 3000,
      ORB_COUNT: 16,
      LOADING_DURATION_MS: 800,
      GEM_ROTATION: { x: 0.0025, y: 0.006, z: 0.0015 },
      RING_ROTATION: { r1: 0.005, r2: -0.0045, r3: 0.0065 },
      KNOT_ROTATION: { k1x: 0.01, k1y: 0.015, k2x: -0.008, k2y: 0.012 },
      STAR_ROTATION: 0.00008,
      HUE_RANGE: { MIN: 0.6, SPAN: 0.4 }
    });

    // ============================================================
    // WEBGL CAPABILITY CHECK
    // ============================================================
    function isWebGLAvailable() {
      try {
        const canvas = document.createElement('canvas');
        return !!(
          window.WebGLRenderingContext &&
          (canvas.getContext('webgl') || canvas.getContext('experimental-webgl'))
        );
      } catch (err) {
        return false;
      }
    }

    const loadingEl = document.getElementById('loading');

    if (!isWebGLAvailable()) {
      loadingEl.textContent = '⚠️ WebGL is not supported in your browser.';
      throw new Error('WebGL not available');
    }

    // ============================================================
    // REDUCED MOTION
    // ============================================================
    const prefersReducedMotion = window.matchMedia(
      '(prefers-reduced-motion: reduce)'
    ).matches;

    // ============================================================
    // SCENE / CAMERA / RENDERER
    // ============================================================
    const scene = new THREE.Scene();
    scene.background = new THREE.Color(CONFIG.BG_COLOR);
    scene.fog = new THREE.FogExp2(CONFIG.BG_COLOR, CONFIG.FOG_DENSITY);

    const camera = new THREE.PerspectiveCamera(
      CONFIG.CAMERA_FOV,
      window.innerWidth / window.innerHeight,
      CONFIG.CAMERA_NEAR,
      CONFIG.CAMERA_FAR
    );
    camera.position.set(
      CONFIG.CAMERA_POS.x,
      CONFIG.CAMERA_POS.y,
      CONFIG.CAMERA_POS.z
    );
    camera.lookAt(0, 1, 0);

    const renderer = new THREE.WebGLRenderer({
      antialias: true,
      powerPreference: 'high-performance'
    });
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, CONFIG.MAX_PIXEL_RATIO));
    renderer.toneMapping = THREE.ReinhardToneMapping;
    renderer.toneMappingExposure = CONFIG.TONE_EXPOSURE;
    document.body.appendChild(renderer.domElement);

    // ============================================================
    // POST PROCESSING
    // ============================================================
    const composer = new EffectComposer(renderer);
    composer.addPass(new RenderPass(scene, camera));

    const bloomPass = new UnrealBloomPass(
      new THREE.Vector2(window.innerWidth, window.innerHeight),
      CONFIG.BLOOM_STRENGTH,
      CONFIG.BLOOM_RADIUS,
      CONFIG.BLOOM_THRESHOLD
    );
    composer.addPass(bloomPass);

    const effectFXAA = new ShaderPass(FXAAShader);
    effectFXAA.uniforms.resolution.value.set(
      1 / window.innerWidth,
      1 / window.innerHeight
    );
    composer.addPass(effectFXAA);

    // ============================================================
    // CONTROLS
    // ============================================================
    const controls = new OrbitControls(camera, renderer.domElement);
    controls.enableDamping = true;
    controls.dampingFactor = CONFIG.DAMPING_FACTOR;
    controls.autoRotate = !prefersReducedMotion;
    controls.autoRotateSpeed = CONFIG.AUTO_ROTATE_SPEED;
    controls.enableZoom = true;
    controls.enablePan = false;
    controls.target.set(0, 1.2, 0);
    controls.maxPolarAngle = Math.PI / 2;
    controls.minDistance = 6;
    controls.maxDistance = 28;
    controls.update();

    // ============================================================
    // LIGHTING
    // ============================================================
    scene.add(new THREE.AmbientLight(0x404066, 0.7));

    const mainLight = new THREE.PointLight(0xffaa88, 1.8, 40);
    mainLight.position.set(6, 10, 8);
    scene.add(mainLight);

    const fillLight = new THREE.PointLight(0x4466ff, 1.4, 35);
    fillLight.position.set(-7, 4, 6);
    scene.add(fillLight);

    const rimLight = new THREE.DirectionalLight(0xff88cc, 1.0);
    rimLight.position.set(-3, 2, -10);
    scene.add(rimLight);

    const backLight = new THREE.PointLight(0xaa88ff, 1.0, 30);
    backLight.position.set(0, 3, -12);
    scene.add(backLight);

    const colorLight1 = new THREE.PointLight(0xff4d6d, 0.9, 25);
    colorLight1.position.set(5, -1, 8);
    scene.add(colorLight1);

    const colorLight2 = new THREE.PointLight(0x4cc9f0, 0.9, 25);
    colorLight2.position.set(-6, 3, 8);
    scene.add(colorLight2);

    // ============================================================
    // CENTRAL GEM
    // ============================================================
    const gem = new THREE.Mesh(
      new THREE.IcosahedronGeometry(1.6, 1),
      new THREE.MeshStandardMaterial({
        color: 0xc084fc,
        emissive: 0x7c3aed,
        emissiveIntensity: 0.4,
        roughness: 0.15,
        metalness: 0.1,
        transparent: true,
        opacity: 0.92
      })
    );
    gem.position.set(0, 1.4, 0);
    scene.add(gem);

    const glowSphere = new THREE.Mesh(
      new THREE.SphereGeometry(0.9, 32, 32),
      new THREE.MeshBasicMaterial({
        color: 0xff6b9d,
        transparent: true,
        opacity: 0.3
      })
    );
    glowSphere.position.set(0, 1.4, 0);
    scene.add(glowSphere);

    // ============================================================
    // FLOATING RINGS
    // ============================================================
    function makeRing(radius, tube, color, emissive, rotation) {
      const ring = new THREE.Mesh(
        new THREE.TorusGeometry(radius, tube, 32, 80),
        new THREE.MeshStandardMaterial({
          color,
          emissive,
          emissiveIntensity: 0.3,
          roughness: 0.25,
          metalness: 0.7,
          transparent: true,
          opacity: 0.8,
          side: THREE.DoubleSide
        })
      );
      ring.position.set(0, 1.4, 0);
      ring.rotation.set(rotation.x, rotation.y, rotation.z);
      return ring;
    }

    const ring1 = makeRing(2.3, 0.07, 0x60a5fa, 0x3b82f6, { x: Math.PI / 2.5, y: 0, z: 0.3 });
    const ring2 = makeRing(2.7, 0.05, 0xf472b6, 0xec4899, { x: Math.PI / 1.8, y: 0.8, z: 0 });
    const ring3 = makeRing(1.9, 0.04, 0xa78bfa, 0x8b5cf6, { x: Math.PI / 3, y: 0, z: 1.2 });
    scene.add(ring1, ring2, ring3);

    // ============================================================
    // SPARKLES
    // ============================================================
    const sparkleGroup = new THREE.Group();
    const sparkleGeo = new THREE.SphereGeometry(0.07, 6, 6);

    for (let i = 0; i < CONFIG.SPARKLE_COUNT; i++) {
      const hue = CONFIG.HUE_RANGE.MIN + Math.random() * CONFIG.HUE_RANGE.SPAN;
      const mat = new THREE.MeshStandardMaterial({
        color: new THREE.Color().setHSL(hue, 0.9, 0.65),
        emissive: new THREE.Color().setHSL(hue, 0.8, 0.5),
        emissiveIntensity: 1.4
      });
      const spark = new THREE.Mesh(sparkleGeo, mat);

      const radius = 3.2 + Math.random() * 5.5;
      const theta = Math.random() * Math.PI * 2;
      const phi = Math.acos((Math.random() * 2) - 1);
      spark.position.set(
        radius * Math.sin(phi) * Math.cos(theta),
        radius * Math.sin(phi) * Math.sin(theta) + 1.2,
        radius * Math.cos(phi)
      );
      spark.userData.pulseSpeed = 0.5 + Math.random() * 2;
      spark.userData.phase = Math.random() * 100;
      spark.userData.baseScale = 0.6 + Math.random() * 1.2;
      sparkleGroup.add(spark);
    }
    scene.add(sparkleGroup);

    // ============================================================
    // TORUS KNOTS
    // ============================================================
    const knotMat = new THREE.MeshStandardMaterial({
      color: 0xf472b6,
      emissive: 0xec4899,
      emissiveIntensity: 0.3,
      roughness: 0.3,
      metalness: 0.1,
      transparent: true,
      opacity: 0.5
    });

    const knot1 = new THREE.Mesh(
      new THREE.TorusKnotGeometry(1.3, 0.3, 64, 8, 2, 3),
      knotMat
    );
    knot1.position.set(-3.2, 1.2, -1.8);
    scene.add(knot1);

    const knot2 = new THREE.Mesh(
      new THREE.TorusKnotGeometry(1.0, 0.22, 64, 8, 3, 4),
      knotMat.clone()
    );
    knot2.material.color.setHex(0x60a5fa);
    knot2.material.emissive.setHex(0x3b82f6);
    knot2.position.set(3.4, 2.0, -1.5);
    scene.add(knot2);

    // ============================================================
    // PETALS
    // ============================================================
    const petalGroup = new THREE.Group();
    const petalMat = new THREE.MeshStandardMaterial({
      color: 0xff8cae,
      emissive: 0xff4d6d,
      emissiveIntensity: 0.15,
      roughness: 0.6,
      metalness: 0.1,
      side: THREE.DoubleSide
    });

    for (let i = 0; i < CONFIG.PETAL_COUNT; i++) {
      const hue = 0.85 + Math.random() * 0.25;
      const mat = petalMat.clone();
      mat.color.setHSL(hue, 0.85, 0.65);
      mat.emissive.setHSL(hue, 0.75, 0.35);

      const petal = new THREE.Mesh(
        new THREE.CircleGeometry(0.15 + Math.random() * 0.25, 5),
        mat
      );

      const angle = Math.random() * Math.PI * 2;
      const radius = 2.5 + Math.random() * 6;
      petal.position.set(
        Math.cos(angle) * radius,
        Math.random() * 4 + 0.3,
        Math.sin(angle) * radius
      );
      petal.rotation.set(
        Math.random() * Math.PI,
        Math.random() * Math.PI,
        Math.random() * Math.PI
      );
      petal.userData.rotSpeed = {
        x: (Math.random() - 0.5) * 0.02,
        y: (Math.random() - 0.5) * 0.02,
        z: (Math.random() - 0.5) * 0.02
      };
      petal.userData.floatSpeed = 0.005 + Math.random() * 0.015;
      petal.userData.phase = Math.random() * 100;
      petalGroup.add(petal);
    }
    scene.add(petalGroup);

    // ============================================================
    // STARS
    // ============================================================
    const starsGeo = new THREE.BufferGeometry();
    const starsPos = new Float32Array(CONFIG.STAR_COUNT * 3);
    const starsColors = new Float32Array(CONFIG.STAR_COUNT * 3);

    for (let i = 0; i < CONFIG.STAR_COUNT; i++) {
      const idx = i * 3;
      const r = 35 + Math.random() * 60;
      const theta = Math.random() * Math.PI * 2;
      const phi = Math.acos((Math.random() * 2) - 1);

      starsPos[idx] = r * Math.sin(phi) * Math.cos(theta);
      starsPos[idx + 1] = r * Math.sin(phi) * Math.sin(theta);
      starsPos[idx + 2] = r * Math.cos(phi);

      const hue = CONFIG.HUE_RANGE.MIN + Math.random() * CONFIG.HUE_RANGE.SPAN;
      const col = new THREE.Color().setHSL(hue, 0.7, 0.6 + Math.random() * 0.4);
      starsColors[idx] = col.r;
      starsColors[idx + 1] = col.g;
      starsColors[idx + 2] = col.b;
    }

    starsGeo.setAttribute('position', new THREE.BufferAttribute(starsPos, 3));
    starsGeo.setAttribute('color', new THREE.BufferAttribute(starsColors, 3));

    const stars = new THREE.Points(
      starsGeo,
      new THREE.PointsMaterial({
        size: 0.18,
        vertexColors: true,
        transparent: true,
        opacity: 0.9,
        blending: THREE.AdditiveBlending,
        depthWrite: false
      })
    );
    scene.add(stars);

    // ============================================================
    // GROUND GLOW
    // ============================================================
    const glowDisc = new THREE.Mesh(
      new THREE.CircleGeometry(6, 64),
      new THREE.MeshBasicMaterial({
        color: 0x4c1d95,
        transparent: true,
        opacity: 0.12,
        side: THREE.DoubleSide
      })
    );
    glowDisc.rotation.x = -Math.PI / 2;
    glowDisc.position.y = -0.7;
    scene.add(glowDisc);

    // ============================================================
    // FLOATING ORBS
    // ============================================================
    for (let i = 0; i < CONFIG.ORB_COUNT; i++) {
      const hue = 0.65 + Math.random() * 0.35;
      const orb = new THREE.Mesh(
        new THREE.SphereGeometry(0.12 + Math.random() * 0.18, 8),
        new THREE.MeshStandardMaterial({
          color: new THREE.Color().setHSL(hue, 0.85, 0.65),
          emissive: new THREE.Color().setHSL(hue, 0.75, 0.4),
          emissiveIntensity: 0.4,
          roughness: 0.2,
          metalness: 0.1
        })
      );
      const angle = (i / CONFIG.ORB_COUNT) * Math.PI * 2;
      const rad = 4.0 + Math.random() * 1.5;
      orb.position.set(
        Math.cos(angle) * rad,
        0.8 + Math.sin(i * 1.7) * 1.2,
        Math.sin(angle) * rad
      );
      scene.add(orb);
    }

    // ============================================================
    // ANIMATION LOOP
    // ============================================================
    const clock = new THREE.Clock();

    function animateSparkles(elapsedTime) {
      sparkleGroup.rotation.y += 0.0008;
      sparkleGroup.children.forEach((spark) => {
        const { pulseSpeed, phase, baseScale } = spark.userData;
        const scale = baseScale * (0.7 + 0.5 * Math.sin(elapsedTime * pulseSpeed + phase));
        spark.scale.set(scale, scale, scale);
      });
    }

    function animatePetals(elapsedTime) {
      petalGroup.children.forEach((petal) => {
        const { rotSpeed, floatSpeed, phase } = petal.userData;
        petal.rotation.x += rotSpeed.x;
        petal.rotation.y += rotSpeed.y;
        petal.rotation.z += rotSpeed.z;
        petal.position.y += Math.sin(elapsedTime * floatSpeed + phase) * 0.0025;
      });
    }

    function animate() {
      const elapsedTime = performance.now() / 1000;

      // Central gem
      gem.rotation.x += CONFIG.GEM_ROTATION.x;
      gem.rotation.y += CONFIG.GEM_ROTATION.y;
      gem.rotation.z += CONFIG.GEM_ROTATION.z;

      glowSphere.rotation.x += 0.001;
      glowSphere.rotation.y += 0.004;

      // Rings
      ring1.rotation.y += CONFIG.RING_ROTATION.r1;
      ring2.rotation.y += CONFIG.RING_ROTATION.r2;
      ring3.rotation.y += CONFIG.RING_ROTATION.r3;

      // Knots
      knot1.rotation.x += CONFIG.KNOT_ROTATION.k1x;
      knot1.rotation.y += CONFIG.KNOT_ROTATION.k1y;
      knot2.rotation.x += CONFIG.KNOT_ROTATION.k2x;
      knot2.rotation.y += CONFIG.KNOT_ROTATION.k2y;

      // Particles
      animateSparkles(elapsedTime);
      animatePetals(elapsedTime);

      // Stars
      stars.rotation.y += CONFIG.STAR_ROTATION;

      // Controls
      controls.update();

      // Render
      composer.render();

      requestAnimationFrame(animate);
    }

    animate();

    // ============================================================
    // RESIZE HANDLER
    // ============================================================
    function handleResize() {
      const width = window.innerWidth;
      const height = window.innerHeight;

      camera.aspect = width / height;
      camera.updateProjectionMatrix();

      renderer.setSize(width, height);
      composer.setSize(width, height);

      effectFXAA.uniforms.resolution.value.set(1 / width, 1 / height);
    }

    window.addEventListener('resize', handleResize);

    // ============================================================
    // HIDE LOADING OVERLAY
    // ============================================================
    window.setTimeout(() => {
      loadingEl.classList.add('hidden');
    }, CONFIG.LOADING_DURATION_MS);
  </script>
</body>
</html>
