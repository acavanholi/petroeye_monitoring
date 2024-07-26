function toggleMenu() {
    var nav = document.getElementById("myNav");
    if (nav.style.width === "250px") {
        nav.style.width = "0";
    } else {
        nav.style.width = "250px";
    }
}

function toggleSearch() {
    var searchBox = document.getElementById("searchBox");
    if (searchBox.style.width === "250px") {
        searchBox.style.width = "0";
        setTimeout(() => { searchBox.style.display = "none"; }, 500);
    } else {
        searchBox.style.display = "flex";
        setTimeout(() => { searchBox.style.width = "250px"; }, 10);
        document.getElementById("searchInput").focus();
    }
}

window.onclick = function(event) {
    var nav = document.getElementById("myNav");
    var searchBox = document.getElementById("searchBox");
    var searchInput = document.getElementById("searchInput");
    if (!nav.contains(event.target) && event.target !== document.querySelector(".hamburger")) {
        nav.style.width = "0";
    }
    if (!searchBox.contains(event.target) && event.target !== document.querySelector(".search-icon") && event.target !== searchInput) {
        searchBox.style.width = "0";
        setTimeout(() => { searchBox.style.display = "none"; }, 500);
    }
}