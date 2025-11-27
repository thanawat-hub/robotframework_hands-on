*** Settings ***
Library     SeleniumLibrary
#Resource    sck-af.resource
Test Teardown    ล้างแอพให้กลับสู่สถานะเริ่มต้น

*** Variables ***
#กำหนดตัวแปรตรงนี้เรียกว่าเป็น Suite Scope (ใช้ได้ทุก Test Case ในไฟล์นั้น) -> global variable
${URL_SCK}      http://sck-dojo.ddns.net:8000/product/list
${BROWSER}      chrome
#${TIMEOUT}      5
#${SECURITY_CODE}    123


*** Test Cases ***
ซื้อสินค้า SCK-online และชำระเงินสำเร็จ
    # ควรเขียนว่า user ทำอะไร ไม่ควรแค่เขียนว่า ตรวจสอบ เฉยๆ 
        # การเขียน robot คือการที่เราต้องการเล่าเรื่องว่า user ทำอะไรบ้าง => ไม่ควรมองในมุม UI ==> ทำให้รู้ได้ว่า ถ้า feature บางอย่างเปลี่ยน คือ robot เราก็รันไม่ได้ เช่นตรง click shipping method as default
    # wait ใช้เมื่อเราต้องการรอ action ที่เกิดจากการกระทำของ user -> เช่น กดปุ่ม เพิ่ม cart แล้วมี badge ขึ้นที่ cart icon => ให้ตั้งไว้เลยว่า เราจะเทสเงื่อนไขอะไร 
    # - อาจจะมี pattern ว่า 
        #1) 1 page 1 test case ย่อย 1 ตัว
        #2) 1 test case มี argument จำนวนเท่ากัน ,
        #3) 7-9 step ต่อ 1 test case
    # note การใช้ keyword goto ไป url เดิม ไม่ควรเพราะ -> dev เป็นคน control ค่าต่างๆ ที่จะเป็น พฤติกรรมของระบบ <<<< เพราะลองคิดว่าภาพ เราไม่ได้ให้ user ไป query db แล้วไปเช็คค่า แล้วมาเทียบ นอกจากว่าพฤติกรรมระบบต้องไปที่หน้าอื่น แล้วต้องการเช็คจริงๆ



