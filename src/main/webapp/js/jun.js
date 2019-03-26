function new_html(url) {
    window.location.assign(url);
}
function new_window(url) {
    window.open(url);
}
function new_suspend_window(url) {
    var tmp = window.open("about:blank", "", "fullscreen=1")
    tmp.location = url;
}
