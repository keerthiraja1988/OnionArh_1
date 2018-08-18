(function (publicMethod, $) {


    publicMethod.setStatusMessage = function (message) {
        $('#status-message').text(message);
    },

    publicMethod.test = function () {
        return 'teets';
    },

    publicMethod.FileEncryptMenuSelector = function () {
        $(".nav.navbar-nav li").removeClass("active");
        $("#fileEncryptMenu").addClass("active");
        
    },

    publicMethod.test1 = function (value1) {

        console.log("ready!" + value1);
        return 'teets1';
    }

}(window.JsFileEncrypt = window.JsFileEncrypt || {}, jQuery));

