# desc file xxx.resource: ใช้เมื่อในโค้ดเราเริ่มโตขึ้น
# ตัวนี้ใช้คู่กับ ..flow_with_keyword
## โดยไปเอาตัว *** Keywords *** มาไว้ที่นี่

*** Keywords ***
Login Steps
    [Arguments]             ${username}    ${password}    ${expected}
    เข้าหน้าเว็บไซต์(Vercle)
    กรอกข้อมูลล็อกอิน    ${username}    ${password}
    ตรวจสอบผลลัพธ์การล็อกอิน    ${expected}

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


