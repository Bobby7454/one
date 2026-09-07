<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
  <title>Stunning 3D Anime World</title>
  <!-- Google Fonts for a clean, modern look -->
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600;700&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      overflow: hidden;
      font-family: 'Quicksand', sans-serif;
      color: white;
    }
    #info {
      position: absolute;
      bottom: 30px;
      left: 0;
      width: 100%;
      text-align: center;
      pointer-events: none;
      z-index: 10;
      text-shadow: 0 0 30px rgba(0,0,0,0.8);
      letter-spacing: 2px;
    }
    #info h1 {
      font-size: clamp(2.5rem, 10vw, 5rem);
      font-weight: 700;
      margin: 0;
      background: linear-gradient(45deg, #ff6b9d, #c084fc, #60a5fa);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      animation: glowPulse 3s ease-in-out infinite alternate;
    }
    #info p {
      font-size: clamp(1rem, 3vw, 1.5rem);
      margin: 0.5rem 0 0;
      opacity: 0.9;
      font-weight: 400;
      background: rgba(0,0,0,0.3);
      display: inline-block;
      padding: 0.3rem 1.5rem;
      border-radius: 40px;
      backdrop-filter: blur(4px);
      border: 1px solid rgba(255,255,255,0.15);
    }
    @keyframes glowPulse {
      0% { filter: drop-shadow(0 0 5px rgba(255,107,157,0.3)); }
      100% { filter: drop-shadow(0 0 25px rgba(192,132,252,0.6)); }
    }
    #credit {
      position: absolute;
      bottom: 10px;
      right: 20px;
      font-size: 0.8rem;
      opacity: 0.5;
      z-index: 10;
      pointer-events: none;
      letter-spacing: 1px;
      background: rgba(0,0,0,0.3);
      padding: 4px 12px;
      border-radius: 20px;
      backdrop-filter: blur(2px);
    }
    @media (max-width: 600px) {
      #info { bottom: 20px; }
      #credit { display: none; }
    }
    /* loading overlay (optional) */
    #loading {
      position: fixed;
      inset: 0;
      background: #0a0a1a;
      display: flex;
      align-items: center;
      justify-content: center;
      z-index: 999;
      color: white;
      font-size: 1.5rem;
      transition: opacity 1.5s ease;
      pointer-events: none;
    }
    #loading.hidden {
      opacity: 0;
    }
  </style>
</head>
<body>
  <div id="loading">✨ loading anime universe ...</div>
  <div id="info">
    <h1>✨ Anime Dreams ✨</h1>
    <p>3D・Ethereal・Stunning</p>
  </div>
  <div id="credit">🌸 3D anime vibe</div>

  <!-- Import maps and libraries -->
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

    // --- Setup Scene, Camera, Renderer ---
    const scene = new THREE.Scene();
    scene.background = new THREE.Color(0x0a0a1a); // deep cosmic blue-black

    const camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.1, 1000);
    camera.position.set(8, 4, 15);
    camera.lookAt(0, 0, 0);

    const renderer = new THREE.WebGLRenderer({ 
      antialias: true, 
      powerPreference: "high-performance"
    });
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
    renderer.toneMapping = THREE.ReinhardToneMapping;
    renderer.toneMappingExposure = 1.2;
    document.body.appendChild(renderer.domElement);

    // --- Post Processing ---
    const composer = new EffectComposer(renderer);
    const renderPass = new RenderPass(scene, camera);
    composer.addPass(renderPass);

    // Bloom for that ethereal glow
    const bloomPass = new UnrealBloomPass(
      new THREE.Vector2(window.innerWidth, window.innerHeight),
      0.6,   // strength
      0.4,   // radius
      0.2    // threshold
    );
    composer.addPass(bloomPass);

    // FXAA for crisp edges
    const effectFXAA = new ShaderPass(FXAAShader);
    effectFXAA.uniforms['resolution'].value.set(1 / window.innerWidth, 1 / window.innerHeight);
    composer.addPass(effectFXAA);

    // --- Controls (with auto-rotate) ---
    const controls = new OrbitControls(camera, renderer.domElement);
    controls.enableDamping = true;
    controls.dampingFactor = 0.05;
    controls.autoRotate = true;
    controls.autoRotateSpeed = 1.2;
    controls.enableZoom = true;
    controls.enablePan = false;
    controls.target.set(0, 0.5, 0);
    controls.update();

    // --- Lighting ---
    // Ambient base
    const ambientLight = new THREE.AmbientLight(0x404066, 0.6);
    scene.add(ambientLight);

    // Main warm key light
    const mainLight = new THREE.PointLight(0xffaa88, 1.5, 30);
    mainLight.position.set(5, 8, 7);
    scene.add(mainLight);

    // Cool fill light
    const fillLight = new THREE.PointLight(0x4466ff, 1.2, 30);
    fillLight.position.set(-6, 3, 5);
    scene.add(fillLight);

    // Rim light
    const rimLight = new THREE.DirectionalLight(0xff88cc, 0.8);
    rimLight.position.set(-2, 1, -8);
    scene.add(rimLight);

    // Back light for glow
    const backLight = new THREE.PointLight(0xaa88ff, 0.8);
    backLight.position.set(0, 2, -10);
    scene.add(backLight);

    // Additional colorful lights
    const colorLight1 = new THREE.PointLight(0xff4d6d, 0.6);
    colorLight1.position.set(4, -1, 6);
    scene.add(colorLight1);
    
    const colorLight2 = new THREE.PointLight(0x4cc9f0, 0.6);
    colorLight2.position.set(-5, 2, 6);
    scene.add(colorLight2);

    // --- Create stunning anime-style 3D objects ---

    // 1. Main central crystal / gem
    const gemGeo = new THREE.IcosahedronGeometry(1.5, 1);
    const gemMat = new THREE.MeshStandardMaterial({
      color: 0xc084fc,
      emissive: 0x6d28d9,
      emissiveIntensity: 0.3,
      roughness: 0.2,
      metalness: 0.1,
      transparent: true,
      opacity: 0.92
    });
    const gem = new THREE.Mesh(gemGeo, gemMat);
    gem.position.set(0, 1.2, 0);
    scene.add(gem);

    // Inner glow sphere
    const glowSphereGeo = new THREE.SphereGeometry(0.8, 32, 32);
    const glowSphereMat = new THREE.MeshBasicMaterial({
      color: 0xff6b9d,
      transparent: true,
      opacity: 0.25
    });
    const glowSphere = new THREE.Mesh(glowSphereGeo, glowSphereMat);
    glowSphere.position.set(0, 1.2, 0);
    scene.add(glowSphere);

    // 2. Floating rings around gem
    const ringMat = new THREE.MeshStandardMaterial({
      color: 0x60a5fa,
      emissive: 0x3b82f6,
      emissiveIntensity: 0.2,
      roughness: 0.3,
      metalness: 0.6,
      transparent: true,
      opacity: 0.7,
      side: THREE.DoubleSide
    });
    const ring = new THREE.Mesh(new THREE.TorusGeometry(2.2, 0.06, 32, 64), ringMat);
    ring.position.set(0, 1.2, 0);
    ring.rotation.x = Math.PI / 2.5;
    ring.rotation.z = 0.3;
    scene.add(ring);

    const ring2 = new THREE.Mesh(new THREE.TorusGeometry(2.6, 0.04, 32, 64), ringMat);
    ring2.material = ringMat.clone();
    ring2.material.color.setHex(0xf472b6);
    ring2.material.emissive.setHex(0xec4899);
    ring2.position.set(0, 1.2, 0);
    ring2.rotation.x = Math.PI / 1.8;
    ring2.rotation.y = 0.8;
    scene.add(ring2);

    const ring3 = new THREE.Mesh(new THREE.TorusGeometry(1.8, 0.03, 32, 64), ringMat);
    ring3.material = ringMat.clone();
    ring3.material.color.setHex(0xa78bfa);
    ring3.material.emissive.setHex(0x8b5cf6);
    ring3.position.set(0, 1.2, 0);
    ring3.rotation.x = Math.PI / 3;
    ring3.rotation.z = 1.2;
    scene.add(ring3);

    // 3. Floating "anime sparkles" - small glowing particles
    const sparkleGroup = new THREE.Group();
    const sparkleCount = 400;
    const sparkleGeo = new THREE.SphereGeometry(0.06, 6, 6);
    const sparkleMat = new THREE.MeshStandardMaterial({
      color: 0xffb3c6,
      emissive: 0xff6b9d,
      emissiveIntensity: 1.2
    });
    for (let i = 0; i < sparkleCount; i++) {
      const spark = new THREE.Mesh(sparkleGeo, sparkleMat.clone());
      // Distribute in a spherical shell
      const radius = 3.5 + Math.random() * 4.5;
      const theta = Math.random() * Math.PI * 2;
      const phi = Math.acos((Math.random() * 2) - 1);
      spark.position.x = radius * Math.sin(phi) * Math.cos(theta);
      spark.position.y = radius * Math.sin(phi) * Math.sin(theta) + 0.8;
      spark.position.z = radius * Math.cos(phi);
      // random color variation
      const hue = 0.6 + Math.random() * 0.4;
      spark.material.color.setHSL(hue, 0.9, 0.6);
      spark.material.emissive.setHSL(hue, 0.8, 0.4);
      spark.userData = {
        speed: 0.002 + Math.random() * 0.008,
        axis: new THREE.Vector3(Math.random() - 0.5, Math.random() - 0.5, Math.random() - 0.5).normalize(),
        offset: Math.random() * 100
      };
      sparkleGroup.add(spark);
    }
    scene.add(sparkleGroup);

    // 4. Floating ribbons / torus knots (anime magical feel)
    const knotMat = new THREE.MeshStandardMaterial({
      color: 0xf472b6,
      emissive: 0xec4899,
      emissiveIntensity: 0.2,
      roughness: 0.3,
      metalness: 0.1,
      wireframe: false,
      transparent: true,
      opacity: 0.4
    });
    const knot = new THREE.Mesh(new THREE.TorusKnotGeometry(1.2, 0.3, 64, 8, 2, 3), knotMat);
    knot.position.set(-2.8, 1.0, -1.5);
    scene.add(knot);

    const knot2 = new THREE.Mesh(new THREE.TorusKnotGeometry(0.9, 0.2, 64, 8, 3, 4), knotMat);
    knot2.material = knotMat.clone();
    knot2.material.color.setHex(0x60a5fa);
    knot2.material.emissive.setHex(0x3b82f6);
    knot2.position.set(3.0, 1.8, -1.2);
    scene.add(knot2);

    // 5. Floating "anime petals" or small discs
    const petalGroup = new THREE.Group();
    const petalMat = new THREE.MeshStandardMaterial({
      color: 0xff8cae,
      emissive: 0xff4d6d,
      emissiveIntensity: 0.1,
      roughness: 0.6,
      metalness: 0.1,
      side: THREE.DoubleSide
    });
    for (let i = 0; i < 80; i++) {
      const petal = new THREE.Mesh(new THREE.CircleGeometry(0.15 + Math.random()*0.2, 5), petalMat.clone());
      const angle = Math.random() * Math.PI * 2;
      const radius = 2.5 + Math.random() * 5;
      petal.position.set(
        Math.cos(angle) * radius,
        Math.random() * 3 + 0.5,
        Math.sin(angle) * radius
      );
      petal.rotation.set(
        Math.random() * Math.PI,
        Math.random() * Math.PI,
        Math.random() * Math.PI
      );
      petal.material.color.setHSL(0.9 + Math.random()*0.2, 0.8, 0.6);
      petal.material.emissive.setHSL(0.9 + Math.random()*0.2, 0.7, 0.3);
      petal.userData = {
        rotSpeed: new THREE.Vector3(
          (Math.random() - 0.5) * 0.02,
          (Math.random() - 0.5) * 0.02,
          (Math.random() - 0.5) * 0.02
        ),
        floatSpeed: 0.005 + Math.random() * 0.015,
        floatAmp: 0.1 + Math.random() * 0.3,
        phase: Math.random() * 100
      };
      petalGroup.add(petal);
    }
    scene.add(petalGroup);

    // 6. Background stars (distant)
    const starsGeo = new THREE.BufferGeometry();
    const starsCount = 2000;
    const starsPos = new Float32Array(starsCount * 3);
    const starsColors = new Float32Array(starsCount * 3);
    for (let i = 0; i < starsCount * 3; i += 3) {
      const r = 30 + Math.random() * 50;
      const theta = Math.random() * Math.PI * 2;
      const phi = Math.acos((Math.random() * 2) - 1);
      starsPos[i] = r * Math.sin(phi) * Math.cos(theta);
      starsPos[i+1] = r * Math.sin(phi) * Math.sin(theta);
      starsPos[i+2] = r * Math.cos(phi);
      // color
      const col = new THREE.Color().setHSL(0.6 + Math.random()*0.4, 0.6, 0.5 + Math.random()*0.4);
      starsColors[i] = col.r;
      starsColors[i+1] = col.g;
      starsColors[i+2] = col.b;
    }
    starsGeo.setAttribute('position', new THREE.BufferAttribute(starsPos, 3));
    starsGeo.setAttribute('color', new THREE.BufferAttribute(starsColors, 3));
    const starsMat = new THREE.PointsMaterial({
      size: 0.15,
      vertexColors: true,
      transparent: true,
      opacity: 0.8,
      blending: THREE.AdditiveBlending,
      depthWrite: false
    });
    const stars = new THREE.Points(starsGeo, starsMat);
    scene.add(stars);

    // 7. Ground subtle glow disc
    const glowDiscMat = new THREE.MeshBasicMaterial({
      color: 0x4c1d95,
      transparent: true,
      opacity: 0.15,
      side: THREE.DoubleSide
    });
    const glowDisc = new THREE.Mesh(new THREE.CircleGeometry(5, 64), glowDiscMat);
    glowDisc.rotation.x = -Math.PI / 2;
    glowDisc.position.y = -0.6;
    scene.add(glowDisc);

    // extra floating orbs
    const orbMat = new THREE.MeshStandardMaterial({
      color: 0x8b5cf6,
      emissive: 0x6d28d9,
      emissiveIntensity: 0.3,
      roughness: 0.2,
      metalness: 0.1
    });
    for (let i = 0; i < 12; i++) {
      const orb = new THREE.Mesh(new THREE.SphereGeometry(0.12 + Math.random()*0.15, 8), orbMat);
      const angle = (i / 12) * Math.PI * 2;
      const rad = 3.8;
      orb.position.set(
        Math.cos(angle) * rad,
        0.8 + Math.sin(i*1.5) * 0.5,
        Math.sin(angle) * rad
      );
      orb.material = orbMat.clone();
      orb.material.color.setHSL(0.7 + Math.random()*0.3, 0.8, 0.6);
      orb.material.emissive.setHSL(0.7 + Math.random()*0.3, 0.7, 0.3);
      scene.add(orb);
    }

    // --- Animation Loop ---
    let clock = new THREE.Clock();

    function animate() {
      const delta = clock.getDelta();
      const elapsedTime = performance.now() / 1000;

      // Rotate central gem
      gem.rotation.x += 0.002;
      gem.rotation.y += 0.005;
      gem.rotation.z += 0.001;
      glowSphere.rotation.x += 0.001;
      glowSphere.rotation.y += 0.003;

      // Rotate rings
      ring.rotation.y += 0.005;
      ring2.rotation.y -= 0.004;
      ring3.rotation.y += 0.006;

      // Rotate knots
      knot.rotation.x += 0.01;
      knot.rotation.y += 0.015;
      knot2.rotation.x -= 0.008;
      knot2.rotation.y += 0.012;

      // Animate sparkles: rotate group and individual wobble
      sparkleGroup.rotation.y += 0.001;
      sparkleGroup.children.forEach((spark, idx) => {
        const data = spark.userData;
        // small orbit
        const angle = elapsedTime * data.speed + data.offset;
        // no need to move position heavily, just pulse size or color? we can scale
        const scale = 0.8 + 0.4 * Math.sin(elapsedTime * 2 + idx);
        spark.scale.set(scale, scale, scale);
      });

      // Animate petals
      petalGroup.children.forEach((petal) => {
        petal.rotation.x += petal.userData.rotSpeed.x;
        petal.rotation.y += petal.userData.rotSpeed.y;
        petal.rotation.z += petal.userData.rotSpeed.z;
        // float up/down
        petal.position.y += Math.sin(elapsedTime * petal.userData.floatSpeed + petal.userData.phase) * 0.002;
      });

      // stars slow rotation
      stars.rotation.y += 0.0001;

      // update controls (autoRotate)
      controls.update();

      // render via composer
      composer.render();

      requestAnimationFrame(animate);
    }

    animate();

    // --- Resize Handler ---
    window.addEventListener('resize', () => {
      const width = window.innerWidth;
      const height = window.innerHeight;
      camera.aspect = width / height;
      camera.updateProjectionMatrix();
      renderer.setSize(width, height);
      composer.setSize(width, height);
      effectFXAA.uniforms['resolution'].value.set(1 / width, 1 / height);
    });

    // hide loading overlay
    setTimeout(() => {
      document.getElementById('loading').classList.add('hidden');
    }, 800);

    // minor: if user interacts, we can slow autoRotate? not needed
  </script>
</body>
</html>
