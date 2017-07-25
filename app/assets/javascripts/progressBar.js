// <progress id="progressBar" value="0" max="100" style="width:20%; height:44px"></progress>
var progress = document.createElement("progress")
progress.setAttribute("id", "progressBar")
progress.setAttribute("value", "0")
progress.setAttribute("max", "100")
progress.style.width = "100%"
progress.style.height = "50px"
progressBarDiv.appendChild(progress);

// <span id="status"></span>
var statusSpan = document.createElement("span")
statusSpan.setAttribute("id", "status")
progressBarDiv.appendChild(statusSpan);

// <h1 id="finalMessage"></h1>
var finalMessage = document.createElement('h1');
finalMessage.setAttribute("id", "finalMessage")
progressBarDiv.appendChild(finalMessage);

// <button id="button" value="button">BUY!</button>
var button = document.createElement("button")
button.setAttribute("id", "buyButton")
button.setAttribute("value", "button")
progressBarDiv.appendChild(button);


// var buttonId = document.getElementById('button');
// buttonId.addEventListener('click', function() {
// 	progressBarSim(amountLoaded)
// });

var numSold = activeBatch[0].num_sold;
var minQuantity = activeBatch[0].min_quantity;
var amountLoaded = (numSold)/(minQuantity)*100;

function progressBarSim(amountLoaded) {
	var bar = document.getElementById('progressBar');
	var status = document.getElementById('status');
	status.innerHTML = amountLoaded+"%";
	bar.value = amountLoaded;
	amountLoaded++;
	if(amountLoaded == 100){
		status.innerHTML = "100%";
		var finalMessage = document.getElementById('finalMessage');
		finalMessage.innerHTML = "Reached the Goal";
	}
}
