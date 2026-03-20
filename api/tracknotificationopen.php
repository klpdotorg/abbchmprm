<?php

/**
 * Service API: tracknotificationopen
 * File name: tracknotificationopen.php
 *
 * Called by the app when the child taps a push notification.
 * Updates opened_datetime and is_opened on the most recent matching
 * log row for this child + notification_type.
 *
 * The notification_type value is delivered to the app via the FCM
 * data payload (key: "notification_type") set at send time.
 *
 * JSON Payload:
 * {
 *   "access_token":      "<token from login/register>",
 *   "notification_type": "<e.g. inactive_3days | daily_reminder>"
 * }
 *
 * JSON Response:
 * {
 *   "status":      "success|failed",
 *   "description": "reason on failure"
 * }
 */

    session_start();

    $appbasedirorg = dirname(__FILE__);
    $appbasedir    = substr($appbasedirorg, 0, -4); // remove 'api' directory
    $_SESSION['ABSAPP_BASE_DIR']        = $appbasedir;
    $_SESSION['ABSAPP_CONFIG_FILE']     = $appbasedir . "/config/appconfig.php";
    $_SESSION['ABSAPP_DB_CONFIG_FILE']  = $appbasedir . "/config/dbconfig.php";

    $hosturl    = "http://" . $_SERVER['HTTP_HOST'];
    $requesturi = $_SERVER['REQUEST_URI'];
    $lenuri     = strripos($requesturi, "/", 0);
    $appurl     = substr($requesturi, 0, $lenuri - 4);
    $_SESSION['ABSAPP_BASE_URL'] = $hosturl . $appurl . "/";

    require_once($_SESSION['ABSAPP_BASE_DIR'] . "/servicefunctions/servicefunctions.php");

    $valid_types = [
        'inactive_3days', 'inactive_7days', 'inactive_14days',
        'inactive_1month', 'inactive_2months', 'inactive_3months',
        'mid_game_3days', 'reward_5games', 'daily_reminder'
    ];

    $jsonstring = file_get_contents("php://input");
    $data       = json_decode($jsonstring);

    if ($data) {

        $access_token      = $data->{'access_token'};
        $notification_type = $data->{'notification_type'};

        if ($access_token && $notification_type) {

            if (!in_array($notification_type, $valid_types)) {
                $responsedata = array(
                    'status'      => "failed",
                    'description' => "Invalid notification_type."
                );
                $em = new exceptionMgr(" ");
                $em->logInfo("tracknotificationopen: Invalid notification_type '$notification_type'.");
            } else {

                $isValid = checkIfValidAccessToken($access_token);

                if (!$isValid) {
                    $responsedata = array(
                        'status'      => "failed",
                        'description' => "Invalid access token."
                    );
                    $em = new exceptionMgr(" ");
                    $em->logInfo("tracknotificationopen: Invalid access token.");
                } else {

                    $childid = getChildIdByAccessToken($access_token);

                    if (!$childid) {
                        $responsedata = array(
                            'status'      => "failed",
                            'description' => "Could not resolve child from access token."
                        );
                        $em = new exceptionMgr(" ");
                        $em->logInfo("tracknotificationopen: Could not resolve child from access token.");
                    } else {

                        markNotificationOpened($childid, $notification_type);

                        $responsedata = array(
                            'status'      => "success",
                            'description' => "Notification open tracked."
                        );
                        $em = new exceptionMgr(" ");
                        $em->logInfo("tracknotificationopen: child=$childid type=$notification_type");
                    }
                }
            }
        } else {
            $responsedata = array(
                'status'      => "failed",
                'description' => "Input parameters missing."
            );
            $em = new exceptionMgr(" ");
            $em->logInfo("tracknotificationopen: Input parameters missing.");
        }
    } else {
        $responsedata = array(
            'status'      => "failed",
            'description' => "Received no input JSON data."
        );
        $em = new exceptionMgr(" ");
        $em->logInfo("tracknotificationopen: Received no input JSON data.");
    }

    header('Content-type: application/json');
    echo json_encode($responsedata);

?>
