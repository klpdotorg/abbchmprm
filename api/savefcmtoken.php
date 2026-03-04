<?php

/**
 * Service API: savefcmtoken
 * File name: savefcmtoken.php
 *
 * Called by the Cordova app whenever it receives a new FCM token.
 * Must be called on every app launch (tokens can rotate).
 *
 * JSON Payload:
 * {
 *   "access_token": "<token from login/register>",
 *   "fcm_token":    "<FCM device token from Firebase>"
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

    $jsonstring = file_get_contents("php://input");
    $data       = json_decode($jsonstring);

    if ($data) {

        $access_token = $data->{'access_token'};
        $fcm_token    = $data->{'fcm_token'};

        if ($access_token && $fcm_token) {

            $isValid = checkIfValidAccessToken($access_token);

            if (!$isValid) {
                $responsedata = array(
                    'status'      => "failed",
                    'description' => "Invalid access token."
                );
                $em = new exceptionMgr(" ");
                $em->logInfo("savefcmtoken: Invalid access token.");
            } else {

                $childid = getChildIdByAccessToken($access_token);

                if (!$childid) {
                    $responsedata = array(
                        'status'      => "failed",
                        'description' => "Could not resolve child from access token."
                    );
                    $em = new exceptionMgr(" ");
                    $em->logInfo("savefcmtoken: Could not resolve child from access token.");
                } else {

                    $rtn = saveFcmToken($childid, $fcm_token);

                    if ($rtn) {
                        $responsedata = array(
                            'status'      => "success",
                            'description' => "FCM token saved."
                        );
                    } else {
                        $responsedata = array(
                            'status'      => "failed",
                            'description' => "Failed to save FCM token."
                        );
                        $em = new exceptionMgr(" ");
                        $em->logInfo("savefcmtoken: Failed to save FCM token for child $childid.");
                    }
                }
            }
        } else {
            $responsedata = array(
                'status'      => "failed",
                'description' => "Input parameters missing."
            );
            $em = new exceptionMgr(" ");
            $em->logInfo("savefcmtoken: Input parameters missing.");
        }
    } else {
        $responsedata = array(
            'status'      => "failed",
            'description' => "Received no input JSON data."
        );
        $em = new exceptionMgr(" ");
        $em->logInfo("savefcmtoken: Received no input JSON data.");
    }

    header('Content-type: application/json');
    echo json_encode($responsedata);

?>
