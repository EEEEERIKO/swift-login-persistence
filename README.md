# Swift Login Persistence

A practical iOS project built with **Swift and UIKit** to learn how to persist a simple login session using `UserDefaults`.

## Overview

This project implements a basic login persistence system that stores a user's email address and login status locally. When the application launches, it checks the saved session and navigates to the appropriate screen.

The project focuses on local persistence, basic email validation, and navigation between view controllers.

## Features

- **Email validation:** Checks the email format before allowing login.
- **Session persistence:** Stores the user's email and `isLoggedIn` flag using `UserDefaults`.
- **Automatic navigation:** Opens the Home screen when a valid session is already stored.
- **Session retrieval:** Loads the saved email to display the current user.
- **Logout functionality:** Removes the stored email and login status.
- **Separation of responsibilities:** Uses a dedicated service to manage session persistence.

## Technologies

- Swift
- UIKit
- Storyboard
- UserDefaults
- Auto Layout
- Xcode

## Project Structure

```text
SwiftLoginPersistence/
├── Models/
│   └── UserSession.swift
├── Services/
│   └── SessionManager.swift
├── ViewControllers/
│   ├── LoginViewController.swift
│   └── HomeViewController.swift
├── AppDelegate.swift
├── SceneDelegate.swift
├── Main.storyboard
└── README.md
```

## Architecture

### UserSession

Represents the user's session with two properties:

- `email`: The email address associated with the session.
- `isLoggedIn`: Indicates whether the session is active.

### SessionManager

Encapsulates the `UserDefaults` operations.

Its responsibilities include:

- Saving the user's email and login status.
- Retrieving the current session.
- Checking whether a user is logged in.
- Removing stored session values during logout.

### LoginViewController

Manages the login interface and validates the email format before saving the session.

After a successful validation, it stores the session and navigates to the Home screen.

### HomeViewController

Displays the saved email address and provides a logout action. Logging out clears the stored session and returns the user to the Login screen.

### SceneDelegate

Checks the stored login status during application startup and selects the initial screen accordingly.

## How It Works

1. The application launches and checks `isLoggedIn`.
2. If a session is active, the Home screen is displayed.
3. Otherwise, the Login screen is displayed.
4. The user enters an email address that passes the format validation.
5. The application saves the email and sets `isLoggedIn` to `true`.
6. The Home screen displays the saved email.
7. When the user logs out, the application removes both stored values.

## Key Concepts Learned

- Persisting simple values with `UserDefaults`.
- Working with Swift structs and optional values.
- Encapsulating persistence logic in a service.
- Performing basic email format validation.
- Connecting Storyboard outlets and actions.
- Managing UIKit navigation with `UINavigationController`.
- Selecting an initial screen based on persisted application state.

## Security Considerations

**This project demonstrates session persistence, not production authentication.**

The application does not verify user identity against a backend or authenticate credentials. Any email that passes the local format validation can start a session.

`UserDefaults` is suitable for simple, non-sensitive preferences and exercise-level session flags. It should not be used to store passwords, authentication tokens, or other sensitive credentials.

A production login system should use a trusted authentication service, secure token handling, and appropriate session expiration and revocation mechanisms.

## Requirements

- macOS
- Xcode
- An iOS Simulator or compatible iOS device

## Getting Started

1. Clone this repository.
2. Open the `.xcodeproj` file in Xcode.
3. Select an iOS Simulator or connected device.
4. Build and run the application.
5. Enter a valid-format email address and tap **Log In**.
6. Stop and relaunch the application to verify session persistence.
7. Tap **Log Out** and relaunch the application to verify that the session has been cleared.

## Purpose

This project is part of my hands-on learning journey in iOS development, focusing on UIKit, local data persistence, session management, and code organization.
