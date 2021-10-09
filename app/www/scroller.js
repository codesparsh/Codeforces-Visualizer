

for (var i = 1; i <=7; i++) {
    document.getElementById("b"+i).addEventListener("click", function() {
        alert("Button Clicked");
    });
}

$(window).on('beforeunload', function(){ 
  
  change_page("homeUi")
  
});