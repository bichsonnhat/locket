use reqwest::Client;
use serde_json::{json, Value};
use anyhow::{Result, anyhow};

struct User {
    email: String,
    password: String,
    token: String,
}

impl User {
    async fn login(&mut self) ->  Result<Value, reqwest::Error> {
        let client = Client::new();

        let request_data = json!({
            "email": self.email,
            "password": self.password,
            "clientType": "CLIENT_TYPE_IOS",
            "returnSecureToken": true
        });

        let url = "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyCQngaaXQIfJaH0aS2l7REgIjD7nL431So";
        let mut headers = reqwest::header::HeaderMap::new();
        headers.insert("Accept", "*/*".parse().unwrap());
        headers.insert("Accept-Encoding", "gzip, deflate, br".parse().unwrap());
        headers.insert("Accept-Language", "en".parse().unwrap());
        headers.insert("baggage", "sentry-environment=production,sentry-public_key=78fa64317f434fd89d9cc728dd168f50,sentry-release=com.locket.Locket@1.82.0+3,sentry-trace_id=90310ccc8ddd4d059b83321054b6245b".parse().unwrap());
        headers.insert("Connection", "keep-alive".parse().unwrap());
        headers.insert("Content-Type", "application/json".parse().unwrap());
        headers.insert("Host", "www.googleapis.com".parse().unwrap());
        headers.insert("sentry-trace", "90310ccc8ddd4d059b83321054b6245b-3a4920b34e94401d-0".parse().unwrap());
        headers.insert("User-Agent", "FirebaseAuth.iOS/10.23.1 com.locket.Locket/1.82.0 iPhone/18.0 hw/iPhone12_1".parse().unwrap());
        headers.insert("X-Client-Version", "iOS/FirebaseSDK/10.23.1/FirebaseCore-iOS".parse().unwrap());
        headers.insert("X-Firebase-AppCheck", "eyJraWQiOiJNbjVDS1EiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIxOjY0MTAyOTA3NjA4Mzppb3M6Y2M4ZWI0NjI5MGQ2OWIyMzRmYTYwNiIsImF1ZCI6WyJwcm9qZWN0c1wvNjQxMDI5MDc2MDgzIiwicHJvamVjdHNcL2xvY2tldC00MjUyYSJdLCJwcm92aWRlciI6ImRldmljZV9jaGVja19kZXZpY2VfaWRlbnRpZmljYXRpb24iLCJpc3MiOiJodHRwczpcL1wvZmlyZWJhc2VhcHBjaGVjay5nb29nbGVhcGlzLmNvbVwvNjQxMDI5MDc2MDgzIiwiZXhwIjoxNzIyMTY3ODk4LCJpYXQiOjE3MjIxNjQyOTgsImp0aSI6ImlHUGlsT1dDZGg4Mll3UTJXRC1neEpXeWY5TU9RRFhHcU5OR3AzTjFmRGcifQ.lqTOJfdoYLpZwYeeXtRliCdkVT7HMd7_Lj-d44BNTGuxSYPIa9yVAR4upu3vbZSh9mVHYS8kJGYtMqjP-L6YXsk_qsV_gzKC2IhVAV6KbPDRHdevMfBC6fRiOSVn7vt749GVFdZqAuDCXhCILsaMhvgDBgZoDilgAPtpNwyjz-VtRB7OdOUbuKTCqdoSOX0SJWVUMyuI8nH0-unY--YRctunK8JHZDxBaM_ahVggYPWBCpzxq9Yeq8VSPhadG_tGNaADStYPaeeUkZ7DajwWqH5ze6ESpuFNgAigwPxCM735_ZiPeD7zHYwppQA9uqTWszK9v9OvWtFCsgCEe22O8awbNbuEBTKJpDQ8xvZe8iEYyhfUPncER3S-b1CmuXR7tFCdTgQe5j7NGWjFvN_CnL7D2nudLwxWlpqwASCHvHyi8HBaJ5GpgriTLXAAinY48RukRDBi9HwEzpRecELX05KTD2lTOfQCjKyGpfG2VUHP5Xm36YbA3iqTDoDXWMvV".parse().unwrap());
        headers.insert("X-Firebase-GMPID", "1:641029076083:ios:cc8eb46290d69b234fa606".parse().unwrap());
        headers.insert("X-Ios-Bundle-Identifier", "com.locket.Locket".parse().unwrap());

        let response = client.post(url)
            .headers(headers)
            .json(&request_data)
            .send()
            .await?;

        println!("Hello {:?}", response);

        Ok(Value::Null)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_login() {
        let mut user = User {
            email: "bichsonnhat@gmail.com".to_string(),
            password: "Abc@112345".to_string(),
            token: "".to_string(),
        };
        let token = user.login().await;
        println!("Token: {:?}", token);
    }   
}