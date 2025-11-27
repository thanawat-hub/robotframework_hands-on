ตรวจสอบผลลัพธ์เลือกสินค้าจำนวนสินค้าที่ต้องการ(ชื่อ จำนวน ราคา point stock)
    Element Text Should Be    id=product-detail-product-name    expected=Balance Training Bicycle
    Element Attribute Value Should Be    id=product-detail-quantity-input    attribute=value    expected=1
#    Element Should Contain    id=product-detail-price-thb    expected=4,314.60 -> เปลี่ยนจากแบบนี้เป็นแบบข้างล่าง เพราะ contain มันเสี่ยง อาจจะมีอะไรอยู่ข้างหน้า เช่น 14,314.60 บาท ก็จะแตก
    Element Text Should Be    id=product-detail-price    expected=$4,314.60    #ถ้าอยากใส่ $ด้วย ก็ทำได้ทั้งตัวแปร
#    Element Text Should Be    id=product-detail-price-usd    $${price}    #ก็จะหมายถึง $4314.60 ได้เช่นกัน

#---
#Element Attribute Value Should Be
## จะเจอ error ก็ต่อเมื่อใช้ attr กับบาง tag element
---
ตรวจสอบผลลัพธ์ในตระกร้า จะต้องมี ${product_name} จำนวน ราคา point stock
    Wait Until Element Is Visible    ${POPUP_CART}    timeout=${TIMEOUT}
# ตอนทำ เจอว่า ตอนทำไป wait ไป check ไป ซึ่งทำให้ โค้ดเป็นแบบนี้ แต่เราเช็คทีเดียวเลยทุกตัว เพื่อ? เราเช็คแค่ตัวที่ loading ของหน้านั้นเสร็จ ก็คือ element ล่างๆ -> concept: กดแล้วเกิด action (ที่ทำให้ค่าเปลี่ยนแปลง) ถึงจะต้อง wait เช่นพวก js
    # จริงๆ มีแค่อันนี้ อันเดียวก็พอ เพื่อให้รู้ว่าเปิดมามี
    # ต้องดูว่า ที่เราจะเช็ค มันอยู่ใน scope ไหน ตัวย่อย หรือตัวหลัก
---
    # ${POPUP_CART}  comment -> การตั้ง ตัวแปรใหญ่ ตัวแปรย่อยใน ส่วนๆ , ตัวแปร product_name (embedded argument), set timeout ทีเดียว, การสื่อสารชื่อที่ถูกต้อง เช่น POPUP_CART เรารู้ได้ยังไงว่ามันเรียกว่า POPUP
---

#    Select From List By Label    id=shipping-form-province-select    labels=กรุงเทพมหานคร
    # ผิด เพราะมันเป็น การไปหาคำว่า labels=กรุงเทพมหานคร ไม่ใช่แค่ กรุงเทพมหานคร ->
---
    # ควรเช็คหน้า Payment Gateway ยังไง  -> ย้อนไปที่ env ที่ใช้เทส ซึ่ง env นั้นอาจจะไม่ได้ต่อระบบ gateway จริง ?
    # sol: ควรต้องหาวิธีจำลองพฤติกรรมนี้ โดยอาจจะใช้ service mock หรือ stub มาช่วย
#    Element Should Contain    ไม่มีid ให้ตรวจ จำนวนเงินและวันที่ จองลองให้เหมือนของจริง ที่ไปต่อ api ภายนอกเขาไม่มี นั้นแปลว่า เราไม่ได้จะเทส ระบบเขา เราจะเทสระบบเรา
