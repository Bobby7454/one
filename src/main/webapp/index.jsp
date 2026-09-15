/* ============================================================
   BUGGY CSS - Quality Gate Test Suite
   ============================================================ */

/* BUG: Duplicate selectors */
.header { color: red; }
.header { color: blue; }
.header { color: green; }

/* BUG: !important overuse */
.important-class {
  color: red !important;
  background: blue !important;
  font-size: 14px !important;
  margin: 10px !important;
}

/* BUG: Empty rulesets */
.empty-rule {}
.another-empty { }

/* BUG: Vendor prefixes without standards */
-webkit-box-shadow: 0 0 10px black;
-moz-box-shadow: 0 0 10px black;
-ms-box-shadow: 0 0 10px black;
box-shadow: 0 0 10px black;

/* BUG: Zero values with units */
.zero-units {
  margin: 0px;
  padding: 0px;
  border: 0px;
  top: 0px;
  left: 0px;
}

/* BUG: Magic numbers */
.magic {
  width: 347px;
  height: 219px;
  top: 137px;
  left: 421px;
}

/* BUG: Overly specific selectors */
body div#main .container .wrapper ul li a.link:hover { color: red; }

/* BUG: ID selectors (specificity issues) */
#header { color: red; }
#nav { color: blue; }
#footer { color: green; }

/* BUG: Missing fallbacks */
.font-missing {
  font-family: 'NonExistentFont'; /* no fallback */
}

/* BUG: Deprecated properties */
.deprecated {
  behavior: url(#default#userData);
  filter: alpha(opacity=50);
  zoom: 1;
}

/* BUG: Unknown properties (typos) */
.typos {
  colr: red;          /* typo: color */
  backgroud: blue;    /* typo: background */
  font-weigth: bold;  /* typo: font-weight */
  margn: 10px;        /* typo: margin */
}

/* BUG: Duplicate properties in same rule */
.duplicate-props {
  color: red;
  color: blue;
  color: green;
  margin: 10px;
  margin: 20px;
}

/* BUG: Shorthand overriding longhand */
.shorthand-override {
  margin-top: 5px;
  margin: 10px; /* overrides margin-top */
}

/* BUG: Unused CSS classes (dead code) */
.unused-class-1 { color: red; }
.unused-class-2 { color: blue; }
.unused-class-3 { color: green; }
.unused-class-4 { color: yellow; }
.unused-class-5 { color: purple; }

/* BUG: Excessive nesting (if using preprocessor) */
/* .a { .b { .c { .d { .e { .f { .g { color: red; } } } } } } } */

/* BUG: Hard-coded colors (no variables) */
.color-1 { color: #ff0000; }
.color-2 { color: #00ff00; }
.color-3 { color: #0000ff; }
.color-4 { color: #ffff00; }
.color-5 { color: #ff00ff; }
.color-6 { color: #00ffff; }

/* BUG: Inconsistent naming conventions */
.snake_case { color: red; }
.camelCase { color: blue; }
.PascalCase { color: green; }
.kebab-case { color: yellow; }
.SCREAMING_CASE { color: purple; }

/* BUG: Missing vendor prefixes for modern features */
.modern {
  display: flex;           /* missing -webkit- for older browsers */
  transform: rotate(45deg); /* missing -webkit- */
  transition: all 1s;       /* missing -webkit- */
}

/* BUG: Overly long selectors */
div.container > div.wrapper > div.content > div.inner > div.deep > div.deeper > div.deepest { color: red; }

/* BUG: Animations without vendor prefixes */
@keyframes spin {
  from { transform: rotate(0deg); }
  to { transform: rotate(360deg); }
}
.animated {
  animation: spin 2s linear infinite;
  /* missing -webkit-animation */
}

/* BUG: Media query without viewport meta tag (redundant) */
@media screen and (max-width: 600px) {
  .mobile { display: none; }
}

/* BUG: Duplicate media queries */
@media screen and (max-width: 600px) { .a { color: red; } }
@media screen and (max-width: 600px) { .b { color: blue; } }
@media screen and (max-width: 600px) { .c { color: green; } }

/* BUG: Pixels for font sizes (accessibility) */
.inaccessible {
  font-size: 12px;
  line-height: 14px;
}

/* BUG: Color contrast issues (likely) */
.low-contrast {
  color: #cccccc;
  background: #ffffff;
}

/* BUG: Missing focus styles */
button:focus { outline: none; } /* removes focus indicator */

/* BUG: Using @import (performance) */
@import url('https://cdn.example.com/style1.css');
@import url('https://cdn.example.com/style2.css');
@import url('https://cdn.example.com/style3.css');
@import url('https://cdn.example.com/style4.css');
@import url('https://cdn.example.com/style5.css');

/* BUG: Universal selector (performance) */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* BUG: Expensive properties */
.expensive {
  box-shadow: 0 0 100px 50px rgba(255,0,0,0.5);
  filter: blur(50px) drop-shadow(0 0 100px red);
  backdrop-filter: blur(100px);
}

/* BUG: Duplicate @font-face declarations */
@font-face {
  font-family: 'AnimeFont';
  src: url('anime.woff2') format('woff2');
}
@font-face {
  font-family: 'AnimeFont';
  src: url('anime.woff2') format('woff2');
  /* duplicate declaration */
}

/* BUG: Missing semicolons */
.missing-semicolon {
  color: red
  background: blue
  margin: 10px
}

/* BUG: Extra semicolons */
.extra-semicolons {
  color: red;;
  background: blue;;;
}

/* BUG: Empty media queries */
@media screen and (max-width: 100px) { }

/* BUG: Invalid values */
.invalid {
  width: -10px;
  height: -50%;
  color: notacolor;
  display: invalid-value;
}

/* BUG: Conflicting properties */
.conflicting {
  display: block;
  display: flex;
  display: grid;
}
