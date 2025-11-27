*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
# มองว่ามันคือ test scenarios คือคนมาทำต่อ ต้องเข้าใจ business process
# [Act & Assert -> ใน robot ทำ arrange ไม่ได้ => แปลว่า อะไรที่มีการ ตรวจสอบค่าจาก db โดยมีการเปลี่ยนแปลงค่าที่ตรวจสอบ จะรันรอบ 2 ไม่ได้]
ค้นหาร้านอาหาร ชื่อว่า เท็นชิโนะ และตรวจสอบลิงก์ว่าพบ ร้านอาหารคือ เท็นชิโนะ
    เข้าหน้าเว็บ และใส่คำค้นหา
    #Open Browser             url=https://www.google.com      browser=googlechrome
    #Input Text               id=APjFqb  text=ร้านอาหารญี่ปุ่นใกล้ฉัน  clear=True
    #Press Keys               id=APjFqb  RETURN
    ตรวจสอบผลลัพธ์การค้นหา
    #Element Text Should Be   id=APjFqb  ร้านอาหารญี่ปุ่นใกล้ฉัน
    #Page Should Contain      text=เท็นชิโนะ
    #Page Should Contain Link [TBD]


*** Keywords ***
เข้าหน้าเว็บ และใส่คำค้นหา
    Open Browser             url=https://www.google.com      browser=googlechrome
    Input Text               id=APjFqb  text=ร้านอาหารญี่ปุ่นใกล้ฉัน  clear=True
    Press Keys               id=APjFqb  RETURN

ตรวจสอบผลลัพธ์การค้นหา
    Element Text Should Be   id=APjFqb  ร้านอาหารญี่ปุ่นใกล้ฉัน
    Page Should Contain      text=เท็นชิโนะ
    Page Should Contain Link [TBD]


*** Comments ***
This whole section is treated as comments as a Multiple lines
- สิ่งที่ต้องรู้
    - ใน Keyword เราจะใส่ business process (ขั้นตอนการทำงาน) เป็นหัวข้อๆ