---
layout: default
---

<video height="100%" width="100%" id="vid" controls autoplay loop muted>
  <source src="./assets/images/53N1oR_3Ng1N33R.mp4" type="video/mp4">
</video>

<script>
const delay = (delayInms) => {
  return new Promise(resolve => setTimeout(resolve, delayInms));
};

var video = document.getElementById('vid');
setTimeout(function(){
        console.log("hi");
   },1000);
</script>


