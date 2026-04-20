*** Settings ***
Resource          ../resources/keywords.robot
Suite Setup       Open My App
Suite Teardown    Close My App

*** Test Cases ***

TC-LOGIN-POS-01 Successful Login With Valid Credentials
    [Documentation]    Verify user can login with valid username and password
    [Tags]             positive    
    Navigate To Login Page
    Input Login Credentials    ${VALID_USER}    ${VALID_PASS}
    Tap Login Button
    User Should Be Logged In
    # Tambahan: Logout setelah login berhasil dapat lanjut ke skenario berikutnya, jika skenario dijalankan per file
    Logout from aplication

TC-LOGIN-NEG-01 Login Failed With Wrong Password
    [Documentation]    Verify system shows error when wrong password is entered
    [Tags]             negative
    Navigate To Login Page
    Input Login Credentials    ${VALID_USER}    wrongpassword
    Tap Login Button
    Login Should Show Error Message