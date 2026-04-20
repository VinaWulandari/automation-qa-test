*** Settings ***
Resource          ../resources/keywords.robot
Suite Setup       Open My App
Suite Teardown    Close My App

*** Test Cases ***

DEBUG - Test Navigate To Login Page
    [Tags]    debug
    # Step 1: Cek app terbuka dengan screenshot dulu
    Capture Page Screenshot
    # Step 2: Coba navigate ke login
    Navigate To Login Page
    # Step 3: Screenshot setelah navigate
    Capture Page Screenshot