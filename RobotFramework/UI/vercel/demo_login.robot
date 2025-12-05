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
    กรอกข้อมูลล็อกอินถูกต้อง
    ตรวจสอบผลลัพธ์การล็อกอินสำเร็จ

#กรณี เป็น flow เดียวกัน ไม่จำเป็นต้องแยกไฟล์ ต่อให้เป็น alternative ก็ตาม (ต่างคนต่างมี keyword ใช้ไม่เหมือนกัน ถ้ารีบแยกจะงงได้)
ล็อกอินเข้าสู่ระบบไม่สำเร็จกรณีกรอก Username ผิด
    เข้าหน้าเว็บไซต์(Vercle)
    กรอกข้อมูลล็อกอินกรณีกรอก Username ผิด
    ตรวจสอบผลลัพธ์การล็อกอินไม่สำเร็จ

ล็อกอินเข้าสู่ระบบไม่สำเร็จกรณีกรอก Password ผิด
    เข้าหน้าเว็บไซต์(Vercle)
    กรอกข้อมูลล็อกอินกรณีกรอก Password ผิด
    ตรวจสอบผลลัพธ์การล็อกอินไม่สำเร็จ

กรณีกรอก Username และ Password ผิด
    เข้าหน้าเว็บไซต์(Vercle)
    กรอกข้อมูลล็อกอินกรณีกรอก Username และ Password ผิด
    ตรวจสอบผลลัพธ์การล็อกอินไม่สำเร็จ


*** Keywords ***
เข้าหน้าเว็บไซต์(Vercle)
    Open Browser             url=${URL}      browser=${BROWSER}
    Title Should Be          title=Login Page

กรอกข้อมูลล็อกอินถูกต้อง
    Input Text               id=username_field  text=demo    clear=True
    Input Text               id=password_field  text=mode    clear=True
    Press Keys               id=login_button

ตรวจสอบผลลัพธ์การล็อกอินสำเร็จ
    Element Sholud Contain   id=container   expected=Login succeeded


ตรวจสอบผลลัพธ์การล็อกอินไม่สำเร็จ
    Element Sholud Contain   id=container   expected=Login failed

กรอกข้อมูลล็อกอินกรณีกรอก Username ผิด
    Input Text               id=username_field  text=wrong_user    clear=True
    Input Text               id=password_field  text=mode    clear=True
    Press Keys               id=login_button

กรอกข้อมูลล็อกอินกรณีกรอก Password ผิด
    Input Text               id=username_field  text=demo    clear=True
    Input Text               id=password_field  text=wrong_pass    clear=True
    Press Keys               id=login_button


กรอกข้อมูลล็อกอินกรณีกรอก Username และ Password ผิด
    Input Text               id=username_field  text=wrong_user    clear=True
    Input Text               id=password_field  text=wrong_pass    clear=True
    Press Keys               id=login_button

# ต่างกันแค่เทสต์ดาต้า หรือ value ใน robot เรียกว่า arguments