*** Settings ***
Resource          ../resources/keywords.robot
Suite Setup       Open My App
Suite Teardown    Close My App

*** Test Cases ***

TC-LOGOUT-POS-01 Successful Logout After Login
    [Documentation]    Verifikasi user berhasil logout 
    [Tags]             positive   
    # Login
    Navigate To Login Page
    Input Login Credentials    ${VALID_USER}    ${VALID_PASS}
    Tap Login Button
    User Should Be Logged In
    # Logout
    Logout from aplication
    User Should Be Logged Out

TC-LOGOUT-NEG-01 User Should Login Before Checkout After Logout
    [Documentation]    Verifikasi user harus login untuk bisa checkout setelah logout
    [Tags]             negative    
    # Login 
    Navigate To Login Page
    Input Login Credentials    ${VALID_USER}    ${VALID_PASS}
    Tap Login Button
    User Should Be Logged In
    # Logout
    Logout from aplication
    User Should Be Logged Out
    # Checkout item 
    Checkout Item
    Wait Until Page Contains Element
    ...    xpath=(//android.widget.TextView[@text="Login"])[1]