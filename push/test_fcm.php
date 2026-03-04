<?php
/**
 * Test FCM Notification
 * Run from command line: php push/test_fcm.php
 */

// Bootstrap the app similar to cron
session_start();

$appbasedir = realpath(dirname(__FILE__) . '/..');
$_SESSION['ABSAPP_BASE_DIR']       = $appbasedir;
$_SESSION['ABSAPP_CONFIG_FILE']    = $appbasedir . '/config/appconfig.php';
$_SESSION['ABSAPP_DB_CONFIG_FILE'] = $appbasedir . '/config/dbconfig.php';

require_once($appbasedir . '/app/boot/checksandincludes.php');
require_once($appbasedir . '/push/fcm_helper.php');

global $cfg_fcm_service_account_json_path, $cfg_fcm_project_id;

$fcm = new fcm_helper($cfg_fcm_service_account_json_path, $cfg_fcm_project_id);

// ================================================================
// Test 1: Send a simple notification
// Replace with an actual FCM token from a device
// ================================================================

$test_fcm_token = 'crJO1sMtSvCi2kiALxy2fe:APA91bENJoxTNEX6Eu3mQPi5swl0VfxLWC6jwFg8TnIkbasgtp5VqyLT3iltCydQCv3YP6uZn91uvfLwenoLYKR7OvSOYT8D_uTFqR2MJMTCAiUeh3GclHs';

if ($test_fcm_token === 'YOUR_DEVICE_FCM_TOKEN_HERE') {
    echo "❌ ERROR: Please replace 'YOUR_DEVICE_FCM_TOKEN_HERE' with an actual FCM token from a device\n\n";
    echo "How to get FCM token from your app:\n";
    echo "- In Android: FirebaseMessaging.getInstance().getToken()\n";
    echo "- In React Native: messaging().getToken()\n";
    echo "- In Web: firebase.messaging().getToken()\n\n";
    exit(1);
}

echo "Sending test notification to FCM token: " . substr($test_fcm_token, 0, 20) . "...\n\n";

// Send notification
$result = $fcm->sendPushNotification(
    $test_fcm_token,
    'Test Notification',
    'This is a test notification from your PHP backend!',
    array(
        'action' => 'test',
        'timestamp' => date('Y-m-d H:i:s'),
        'environment' => 'development'
    )
);

// Display result
if ($result['success']) {
    echo "✅ SUCCESS! Notification sent\n\n";
    echo "Response: " . json_encode($result['response'], JSON_PRETTY_PRINT) . "\n";
} else {
    echo "❌ FAILED! Error: " . $result['error'] . "\n\n";
    if ($result['response']) {
        echo "Response: " . json_encode($result['response'], JSON_PRETTY_PRINT) . "\n";
    }
    exit(1);
}
?>
