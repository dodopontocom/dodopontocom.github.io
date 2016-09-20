var ClientTabs = new Object();

ClientTabs.selectTab = function(controlId, tabId)
    {
        // Get previous value
        var hiddenField = document.getElementById(controlId + '_hidden');
        var prevTabId = hiddenField.value;
        
        // Hide previous tab
        document.getElementById(prevTabId + '_tab').className = 'tab unselectedTab';
        document.getElementById(prevTabId).style.display = 'none';
        
        // Show new tab
        document.getElementById(tabId).style.display = 'block';
        document.getElementById(tabId + '_tab').className = 'tab selectedTab';
        
        // Update hidden value
        hiddenField.value = tabId;     
    }



