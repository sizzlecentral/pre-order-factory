document.addEventListener("DOMContentLoaded", function () {
    $.ajax({
        url: 'https://pre-order-factory.herokuapp.com/batches/product/' + parseInt(preOrderFactory.getAttribute('data-id')),
        method: 'GET',
        dataType: 'JSON'
    }).done(function (responsedata) {
        var productBatches = responsedata
        // Identifies theme and creates elements to be modified if pre-order campaign is active
        if (Shopify.theme.name == 'Pop') {
            var aboveProductDescription = document.querySelector('.product-single__desc.rte');
            var addButton = document.querySelector('#addToCart-product-template');
        } else if (Shopify.theme.name == 'Narrative') {
            var aboveProductDescription = document.querySelector('.product__description.rte');
            var addButton = document.querySelector('.primary-text');
        } else if (Shopify.theme.name == 'Minimal') {
            var aboveProductDescription = document.querySelector('.product-description.rte');
            var addButton = document.querySelector('#AddToCart');
        } else if (Shopify.theme.name == 'Jumpstart') {
            var aboveProductDescription = document.querySelector('.product-description.rte');
            var addButton = document.querySelector('#AddToCart-product-template');
        } else if (Shopify.theme.name == 'Supply') {
            var aboveProductDescription = document.querySelector('.product-description.rte');
            var addButton = document.querySelector('#addToCart-product-template');
        } else if (Shopify.theme.name == 'Simple') {
            var aboveProductDescription = document.querySelector('.product-single__description');
            var addButton = document.querySelector('#AddToCart');
        } else if (Shopify.theme.name == 'Brooklyn') {
            var aboveProductDescription = document.querySelector('.product-single__description');
            var addButton = document.querySelector('#AddToCart--product-template');
        } else {
            var aboveProductDescription = document.querySelector('.product-single__description');
            var addButton = document.querySelector('#AddToCart-product-template');
            // This is for the debut, Boundless & Venture themes
        }
        // Callbacks for filtering batch infor
        function getActiveBatch(batch) {
            return batch.active === true;
        };
        // Active Pre-order Batch
        var activeBatch = productBatches.filter(getActiveBatch);
        // If Product is Active Pre-order Campaign - Adds Progress Bar, Description and Changes "Add to Cart" button to "Pre Order"
        if (activeBatch.length > 0) {

          // COUNTDOWN CLOCK
          var clock = document.createElement('p');
          clock.id = "clock";
          aboveProductDescription.prepend(clock);
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
              if (activeBatch[0].num_sold >= 1) {
                var amountSold = activeBatch[0].num_sold;
              } else {
                var amountSold = 0;
              }

              var percentageOfGoal = Math.round((activeBatch[0].num_sold) / (activeBatch[0].min_quantity) * 100);
              if (leftToSell < 0) {
                leftToSell = 0;
              }
              // Display the result in the element with id="demo"
              if (days > 1) {
                  clock.innerHTML = days + " Days Left | " + amountSold + " Sold | " + leftToSell + " to Go | " + percentageOfGoal + "% of Goal";
              } else if (days === 1) {
                  clock.innerHTML = days + " Day Left | " + amountSold + " Sold | " + leftToSell + " to Go | " + percentageOfGoal + "% of Goal";
              } else if (days < 1) {
                  clock.innerHTML = hours + "Hours Left | " + amountSold + " Sold | " + leftToSell + " to Go | " + percentageOfGoal + "% of Goal";
              } else if (hours < 1) {
                  clock.innerHTML = minutes + "Minutes Left | " + amountSold + " Sold | " + leftToSell + " to Go | " + percentageOfGoal + "% of Goal";
              } else if (minutes < 1) {
                  clock.innerHTML = seconds + "Seconds Left | " + amountSold + " Sold | " + leftToSell + " to Go | " + percentageOfGoal + "% of Goal";
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

            myBar.style.maxWidth = '100%';
            myBar.style.height = "1rem";
            myBar.style.borderRadius = "20px";
            myProgress.style.borderRadius = "20px";
            progressText.style.textAlign = "center";
            progressText.style.color = "black";
            if (amountLoaded > 0) {
              myBar.style.backgroundColor = "#919EAB";
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
            var spacer = document.createElement('br');
            aboveProductDescription.prepend(spacer);
            addButton.innerHTML = 'Pre-Order';
            aboveProductDescription.prepend(myProgress);
            aboveProductDescription.prepend(clock);
        };
    });
});
