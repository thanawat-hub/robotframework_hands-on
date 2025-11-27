#*** Comments ***
#This whole section is treated as comments as a Multiple lines
#- สิ่งที่ต้องรู้
#    - ถ้ามี data มาใส่หลายๆอัน ให้เป็น data driven ก็ควรสร้างตัวแปร variable ตัว excepted result ด้วย เช่น ร้านอาหารญี่ปุ่นใกล้ฉัน
#        - แต่ถ้ามีการเปลี่ยนแปลงหน้า UI บ่อยๆ ไม่ควรทำพวก เช่น id (รวมถึง web element locator อื่นๆ) เป็นตัวแปร


*** Settings ***
Library     SeleniumLibrary
Resource    sck.resource
Test Teardown    ล้างแอพให้กลับสู่สถานะเริ่มต้น

*** Variables ***
${URL_SCK}      http://sck-dojo.ddns.net:8000/product/list
## SCK local dev http://152.42.225.130/ # วันนี้ 26 ใช้ไม่ได้หละ
${BROWSER}      chrome
${TIMEOUT}      5
${POPUP_CART}    headlessui-dialog-panel-:r1:
${SECURITY_CODE}    123
# ${ID_SCK_SEARCH_BAR}    search-product-input # ไม่ควรทำเป็นตัวแปร เพราะหน้าบ้านอาจเปลี่ยน กรณีถูก รื้อ UI => ถามเสมอว่า หน้าบ้านเขาจะ redesign ไหม


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
    เข้าหน้าเว็บSCK-Shopping mall และใส่คำค้นหา
    ตรวจสอบผลลัพธ์การค้นหา(ชื่อ)
    คลิกเลือกสินค้า
    ตรวจสอบผลลัพธ์เลือกสินค้าจำนวนสินค้าที่ต้องการ(ชื่อ จำนวน ราคา point stock)
    คลิกเลือกสินค้าลงตระกร้า
    ตรวจสอบเลขบนตระกร้า
    คลิกตะกร้าสินค้า

    # EX: Embedded Arguments
    ตรวจสอบผลลัพธ์ในตระกร้า จะต้องมี Balance Training Bicycle จำนวน ราคา point stock

    คลิกการชำระเงิน(checkout)
    ยืนยันข้อมูลการจัดส่งคำสั่งซื้อ
    กรอกรหัสรหัสผ่านครั้งเดียว(OTP)
    กรอกอีเมลเบอร์โทรเพื่อรับข่าวสารโปรโมชั่น


