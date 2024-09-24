function validateInput() {
	var userInput = document.getElementById("numberInput").value;

          
            if (isNaN(userInput) || userInput <= 0 || userInput.trim() === "") {
                alert("Please enter a valid positive numeric value.");
                return false;
            }
            return true;
        }