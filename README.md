# intent_launcher

A simple app for launching Intents of any Android app that's browsable and has set `exported="true"` in it's manifest.

Useful for pentesting apps.

## Run

`flutter run -d <YOU ANDROID DEVICE>`

## Install

You can find a release apk in the **releases** section

---

## Limitations

I haven't yet found a way to bypass the Permission Denial exception that gets thrown when trying to launch a WebView within another app