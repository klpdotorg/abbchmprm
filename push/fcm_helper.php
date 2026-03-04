<?php

/**
 * FCM Helper
 * Sends push notifications via Firebase Cloud Messaging (HTTP v1 API).
 *
 * Uses Service Account credentials for OAuth 2.0 authentication.
 * Service Account JSON: Firebase Console > Project Settings > Service Accounts > Generate new private key
 */

class fcm_helper {

    private $service_account_json_path;
    private $project_id;
    private $access_token;
    private $token_expiry;

    function __construct($service_account_json_path, $project_id) {
        $this->service_account_json_path = $service_account_json_path;
        $this->project_id = $project_id;
        $this->access_token = null;
        $this->token_expiry = 0;
    }

    /**
     * Get OAuth 2.0 access token using service account credentials
     * @return string|false Access token or false on error
     */
    private function getAccessToken() {
        // Return cached token if still valid
        if ($this->access_token && time() < $this->token_expiry) {
            return $this->access_token;
        }

        // Load service account JSON
        if (!file_exists($this->service_account_json_path)) {
            return false;
        }

        $service_account = json_decode(file_get_contents($this->service_account_json_path), true);
        if (!$service_account) {
            return false;
        }

        // Create JWT for OAuth 2.0
        $now = time();
        $expiry = $now + 3600; // 1 hour

        $header = json_encode([
            'alg' => 'RS256',
            'typ' => 'JWT'
        ]);

        $payload = json_encode([
            'iss'   => $service_account['client_email'],
            'scope' => 'https://www.googleapis.com/auth/firebase.messaging',
            'aud'   => 'https://oauth2.googleapis.com/token',
            'exp'   => $expiry,
            'iat'   => $now
        ]);

        // Encode header and payload
        $header_encoded = rtrim(strtr(base64_encode($header), '+/', '-_'), '=');
        $payload_encoded = rtrim(strtr(base64_encode($payload), '+/', '-_'), '=');
        $signature_input = $header_encoded . '.' . $payload_encoded;

        // Sign with private key
        $private_key = $service_account['private_key'];
        openssl_sign($signature_input, $signature, $private_key, 'sha256');
        $signature_encoded = rtrim(strtr(base64_encode($signature), '+/', '-_'), '=');

        $jwt = $signature_input . '.' . $signature_encoded;

        // Exchange JWT for access token
        $url = 'https://oauth2.googleapis.com/token';
        $post_data = http_build_query([
            'grant_type' => 'urn:ietf:params:oauth:grant-type:jwt-bearer',
            'assertion'  => $jwt
        ]);

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);

        $result = curl_exec($ch);
        curl_close($ch);

        $response = json_decode($result, true);

        if (isset($response['access_token'])) {
            $this->access_token = $response['access_token'];
            $this->token_expiry = $now + $response['expires_in'] - 60; // Refresh 60 seconds early
            return $this->access_token;
        }

        return false;
    }

    /**
     * Send a push notification to a single device using FCM v1 API.
     *
     * @param string $fcm_token  - FCM registration token of the target device
     * @param string $title      - Notification title
     * @param string $body       - Notification body
     * @param array  $data       - Optional key/value data payload for the app
     * @return array ['success' => bool, 'response' => array|null, 'error' => string|null]
     */
    function sendPushNotification($fcm_token, $title, $body, $data = array()) {

        // Get access token
        $access_token = $this->getAccessToken();
        if (!$access_token) {
            return array('success' => false, 'response' => null, 'error' => 'Failed to obtain access token');
        }

        // v1 API endpoint
        $url = 'https://fcm.googleapis.com/v1/projects/' . $this->project_id . '/messages:send';

        // Build the message in v1 format
        $message = array(
            'token' => $fcm_token,
            'notification' => array(
                'title' => $title,
                'body'  => $body
            )
        );

        // Add data payload if provided
        if (!empty($data)) {
            $message['data'] = $data;
        }

        $payload = array(
            'message' => $message
        );

        $headers = array(
            'Authorization: Bearer ' . $access_token,
            'Content-Type: application/json'
        );

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);

        $result = curl_exec($ch);
        $curl_err = curl_error($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($curl_err) {
            return array('success' => false, 'response' => null, 'error' => $curl_err);
        }

        $response = json_decode($result, true);

        // v1 API returns 200 on success with a 'name' field in response
        if ($http_code === 200 && isset($response['name'])) {
            return array('success' => true, 'response' => $response, 'error' => null);
        } else {
            $error_msg = isset($response['error']['message']) ? $response['error']['message'] : 'FCM error (HTTP ' . $http_code . ')';
            return array('success' => false, 'response' => $response, 'error' => $error_msg);
        }
    }
}
?>
