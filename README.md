TodolistApp

TodolistApp is a simple mobile application built using Flutter, allowing users to manage their tasks efficiently. It includes functionalities like adding new tasks, viewing task details, and managing task completion.
Features

    Home Screen: Displays a list of tasks with their completion status.
    Add Task Screen: Allows users to add a new task with optional location and image attachment.
    Task Details Screen: Shows the details of a selected task, including location and image if available.
    Edit Task: Users can edit existing tasks.
    Task Deletion: Users can delete tasks by pressing a delete button.
    Gradient Background: A gradient background of purple has been applied across all screens for a unified UI.

Screens

    Home Screen: View all tasks, add new tasks, and navigate to task details.
    Add Task Screen: Add new tasks with a description, location (automatically fetched), and optional image.
    Task Details Screen: View task details, and edit or delete tasks.

Permissions

Ensure the app has permissions for accessing location and files (for attaching images). These are required for:

    Fetching user location.
    Accessing images from the gallery.

Update your AndroidManifest.xml and Info.plist for iOS with the necessary permissions:

Android (AndroidManifest.xml):

xml

<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>

iOS (Info.plist):

xml

<key>NSLocationWhenInUseUsageDescription</key>
<string>Your app needs access to your location.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Your app needs access to your photos.</string>

Folder Structure

lib/
 ├── models/
 │    ├── task.dart           # Task model
 │    └── task_data.dart      # Task data provider (state management)
 ├── screens/
 │    ├── add_task_screen.dart    # Screen for adding tasks
 │    ├── edit_task_screen.dart   # Screen for editing tasks
 │    ├── task_details_screen.dart # Task details view
 │    └── task_screen.dart        # Main screen listing all tasks
 ├── widgets/
 │    ├── task_tile.dart        # Widget for individual task items
 └── main.dart               # Main entry point of the app

Dependencies

This project uses the following Flutter packages:

    provider: For state management.
    geolocator: To get the user's location.
    image_picker: To allow image attachments from the gallery.
    uuid: To generate unique task IDs.
