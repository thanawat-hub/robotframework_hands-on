#*** Comments ***
#This whole section is treated as comments as a Multiple lines
#url https://demo-login-workshop.vercel.app/
#demo
#pass:mode

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://demo-login-workshop.vercel.app/
${BROWSER}    chrome


*** Test Cases ***
# มองว่ามันคือ test scenarios คือคนมาทำต่อ ต้องเข้าใจ business process ให้คำอธิบายเสมอว่าจะทำอะไร
ล็อกอินเข้าสู่ระบบสำเร็จ
    เข้าหน้าเว็บไซต์(Vercle)
    กรอกข้อมูลล็อกอิน    demo    mode
    ตรวจสอบผลลัพธ์การล็อกอิน    Login succeeded

#กรณี เป็น flow เดียวกัน ไม่จำเป็นต้องแยกไฟล์ ต่อให้เป็น alternative ก็ตาม (ต่างคนต่างมี keyword ใช้ไม่เหมือนกัน ถ้ารีบแยกจะงงได้)
ล็อกอินเข้าสู่ระบบไม่สำเร็จกรณีกรอก Username ผิด
    เข้าหน้าเว็บไซต์(Vercle)
#    กรอกข้อมูลล็อกอินกรณีกรอก Username ผิด    wrong_user    mode
    กรอกข้อมูลล็อกอิน    wrong_user    mode
    ตรวจสอบผลลัพธ์การล็อกอิน    Login failed

ล็อกอินเข้าสู่ระบบไม่สำเร็จกรณีกรอก Password ผิด
    เข้าหน้าเว็บไซต์(Vercle)
#    กรอกข้อมูลล็อกอินกรณีกรอก Password ผิด    demo    wrong_pass
    กรอกข้อมูลล็อกอิน    demo    wrong_pass
    ตรวจสอบผลลัพธ์การล็อกอิน    Login failed

กรณีกรอก Username และ Password ผิด
    เข้าหน้าเว็บไซต์(Vercle)
#    กรอกข้อมูลล็อกอินกรณีกรอก Username และ Password ผิด     wrong_user    wrong_pass
    กรอกข้อมูลล็อกอิน    wrong_user    wrong_pass
    ตรวจสอบผลลัพธ์การล็อกอิน    Login failed


*** Keywords ***
เข้าหน้าเว็บไซต์(Vercle)
    Open Browser             url=${URL}      browser=${BROWSER}
    Title Should Be          title=Login Page

#กรอกข้อมูลล็อกอินถูกต้อง
#กรอกข้อมูลล็อกอินไม่ถูกต้องแต่ละแบบ
กรอกข้อมูลล็อกอิน
    [Arguments]              ${username}    ${password}
    Input Text               id=username_field    text=${username}    clear=True
    Input Text               id=password_field    text=${password}    clear=True
    Press Keys               id=login_button    RETURN

#ล็อกอินสำเร็จ
#ล็อกอินไม่สำเร็จ
ตรวจสอบผลลัพธ์การล็อกอิน
    [Arguments]              ${expected}
    Element Should Contain   id=container   expected=${expected}



# ต่างกันแค่เทสต์ดาต้า หรือ value ใน robot เรียกว่า arguments
# 2 ต่อมา ดูว่ามีอะไรซ้ำกันอีก นั้นก็คือ ก็ได้ ตามไฟล์นี้ขอใช้ชื่อว่า flow หละกัน
# 3 ต่อมา เมื่อเราสร้าง ซ้ำใน keyword ได้ แล้วทำไมใน Test cases จะทำไม่ได้ ? มองว่าเป็น functional