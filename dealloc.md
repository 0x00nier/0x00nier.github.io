---
layout: default
---


<style>
  #mytext {
    word-wrap: break-word;
  }
</style>

<!-- <pre><h1 id="mytext"></h1></pre> -->
<h1 id="mytext"></h1>


<script>
var dealloc = `De4Ll0C`;
const text = dealloc.repeat(200);
const textContainer = document.getElementById("mytext");

function animateText() {
  const textArray = text.split("");
  let index = 0;
  let intervalId = setInterval(() => {
    textContainer.innerHTML += textArray[index];
    index++;

    if (index === textArray.length) {
      clearInterval(intervalId);
      return;
    }
  }, 5);
}

animateText();
</script>

