(
function (publicMethod, $) {

    publicMethod.ShowRelaodMessageModal = function (headerMessage, message) {
        $('#reloadMessageModel').modal('show');
        $('#reloadMessageModelDialogModelHeaderValue').text(headerMessage);
        $('#reloadMessageModelDialogModelMessageValue').text(message);
    },

    publicMethod.ShowLoaddingIndicator = function () {

        $("#loadingIconModal").modal('show');

    },

    publicMethod.HideLoaddingIndicator = function () {
        $("#loadingIconModal").modal('hide');
    }

}(window.JsMain = window.JsMain || {}, jQuery));

window.onerror = function (errorMsg, url, lineNumber, column, errorObj) {

    // Send object with all data to server side log, using severity fatal,
    // from logger "onerrorLogger"
    JL("onerrorLogger").fatalException({
        "errorMsg": errorMsg, "url": url,
        "line number": lineNumber, "column": column
    }, errorObj);

    // Tell browser to run its own error handler as well
    return false;
};

(function ($, global, undefined) {
    "use strict";

    $.aop = global.AOP;

    $.aop.noConflict();

}(jQuery, this));

var JsFileEncryptLogging = $.aop.around(function (target, args) {
    var retval;



    // do something before
    try {
        retval = target.apply(this, args); // target invocation

        JL("JsFileEncrypt").debug({
            "msg": "Jquery Debug",
            "Jquery File": "JsFileEncrypt", "Jquery Function ": retval, "Value": args
        });

        // do something after returning

    } catch (e) {

        // do something after throwing

        throw e;
    } finally {

        // do something after
    }

    return retval
});

var JsManagementLogging = $.aop.around(function (target, args) {
    //alert(target);
    //alert(args);

    var retval;
    // do something before
    try {
        retval = target.apply(this, args); // target invocation

        JL("JsManagement").debug({
            "msg": "Jquery Debug",
            "Jquery File": "JsManagement", "Jquery Function ": retval, "Value": args
        });

        // do something after returning

    } catch (e) {

        // do something after throwing

        throw e;
    } finally {

        // do something after
    }

    return retval
});


var JsMainLogging = $.aop.around(function (target, args) {
    var retval;
    // do something before
    try {
        retval = target.apply(this, args); // target invocation

        JL("JsMain").debug({
            "msg": "Jquery Debug",
            "Jquery File": "JsMain", "Jquery Function ": retval, "Value": args
        });

        // do something after returning

    } catch (e) {

        // do something after throwing

        throw e;
    } finally {

        // do something after
    }

    return retval
});

$.aop.aspect(JsFileEncrypt).advice(JsFileEncryptLogging);
//$.aop.aspect(JsManagement).advice(JsManagementLogging);
//$.aop.aspect(JsMain).advice(JsMainLogging);
// Notification Hub

//a helper function to encode HTML values.
function htmlEncode(value) {
    return $('<div />').text(value).html();
}

//execute on document ready
$(function () {




    $(".nav li").on("click", function () {
        $(".nav li").removeClass("active");
        $(this).addClass("active");
    });

    //function that the hub can call when it receives a notification.
    $.connection.notificationHub.client.SendNotification = function (title, message, alertType) {
        var cls = 'alert-' + alertType;
        var html = '<div class="alert ' + cls + ' alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>';
        if (typeof title !== 'undefined' && title !== '') {
            html += '<h4>' + title + '</h2>';
        }

        html += '<span>' + message + '</span></div>';
        $(html).hide().appendTo(messages).slideDown('slow');
    };

    //function that the hub can call when it receives a notification.
    $.connection.notificationHub.client.broadcaastNotif = function (title, message, alertType, notificationId) {

        var divnotificationId = 'div' + notificationId
        var cls = 'alert-' + alertType;
        var html = '<div id=' + divnotificationId + ' class="alert ' + cls + ' alert-dismissable">';


        html += ' <button type="button" id =' + notificationId + ' onclick="DisplayedNotification(this.id)" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>';
        if (typeof title !== 'undefined' && title !== '') {
            html += '<h4>' + title + '</h2>';
        }

        html += '<span>' + message + '</span></div>';
        $(html).hide().appendTo(messages).slideDown('slow');
    };

    //function that the hub can call when it receives a notification.
    $.connection.notificationHub.client.removeUserNotification = function (notificationId) {
        //alert('remove ' + notificationId);

        // $('#toremove').remove();
        var divnotificationId = 'div' + notificationId
        $("#" + divnotificationId).remove();
    };
    var currentBrowserUrl = window.location.href;

    $.connection.hub.qs = 'currentBrowserUrl=' + currentBrowserUrl;
    $.connection.hub.start();
    //window.notifyApp = {
    //      hubConnector: $.connection.hub.start(),   //start the connection and store object returned globally for access in child views
    //};

});

function DisplayedNotification(notificationId) {

    // alert(notificationId)
    //  $.connection.notificationHub.server.sendNotification(title, message);
    var Notification = { NotificationId: notificationId };

    $.ajax({
        type: "POST",
        url: "/Management/NotifyManage/DisplayedNotification",
        data: JSON.stringify(Notification),
        contentType: 'application/json; charset=utf-8',
        success: function (data) {
            //reset field
            // alert("DisplayedNotification occured!!")
        },
        error: function () {
            alert("Error occured!!")
        }
    });
}


