(function (publicMethod, $) {


    publicMethod.setStatusMessage = function (message) {
        $('#status-message').text(message);
    },

    publicMethod.test = function () {
        return 'teets';
    },



    publicMethod.AdminMenuSelector = function () {
        $(".nav.navbar-nav li").removeClass("active");
        $("#adminMenu").addClass("active");

    }



}(window.JsAdmin = window.JsAdmin || {}, jQuery));

