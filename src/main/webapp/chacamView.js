     var imageIds = ["imageElement1", "imageElement2", "imageElement3", "imageElement4", "imageElement5"];

     for (var i = 0; i < imageIds.length; i++) {
         var imageElement = document.getElementById(imageIds[i]);
         var srcValue = imageElement.getAttribute("src");

         if (srcValue !== "") {
             imageElement.style.display = "block";
         } else {
             imageElement.style.display = "none";
         }
     }
