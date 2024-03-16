<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<!-- Ensures proper rendering and touch zooming on mobile devices -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Refined CSS Gradient Generator</title>
<style>
  /* General styles for the body and html, setting up margin, font, and color */
  body, html {
    height: 100%;
    margin: 0;
    font-family: Arial, sans-serif;
    color: #000; /* Text color set to black */
  }

  /* Container for the gradient generator, centered on the page */
  .gradientGenContainer {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f4f4f4;
  }

  /* Styles for the gradient generator box */
  .gradientGenGenerator {
    text-align: center;
    padding: 20px;
    background-color: white;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    border-radius: 8px;
  }

  /* The preview area where the generated gradient is shown */
  .gradientGenPreview {
    margin: 20px 0;
    height: 200px;
    width: 100%;
    border-radius: 8px;
    border: 1px solid #ccc;
    background-color: transparent; /* Background made transparent */
  }

  /* The textarea where the generated CSS code is displayed */
  .gradientGenCode {
    width: calc(100% - 40px);
    height: 100px;
    border-radius: 4px;
    margin-top: 10px;
    padding: 10px;
    border: 1px solid #ccc;
    background-color: #fafafa;
    font-family: monospace;
    resize: none;
    color: #000; /* Ensures the code text is also black */
  }

  /* Styling for labels, buttons, and input elements */
  label, button, input[type="range"] {
    display: block;
    margin: 10px 0;
  }

  /* Container for the slider input */
  .sliderContainer {
    display: flex;
    justify-content: center;
  }

  /* Styling adjustments for range input */
  input[type="range"] {
    margin: 10px auto; /* Adjusted to auto for horizontal margin */
  }

  /* Styling for color inputs and select dropdown */
  input[type="color"], select {
    margin-top: 5px;
  }

  /* Styling for the submit button */
  button {
    padding: 10px;
    color: #fff;
    background-color: #007bff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  /* Hover effect for the button */
  button:hover {
    background-color: #0056b3;
  }
</style>
</head>
<body>

<div class="gradientGenContainer">
  <div class="gradientGenGenerator">
    <h2>Gradient Generator</h2>
    <p>Select your colors and gradient direction:</p>
    
    <!-- Color selection inputs -->
    <input type="color" id="color1" value="#ff0000" onchange="generateGradient()">
    <input type="color" id="color2" value="#00ff00" onchange="generateGradient()">
    
    <!-- Dropdown for selecting gradient direction -->
    <select id="direction" onchange="generateGradient()">
      <option value="to right">Left to Right</option>
      <option value="to bottom">Top to Bottom</option>
      <option value="to bottom right">Diagonal</option>
    </select>

    <!-- Range slider for opacity selection -->
    <label for="intensity">Select your opacity:</label>
    <div class="sliderContainer">
      <input type="range" id="intensity" min="0" max="1" step="0.1" value="1" onchange="generateGradient()">
    </div>
    
    <!-- Preview area for the generated gradient -->
    <div class="gradientGenPreview" id="preview"></div>
    <p>Place this code in your CSS section:</p>
    <!-- Textarea to display the generated CSS code -->
    <textarea id="code" class="gradientGenCode" readonly></textarea>
  </div>
</div>

<script>
// Function to generate the gradient based on user input
function generateGradient() {
  const color1 = document.getElementById('color1').value;
  const color2 = document.getElementById('color2').value;
  const direction = document.getElementById('direction').value;
  const intensity = document.getElementById('intensity').value;

  // Convert hex color to rgba format
  const rgbaColor1 = hexToRgba(color1, intensity);
  const rgbaColor2 = hexToRgba(color2, intensity);

  // Applying the gradient to the preview and displaying the code
  const preview = document.getElementById('preview');
  const code = document.getElementById('code');

  const gradientStyle = `background: linear-gradient(${direction}, ${rgbaColor1}, ${rgbaColor2});`;
  
  preview.style = gradientStyle;
  code.value = gradientStyle;
}

// Helper function to convert hex color values to RGBA format
function hexToRgba(hex, opacity) {
  let r = parseInt(hex.slice(1, 3), 16),
      g = parseInt(hex.slice(3, 5), 16),
      b = parseInt(hex.slice(5, 7), 16);

  return `rgba(${r}, ${g}, ${b}, ${opacity})`;
}

// Ensure the gradient is generated when the page loads
window.onload = generateGradient;
</script>

</body>
</html>
