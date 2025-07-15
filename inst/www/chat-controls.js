$(document).ready(function() {
  function positionStopButton() {
    const chatInput = document.querySelector('shiny-chat-input');
    const stopButton = document.querySelector('.enhanced-stop-button');
    
    if (chatInput && stopButton) {
      const sendButton = chatInput.querySelector('button');
      
      if (sendButton) {
        const sendButtonRect = sendButton.getBoundingClientRect();
        
        stopButton.style.position = 'fixed';
        stopButton.style.top = sendButtonRect.top + 'px';
        stopButton.style.right = (window.innerWidth - sendButtonRect.left + 8) + 'px';
        stopButton.style.zIndex = '1000';
      }
    }
  }
  
  const observer = new MutationObserver(function(mutations) {
    mutations.forEach(function(mutation) {
      if (mutation.type === 'childList') {
        const addedNodes = Array.from(mutation.addedNodes);
        const hasStopButton = addedNodes.some(node => 
          node.classList && node.classList.contains('enhanced-stop-button')
        );
        
        if (hasStopButton) {
          setTimeout(positionStopButton, 10);
        }
      }
    });
  });
  
  observer.observe(document.body, {
    childList: true,
    subtree: true
  });
  
  $(window).on('resize', positionStopButton);
});