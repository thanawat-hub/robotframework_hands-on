*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
# มองว่ามันคือ test scenarios คือคนมาทำต่อ ต้องเข้าใจ business process
# [Act & Assert -> ใน robot ทำ arrange ไม่ได้ => แปลว่า อะไรที่มีการ ตรวจสอบค่าจาก db โดยมีการเปลี่ยนแปลงค่าที่ตรวจสอบ จะรันรอบ 2 ไม่ได้]
ค้นหาร้านอาหาร ชื่อว่า เท็นชิโนะ และตรวจสอบลิงก์ว่าพบ ร้านอาหารคือ เท็นชิโนะ
    Open Browser             url=https://www.google.com      browser=googlechrome
    Input Text               id=APjFqb  text=ร้านอาหารญี่ปุ่นใกล้ฉัน  clear=True
    Press Keys               id=APjFqb  RETURN # ทำไมต้อง return ทำไมไม่ใช้ ENTER?
    Element Text Should Be   id=APjFqb  ร้านอาหารญี่ปุ่นใกล้ฉัน
    Page Should Contain      text=เท็นชิโนะ
    Page Should Contain Link [TBD]


*** Keywords ***

*** Comments ***
This whole section is treated as comments as a Multiple lines

- สิ่งที่ต้องรู้
    - การเว้นวรรค 2 white spaces เพื่อแบ่ง arguments
    - [TBD]  ปล่อยไว้เป็น To be develope
    - ลง driver แล้วก็จะใช้ไม่ได้ เพราะ keyword ใน Test Cases ถ้ายังไม่ได้ import selenium library เข้ามา ใน *** Settings ***(ติดตั้งในเครื่องก่อน)
    - Robot Framework -> locator strategies ตามในตาราง https://www.notion.so/Day-25-24-11-2025-2b5a555c74b3805db69beb2848517979?source=copy_link#2b5a555c74b380659d55faeedafd3324
    - k1 (kindergarten1) อนุบาล 1