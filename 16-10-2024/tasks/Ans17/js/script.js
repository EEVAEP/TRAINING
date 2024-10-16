
function validateInput() {
    var input = document.getElementById("numberInput").value;

        if (isNaN(input) || input.trim() === "") {
        alert("Please enter a valid numeric value.");
        return false;  // Prevent form submission
    }

   
    return true;
}
