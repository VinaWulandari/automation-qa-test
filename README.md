# Document Title:
  QA Automation Test Documentation — Login & Logout
# Project Name:
  Mobile App Test Automation Assignment
# Application:
  Sauce Labs Demo App (Android)
# Framework:
  Robot Framework + AppiumLibrary
# Device:
  Android Physical Device
# OS:
  Android (Physical Device)


==============================================================================================================================
Run Tests:
# Step 1: Start Appium Server (CMD 1)
appium

# Step 2: Run all tests (CMD 2)
robot -d reports tests/

# Run login test only
robot -d reports tests/login_test.robot

# Run logout test only
robot -d reports tests/logout_test.robot

# Run by tag
robot -d reports -i positive tests/
robot -d reports -i negative tests/
