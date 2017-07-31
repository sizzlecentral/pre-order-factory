document.addEventListener("DOMContentLoaded", function () {
  if ( !window.updatingPreOrderElems ) {
     window.updatingPreOrderElems = true;

for (i=0; i < preOrderGrid.length; i++){
  $.ajax({
      url: 'https://pre-order-factory.herokuapp.com/batches/product/' + parseInt(preOrderGrid[i].getAttribute('data-id')),
      method: 'GET',
      dataType: 'JSON'
  }).done(function(productbatches){
// console.log(productbatches)
    console.log(productbatches.length)
    // Callbacks for filtering batch infor
    function getActiveBatch(batch) {
        return batch.active === true;
    };

    // Active Pre-order Batch
    var activeBatch = productbatches.filter(getActiveBatch);

    var clock = document.createElement('p');
    clock.id = "clock";

    // If Product is Active Pre-order Campaign - Adds Progress Bar, Description and Changes "Add to Cart" button to "Pre Order"
    if (activeBatch.length > 0) {

      // COUNTDOWN CLOCK


      clock.style.color = '#212B35';
      clock.style.textAlign = "center"
      clock.style.fontSize = "1rem"
      clock.style.fontWeight = "strong"

      var countDownDate = new Date(activeBatch[0].end_date + " 23:59:59").getTime();

      // Update the count down every 1 second
      var x = setInterval(function () {
          // Get todays date and time
          var now = new Date().getTime();
          // Find the distance between now an the count down date
          var distance = countDownDate - now;
          // Time calculations for days, hours, minutes and seconds
          var days = Math.floor(distance / (1000 * 60 * 60 * 24));
          var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
          var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
          var seconds = Math.floor((distance % (1000 * 60)) / 1000);
          var leftToSell = (activeBatch[0].min_quantity - activeBatch[0].num_sold)
          var percentageOfGoal = Math.round((activeBatch[0].num_sold) / (activeBatch[0].min_quantity) * 100);

          if (leftToSell < 0) {
            leftToSell = 0;
          }

          // Display the result in the element with id="demo"
          if (activeBatch[0].num_sold == 0) {
            // TODO
          } else if (days > 1) {
              clock.innerHTML = "Pre-Order | " + percentageOfGoal + "% of Goal";
          } else if (days === 1) {
              clock.innerHTML = "Pre-Order | " + percentageOfGoal + "% of Goal";
          } else if (days < 1) {
              clock.innerHTML = "Pre-Order | " + percentageOfGoal + "% of Goal";
          } else if (hours < 1) {
              clock.innerHTML = "Pre-Order | " + percentageOfGoal + "% of Goal";
          } else if (minutes < 1) {
              clock.innerHTML = "Pre-Order | " + percentageOfGoal + "% of Goal";
          } else if (distance < 0) {
              clearInterval(x);
              clock.innerHTML = "Pre-Sale Has Ended";
          }
      }, 1000);

        // Progress Bar
        var amountLoaded = Math.round((activeBatch[0].num_sold) / (activeBatch[0].min_quantity) * 100);
        var myProgress = document.createElement("div");
        var myBar = document.createElement("div");
        var progressText = document.createElement("p");


        myProgress.append(myBar);
        myProgress.style.width = "100%";
        myProgress.style.backgroundColor = "#DFE4E8";
        myBar.style.width = ".5%";
        myBar.style.backgroundColor = "#919EAB";
        myBar.style.maxWidth = '100%';
        myBar.style.height = ".5rem";
        myBar.style.marginTop = "0.5rem";
        myBar.style.marginBottom = "0.5rem";
        myBar.style.borderRadius = "20px";
        myProgress.style.borderRadius = "20px";
        progressText.style.textAlign = "center";
        progressText.style.color = "black";

        if (amountLoaded === 100) {
            progressText.innerHTML = "GOAL ACHIEVED";
        }

        // ^^ THIS CAN BE ANIMATED ON LOAD
        function move(amountLoaded) {
            var width = 1;
            var id = setInterval(frame, 10);

            function frame() {
                if (width >= amountLoaded) {
                    clearInterval(id);
                } else {
                    width++;
                    myBar.style.width = width + '%';
                }
            }
        }

        move(amountLoaded);

        // OUTPUT APPENDED TO DIV

        document.querySelector("[data-id='" + activeBatch[0].product_id +"']").append(myProgress);
        document.querySelector("[data-id='" + activeBatch[0].product_id +"']").append(clock);


      }




  });



// ProductGrid for loop end
}
}
  // End DOMContentLoaded
});
