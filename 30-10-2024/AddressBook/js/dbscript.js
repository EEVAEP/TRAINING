const contactModal = document.getElementById('createContactModal');
contactModal.addEventListener('show.bs.modal', function (event) {
    const button = event.relatedTarget; // Button that triggered the modal
    const modalTitle = button.getAttribute('data-bs-title'); // Extract info from data-* attributes
    const submitText = button.getAttribute('data-bs-submit-text');
    
    // Update the modal's content
    const modalLabel = contactModal.querySelector('.modal-title');
    const modalSubmitButton = contactModal.querySelector('#modalSubmitButton');
    modalLabel.textContent = modalTitle;
    modalSubmitButton.textContent = submitText;
});
