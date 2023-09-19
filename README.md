# intent_launcher

A simple app for launching Intents of any Android app that's browsable and has set `exported="true"` in it's manifest.

Useful for pentesting apps.

<img width=300 src=https://github.com/ivaneidel/intent_launcher/assets/9538260/63e9d08d-a6c3-435c-b586-26176788cf50 />
<img width=300 src=https://github.com/ivaneidel/intent_launcher/assets/9538260/df559ec7-9755-40c0-a85d-d4d4f023675b />

## Run

`flutter run -d <YOU ANDROID DEVICE>`

## Install

You can find a release apk in the **releases** section

---

## Limitations

I haven't yet found a way to bypass the Permission Denial exception that gets thrown when trying to launch a WebView within another app
