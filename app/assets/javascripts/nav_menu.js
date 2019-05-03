function burgerMenu(icon) {
    var menu = document.getElementById("main_menu");
    // toggle dropdown view
    if (menu.classList.contains('responsive')) {
        menu.classList.remove("responsive");
    } else {
        menu.classList.add("responsive");
    }
    // toggle burger icon
    icon.classList.toggle("change");
}