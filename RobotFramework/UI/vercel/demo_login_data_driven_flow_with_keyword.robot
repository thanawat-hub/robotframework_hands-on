#*** Comments ***
#This whole section is treated as comments as a Multiple lines
#url https://demo-login-workshop.vercel.app/
#demo
#pass:mode

*** Settings ***
Library    SeleniumLibrary
Test Template    Login Steps
# จะแปลว่า ทุก Test Cases จะใช้ Keyword ตัวนี้เป็นหลัก # ไม่สามารถ comment หลังตัว Settings ได้ ต้องขึ้นบรรทัดใหม่มา comment(c1)

Resource    keywords.resource
# เราเอา Keywords มาจากไฟล์ keywords.resource แทนที่จะเขียนในไฟล์นี้ทั้งหมด

*** Variables ***
${URL}    https://demo-login-workshop.vercel.app/
${BROWSER}    chrome


*** Test Cases ***                           Username   Password      Expected Result
ล็อกอินเข้าสู่ระบบสำเร็จ                              demo        mode          Login succeeded
#    Login Steps    demo    mode    Login succeeded ประกาศด้านบนแล้ว ตอนนี้ก็ไม่ใช้แล้ว ใช้แค่ data ด้านบนแทน และใส่ comment ไว้หลัง *** ได้(c2)

ล็อกอินเข้าสู่ระบบไม่สำเร็จกรณีกรอก Username ผิด          wrong_user  mode          Login failed

ล็อกอินเข้าสู่ระบบไม่สำเร็จกรณีกรอก Password ผิด          demo        wrong_pass    Login failed

ล็อกอินเข้าสู่ระบบไม่สำเร็จกรณีกรอก Username และ Password ผิด              wrong_user  wrong_pass    Login failed

ล็อกอินเข้าสู่ระบบไม่สำเร็จกรณีไม่กรอก Username แต่กรอก Password    ${EMPTY}     mode          Login failed
# ถ้าไม่รู้ว่าจะต้องไปใช้อะไร ไปหาอ่าน docs เช่นกรณีไม่กรอก ใช้ ${EMPTY} -> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html

ล็อกอินเข้าสู่ระบบไม่สำเร็จกรณีกรอก Username ถูก แต่ไม่กรอก Password    demo        ${EMPTY}     Login failed

ล็อกอินเข้าสู่ระบบไม่สำเร็จกรณีไม่กรอกทั้ง Username และ Password    ${EMPTY}     ${EMPTY}     Login failed




# ต่างกันแค่เทสต์ดาต้า หรือ value ใน robot เรียกว่า arguments
# 1 ต่อมา ดูว่ามีอะไรซ้ำกันอีก นั้นก็คือ ก็ได้ ตามไฟล์นี้ขอใช้ชื่อว่า flow หละกัน
# 2 ต่อมา เมื่อเราสร้าง ซ้ำใน keyword ได้ แล้วทำไมใน Test cases จะทำไม่ได้ ? มองว่าเป็น function -> แก้ตัวเดียวให้เทสแล้วผ่านก่อน แต่ที่เรียงจากไฟล์นี้มันก็คือจะได้เห็นภาพรวมทั้งหมด
# 3 ต่อมาตัว Steps เหมือนกัน ใน Test Cases ใน robot framework ก็จะมีตัว Test Template
### ถ้ามาท่านี้ ควรมี documents บอกว่าเราคิดยังไงด้วย
#*->ทดสอบอะไรอยู่ และใช้ค่าอะไรบ้าง เราสามารถใช้ robotframework เรียก databaselibrary เพื่อไปแก้ค่าใน db เพื่อ setup ให้พร้อมสำหรับการ ใช้ โค้ด automate เราไปรัน
