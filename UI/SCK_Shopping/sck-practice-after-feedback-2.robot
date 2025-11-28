*** Settings ***
Library     SeleniumLibrary
Test Timeout       15 seconds
# https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#timeouts
Resource    sck-af.resource


*** Variables ***
#กำหนดตัวแปรตรงนี้เรียกว่าเป็น Suite Scope (ใช้ได้ทุก Test Case ในไฟล์นั้น) -> global variable
${URL_SCK}      http://sck-dojo.ddns.net:8000/product/list
${BROWSER}      chrome
# สร้างตัวแปร ใน Variables ตอนไหนดี
    # 1) เพื่อ รันผ่าน cil ให้เปลี่ยน url จาก dev เป็น sit


# การเขียน robot คือการที่เราต้องการเล่าเรื่องว่า user ทำอะไรบ้าง (test scenarios) ใน *** Test Cases *** => ไม่ควรเขียนโดนมองในมุม UI อย่างเดียว
*** Test Cases ***
ลูกค้าซื้อสินค้าในเว็บไซต์ SCK-Shopping Mall สำเร็จ
    ลูกค้าเปิดเว็บไซต์ SCK-Shopping Mall และใส่คำค้นหา Balance
    ตรวจสอบผลลัพธ์การค้นหาสินค้า Balance
    คลิกเลือกสินค้า Balance Training Bicycle
    ตรวจสอบราคา สินค้า Balance Training Bicycle ราคา $4,314.60 จำนวนที่จะซื้อ แต้มที่จะได้รับ 43 point และสินค้าคงเหลือในสต็อก
    คลิกเลือกสินค้าลงตระกร้า
    ตรวจสอบเลขบนตระกร้าต้องมีประเภทสินค้า 1 ชิ้น
    คลิกตะกร้าสินค้าเพื่อตรวจสอบรายการสินค้าในตระกร้า
    ตรวจสอบราคา สินค้า Balance Training Bicycle ราคา $4,314.60 จำนวนที่จะซื้อ แต้มที่จะได้รับ 43 point และสินค้าคงเหลือในสต็อกในตระกร้า

    คลิกการชำระเงิน(checkout)
    ยืนยันข้อมูลการจัดส่งคำสั่งซื้อ
    กรอกรหัสรหัสผ่านครั้งเดียว(OTP)
    กรอกอีเมลเบอร์โทรเพื่อรับข่าวสารโปรโมชั่น
*** Keywords ***
