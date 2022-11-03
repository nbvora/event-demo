# Event Demo on Firebase

This project demonstrate all the CRUD functionality using Flutter framework and Firebase cloud.

* Create / insert from firestore
* Retrieve / View from firestore
* Update / Edit from firestore
* Delete / Remove from firestore

## Getting Started

To get started with this project, you should do the following steps:

**Step 1:**

Download or clone this repo by using the link below:

https://github.com/nbvora/event-demo.git

**Step 2:**

Add [firebase](https://firebase.google.com/) in your android project.

**Step 3:**

Sign in/up to firebase

**Step 4:**

Go to console

**Step 5:**

Start a new project

**Step 6:**

Create a Firestore database

**Step 7:**

Change rule for Cloud fireStore:

Security Rules for Cloud fireStore service
```
cloud.firestore { match /databases/{database}/documents { match /{document=**} { allow read, write: if true; } } }
```
**Step 8:**

Download and input google-service.json to the android/app folder(I have put google-service-sample.json file. Remove that file and put this file)

**Step 9:**

After set up firebase install packages using below syntax-:

flutter pub get

**Step 10:**

Run the app using

flutter run

## Libraries & Tools Used

- cloud_firestore: ^4.0.3
- firebase_core: ^2.1.1
- table_calendar: ^3.0.8


## Folder Structure
Here is the core folder structure which flutter provides.
```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

## Here is the folder structure we have been using in this project
```
lib/
|- commons/
|- models/
|- pages/
|- services/
|- utils/
|- widgets/
|- main.dart
```

## Conclusion
I will be happy to answer any questions that you may have on this approach. 🙂

