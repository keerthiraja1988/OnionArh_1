(function (publicMethod, $) {


    publicMethod.ManagementMenuSelector = function () {
        $(".nav.navbar-nav li").removeClass("active");
        $("#managementMenu").addClass("active");

    },

    publicMethod.GetLoggedInUserDetails = function () {

        $.ajax({
            type: "GET",
            url: "/Management/User/GetLoggedInUserDetails",
            contentType: 'application/json; charset=utf-8',
            beforeSend: function (data) {
                JsMain.ShowLoaddingIndicator();
            },
            complete: function (data) {             
                JsMain.HideLoaddingIndicator();
            },
            success: function (data) {
                $("#attachModalPopupLayout").append(data);
                $("#userDetialsModel").modal('show');
            },
            error: function () {
                alert("Error occured!!")
            }
        });
    }

   

}(window.JsManagement = window.JsManagement || {}, jQuery));

