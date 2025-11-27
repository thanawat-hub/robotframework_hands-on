#step 1 เริ่มที่เขียน test case ก่อน แล้วค่อย map รวมเป็น keyword ทีหลัง
#step 2 search Wait Until Element Is Visible ที่ตัวไหนที่จะเป็นตัวสุดท้าย และทำการรอที่ตัวนั้น (มี wait แปลว่า ต้องมี action จาก user ที่ทำให้ระบบเกิดการเปลี่ยนแปลง)

*** Settings ***
Library     SeleniumLibrary
Test Timeout       3 seconds
# https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#timeouts

#Resource    sck-af.resource
Test Teardown    ล้างแอพให้กลับสู่สถานะเริ่มต้น


*** Variables ***
#กำหนดตัวแปรตรงนี้เรียกว่าเป็น Suite Scope (ใช้ได้ทุก Test Case ในไฟล์นั้น) -> global variable
${URL_SCK}      http://sck-dojo.ddns.net:8000/product/list
${BROWSER}      chrome
# สร้างตัวแปร ใน Variables ตอนไหนดี
    # 1) เพื่อ รันผ่าน cil ให้เปลี่ยน url จาก dev เป็น sit


# การเขียน robot คือการที่เราต้องการเล่าเรื่องว่า user ทำอะไรบ้าง (test scenarios) ใน *** Test Cases *** => ไม่ควรเขียนโดนมองในมุม UI อย่างเดียว
*** Test Cases ***
ลูกค้าเปิดเว็บไซต์ SCK-Shopping Mall และใส่คำค้นหา Balance
    Open Browser    url=${URL_SCK}    browser=${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id=search-product-input    error=ไม่พบช่องค้นหา สินค้าในหน้า SCK Shopping
    Input Text    id=search-product-input    text=Balance
    Press Keys    id=search-product-input    ENTER
    Log    ใส่คำค้นหาในช่องค้นหา สินค้าและกด Enter เพื่อค้นหา

#Test Local Variable
#    [Documentation]     การดูค่าใน log ต้องแตกออกมาดูในสุดของ html -> notion ref1
#    Set Local Variable    ${my_secret}    1234567
#    Log    ฉันเห็นความลับ: ${my_secret}

ตรวจสอบผลลัพธ์การค้นหาสินค้า Balance
    [Documentation]
    # รอให้มีสินค้าอย่างน้อย 1 ชิ้นก่อน
    Wait Until Element Is Visible    xpath=//*[starts-with(@id, 'product-card-name-')]

    # ส่ง Logic การหาค่า Max ไปรันใน Browser โดยตรง
    ${max_id_number}=    Execute Javascript    return Math.max(...Array.from(document.querySelectorAll("[id^='product-card-name-']")).map(e => parseInt(e.id.replace('product-card-name-', ''))));
    # ได้ตัวเลขมา set เพื่อนำไปใช้ต่อใน ส่วนนี้
    Set Local Variable    ${target_locator_to_wait}    id=product-card-name-${max_id_number}

    Log    Browser บอกมาว่า ID ล่าสุดคือ: ${max_id_number}    level=DEBUG

    # รอให้ตัวสุดท้าย ของสินค้าโหลดขึ้นมาให้เสร็จ
    Wait Until Element Is Visible    ${target_locator_to_wait}    error=ไม่พบสินค้าที่ค้นหาในหน้า SCK Shopping
    Element Text Should Be    id=product-card-name-1    expected=Balance Training Bicycle    message=None    ignore_case=False
    Log    message=พบสินค้าที่ค้นหาชื่อ Balance Training Bicycle ในหน้า SCK Shopping    level=INFO


*** Keywords ***
