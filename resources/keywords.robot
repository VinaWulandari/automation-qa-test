*** Settings ***
Library    AppiumLibrary
Resource   variables.robot

*** Keywords ***
Open My App
    Open Application    ${APPIUM_URL}
    ...    platformName=${PLATFORM}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    automationName=UiAutomator2
    ...    noReset=false
    ...    fullReset=false
    ...    forceAppLaunch=true
    ...    shouldTerminateApp=true
    ...    autoGrantPermissions=true
    ...    newCommandTimeout=120
    ...    uiautomator2ServerLaunchTimeout=120000
    ...    uiautomator2ServerInstallTimeout=120000
    ...    adbExecTimeout=120000
    Sleep    3s
    Capture Page Screenshot

Close My App
    [Documentation]    Menutup koneksi Appium setelah test selesai
    Close Application

Navigate To Login Page
    [Documentation]    Membuka menu dan masuk ke halaman Login
    # Click menu di pojok kiri atas
    Click Element
    ...    xpath=//android.view.ViewGroup[@content-desc="open menu"]/android.widget.ImageView
    # Tunggu menu item "Log In" muncul
    Wait Until Element Is Visible
    ...    xpath=//android.view.ViewGroup[@content-desc="menu item log in"]
    ...    ${TIMEOUT}
    # Click menu item "Log In"
    Click Element
    ...    xpath=//android.view.ViewGroup[@content-desc="menu item log in"]

Input Login Credentials
    [Documentation]    Mengisi username dan password di form login
    [Arguments]    ${username}    ${password}
    # Tunggu field username muncul dulu sebelum diisi
    Wait Until Element Is Visible
    ...    xpath=//android.widget.EditText[@content-desc="Username input field"]
    ...    ${TIMEOUT}
    # Isi username
    Input Text
    ...    xpath=//android.widget.EditText[@content-desc="Username input field"]
    ...    ${username}
    # Isi password
    Input Text
    ...    xpath=//android.widget.EditText[@content-desc="Password input field"]
    ...    ${password}

Tap Login Button
    [Documentation]    Menekan tombol Login
    Click Element
    ...    xpath=//android.view.ViewGroup[@content-desc="Login button"]

Logout from aplication
    [Documentation]    Melakukan logout dari aplikasi
    # Buka menu
    Click Element
    ...    xpath=//android.view.ViewGroup[@content-desc="open menu"]/android.widget.ImageView
    # Tunggu menu item "Log Out" muncul
    Wait Until Element Is Visible
    ...    xpath=//android.view.ViewGroup[@content-desc="menu item log out"]
    ...    ${TIMEOUT}
    # Tap Log Out
    Click Element
    ...    xpath=//android.view.ViewGroup[@content-desc="menu item log out"]

User Should Be Logged In
    [Documentation]    Verifikasi user berhasil login tampil halaman products
    Wait Until Element Is Visible
    ...    xpath=//android.widget.TextView[@text="Products"]
    ...    ${TIMEOUT}

Login Should Show Error Message
    [Documentation]    Verifikasi pesan error muncul saat login gagal
    Wait Until Element Is Visible
    ...    xpath=//android.widget.TextView[@text="Provided credentials do not match any user in this service."]
    ...    ${TIMEOUT}

User Should Be Logged Out
    [Documentation]    Verifikasi user sudah ter-logout 
    Wait Until Element Is Visible
    ...    xpath=//android.widget.FrameLayout[@resource-id="android:id/contentPanel"]
    ...    ${TIMEOUT}
    Click Element
    ...    xpath=//android.widget.Button[@resource-id="android:id/button1"]
    Click Element
    ...    xpath=//android.widget.Button[@text="OK" and @resource-id="android:id/button1"]

Checkout Item
    [Documentation]    Checkout Item
    Click Element
    ...    xpath=//android.view.ViewGroup[@content-desc="open menu"]/android.widget.ImageView
    Wait Until Element Is Visible
    ...    xpath=//android.view.ViewGroup[@content-desc="menu item catalog"]
    ...    ${TIMEOUT}
    Click Element
    ...    xpath=//android.view.ViewGroup[@content-desc="menu item catalog"]
    Wait Until Element Is Visible
    ...    xpath=//android.widget.TextView[@content-desc="store item text" and @text="Sauce Labs Backpack"]
    ...    ${TIMEOUT}
    Click Element
    ...    xpath=//android.widget.TextView[@content-desc="store item text" and @text="Sauce Labs Backpack"]
    Wait Until Element Is Visible
    ...    xpath=//android.widget.TextView[@text="Add To Cart"]
    ...    ${TIMEOUT}
    Click Element
    ...    xpath=//android.widget.TextView[@text="Add To Cart"]
    Click Element
    ...    xpath=//android.view.ViewGroup[@content-desc="cart badge"]/android.widget.ImageView
    Wait Until Element Is Visible
    ...    xpath=//android.widget.TextView[@text="Proceed To Checkout"]
    ...    ${TIMEOUT}
    Click Element
    ...    xpath=//android.widget.TextView[@text="Proceed To Checkout"]