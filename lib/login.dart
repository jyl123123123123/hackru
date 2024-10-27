import 'dart:io';

void main() {
  // Create a map to store username and password
  Map<String, String> users = {};

  // Main menu
  while (true) {
    print('Welcome! Please choose an option:');
    print('1. Create User');
    print('2. Login');
    print('3. Exit');

    String? choice = stdin.readLineSync();

    if (choice == '1') {
      // Create user
      createUser(users);
    } else if (choice == '2') {
      // Login
      login(users);
    } else if (choice == '3') {
      print('Exiting...');
      break;
    } else {
      print('Invalid option. Please try again.');
    }
  }
}

// Function to create a new user
void createUser(Map<String, String> users) {
  print('Enter a username:');
  String? username = stdin.readLineSync();

  if (username == null || users.containsKey(username)) {
    print('Username is invalid or already exists. Please try again.');
    return;
  }

  print('Enter a password:');
  String? password = stdin.readLineSync();

  if (password == null || password.isEmpty) {
    print('Password cannot be empty. Please try again.');
    return;
  }

  // Store the username and password
  users[username] = password;
  print('User created successfully!');
}

// Function to login
void login(Map<String, String> users) {
  print('Enter your username:');
  String? username = stdin.readLineSync();

  if (!users.containsKey(username)) {
    print('Username does not exist. Please try again.');
    return;
  }

  print('Enter your password:');
  String? password = stdin.readLineSync();

  // Check if the password matches
  if (users[username] == password) {
    print('Login successful! Welcome, $username.');
  } else {
    print('Incorrect password. Please try again.');
  }
}