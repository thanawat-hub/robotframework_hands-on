*** Comments ***
ทำ Keywords ให้เป็น Arguments

*** Keywords ***
ลูกค้าเปิดเว็บไซต์ SCK-Shopping Mall และใส่คำค้นหา Balance
    Open Browser    url=${URL_SCK}    browser=${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id=search-product-input    error=ไม่พบช่องค้นหา สินค้าในหน้า SCK Shopping
    Input Text    id=search-product-input    text=Balance
    Press Keys    id=search-product-input    ENTER
    Log    ใส่คำค้นหาในช่องค้นหา สินค้าและกด Enter เพื่อค้นหา


ตรวจสอบผลลัพธ์การค้นหาสินค้า Balance
    [Documentation]    มี id ใช้ id | แต่ตรงนี้คือแค่อยากลองตามที่ได้ฟังอธิบาย | Log จะมีไว้ในตอนที่ user action
    # รอให้มีสินค้าอย่างน้อย 1 ชิ้นก่อน
    Wait Until Element Is Visible     css=[id^='product-card-name-']    #->[gemini แนะนำ css สุดถ้าต้อง apply simple logic]  #dom=document.querySelector("[id^='product-card-name-']")    #xpath=//*[starts-with(@id, 'product-card-name-')]   #//*[@id="product-card-name-1"] #->chrome #//*[@id="product-card-name-1"] ->firefox
    # ส่ง Logic การหาค่า Max ไปรันใน Browser โดยตรง
    ${max_id_number}=    Execute Javascript    return Math.max(...Array.from(document.querySelectorAll("[id^='product-card-name-']")).map(e => parseInt(e.id.replace('product-card-name-', ''))));
    # ได้ตัวเลขมา set เพื่อนำไปใช้ต่อใน ส่วนนี้
    Set Local Variable    ${target_locator_to_wait}    id=product-card-name-${max_id_number}
    Log    Browser บอกมาว่า ID ล่าสุดคือ: ${max_id_number}    level=DEBUG

    # รอให้ตัวสุดท้าย ของสินค้าโหลดขึ้นมาให้เสร็จ
    Wait Until Element Is Visible    ${target_locator_to_wait}    error=ไม่พบสินค้าที่ค้นหาในหน้า SCK Shopping
    Element Text Should Be    id=product-card-name-1    expected=Balance Training Bicycle    message=None    ignore_case=False
    Log    message=พบสินค้าที่ค้นหาชื่อ Balance Training Bicycle ในหน้า SCK Shopping    level=INFO

คลิกเลือกสินค้า Balance Training Bicycle
    Click Element    id=product-card-name-1

ตรวจสอบราคา สินค้า Balance Training Bicycle ราคา $4,314.60 จำนวนที่จะซื้อ แต้มที่จะได้รับ 43 point และสินค้าคงเหลือในสต็อก
    Element Text Should Be    id=product-detail-product-name    expected=Balance Training Bicycle
    Element Attribute Value Should Be    id=product-detail-quantity-input    attribute=value    expected=1
    Element Text Should Be    id=product-detail-price-thb    expected=฿4,314.60
    Element Text Should Be    id=product-detail-point    expected=43 Points    message=เช็ค แต้มที่ได้ และ/หรือ คำสะกด มีจุดผิด
    Element Text Should Not Be    id=product-detail-stock   not_expected=0

คลิกเลือกสินค้าลงตระกร้า
    Click Element    id=product-detail-add-to-cart-btn

ตรวจสอบเลขบนตระกร้าต้องมีประเภทสินค้า 1 ชิ้น
    Wait Until Element Contains    id=header-menu-cart-btn    1
    Element Text Should Be    id=header-menu-cart-btn    expected=1

คลิกตะกร้าสินค้าเพื่อตรวจสอบรายการสินค้าในตระกร้า
    Wait Until Element Contains    id=header-menu-cart-btn    1
    Click Element    id=header-menu-cart-btn

ตรวจสอบราคา สินค้า Balance Training Bicycle ราคา $4,314.60 จำนวนที่จะซื้อ แต้มที่จะได้รับ 43 point และสินค้าคงเหลือในสต็อก ในหน้าตระกร้า
    [Arguments]    ${cart_product_name}    ${cart_product_price}    ${cart_product_points}    ${cart_product_qty}    ${cart_product_subtotal}
    # [Arguments]    ${cart_product_name}    ${cart_product_price}    ${cart_product_points}    ${cart_product_stock}    ${cart_product_qty}    ${cart_product_subtotal}
    Click Button    id=header-menu-cart-btn
    Wait Until Element Is Visible    id=product-1-price
    Element Text Should Be    id=product-1-name    ${cart_product_name}
    Element Text Should Be    id=product-1-price    ฿${cart_product_price}
    Element Text Should Be    id=product-1-point    ${cart_product_points} Points
    # Element Text Should Be    id=product-1-stock    Stock ${cart_product_stock} items
    Textfield Value Should Be    id=product-1-quantity-input    ${cart_product_qty}
    Element Text Should Be    id=shopping-cart-subtotal-price    ฿${cart_product_subtotal}
    Click Element    id=shopping-cart-checkout-btn

#===

คลิกการชำระเงิน(checkout)
    Click Element    id=shopping-cart-checkout-btn

ตรวจสอบผลลัพธ์ในหน้าข้อมูลการจัดส่งคำสั่งซื้อ
    Element Text Should Be    id=product-1-name    expected=Balance Training Bicycle
    Element Text Should Be    id=product-1-quantity-input    expected=1
    Element Text Should Be    id=product-1-price    expected=฿4,314.60
    Element Text Should Be    id=product-1-point    expected=43 Points
    Element Text Should Not Be    id=product-1-stock   not_expected=0

ยืนยันข้อมูลการจัดส่งคำสั่งซื้อ
    Set Local Variable    ${security_code}    123

    Input Text    id=shipping-form-first-name-input   text=Thanawat    clear=True
    Input Text    id=shipping-form-last-name-input   text=Boon    clear=True
    Input Text    id=shipping-form-address-input   text=205 เพชรเกษม    clear=True

    Click Element    id=shipping-form-province-select
#    Select From List By Label    id=shipping-form-province-select    labels=กรุงเทพมหานคร
    # ใส่ arguments แบบนี้ labels=กรุงเทพมหานคร ไม่ได้ เพราะมันเป็น กลายเป็นว่าไปหาคำว่า labels=กรุงเทพมหานคร ไม่ใช่แค่ กรุงเทพมหานคร | จะเอาคำหลัง เสมอ (ตาม docs) | และจากที่ลองต้อง click element นั้นก่อนใช้ Select From List By Label
    Select From List By Label    id=shipping-form-province-select   กระบี่    กรุงเทพมหานคร
    Click Element    id=shipping-form-district-select
    Select From List By Label   id=shipping-form-district-select   เขตบางแค
    Click Element    id=shipping-form-sub-district-select
    Select From List By Label   id=shipping-form-sub-district-select   หลักสอง
    # ตรวจสอบ zipcode ที่หน้าบ้านสร้างให้
    Element Attribute Value Should Be    id=shipping-form-zipcode-input    attribute=value    expected=10160
    Input Text    id=shipping-form-mobile-input    text=0812345678    clear=True
    # เลือกวิธีการส่ง
    Click Element    id=shipping-method-1-name
    # Credit Card / Debit Card
    Input Text    id=payment-credit-form-fullname-input    text=Thanawat Boon    clear=True
    Input Text    id=payment-credit-form-card-number-input    text=4111111111111111    clear=True
    Input Text    id=payment-credit-form-expiry-input   text=12/25    clear=True
    Input Password    id=payment-credit-form-cvv-input    password=${security_code}    clear=True
#    check Summary in this page
    Element Text Should Be    id=order-summary-subtotal-price    expected=฿4,314.60
    Element Should Contain    id=order-summary-receive-point-price    expected=43
    #ตรวจ เนื่องจากเป็น kerry ค่าจัดส่งจะต้องเป็น 50.00
    Element Text Should Be    id=order-summary-shipping-fee-price   expected=฿50.00
    Element Text Should Be    id=order-summary-total-payment-price    expected=฿4,364.60
    # click ยืนยันการสั่งซื้อ
    Click Element    id=payment-now-btn

กรอกรหัสรหัสผ่านครั้งเดียว(OTP)
    # question: ควรเช็คหน้า Payment Gateway ยังไง  -> ย้อนไปที่ env ที่ใช้เทส ซึ่ง env นั้นอาจจะไม่ได้ต่อระบบ gateway จริง ?
    # sol: ควรต้องหาวิธีจำลองพฤติกรรมนี้ โดยอาจจะใช้ service mock หรือ stub มาช่วย
    Set Local Variable    ${opt_code}    123456
    Wait Until Page Contains Element    id=otp-input
    Input Text    id=otp-input    text=${opt_code}    clear=True
    Click Button    PAY NOW
    #  หรือใช้แบบนี้ก็ได้ เพราะจากใน docs อันนี้มันอ่านจาก => buttons are searched using id, name, and value. ซึ่งจากหน้าบ้านมันเป็น value #    Click Element    xpath=//button[normalize-space()='PAY NOW']

กรอกอีเมลเบอร์โทรเพื่อรับข่าวสารโปรโมชั่น
    # เช็ค date today ?
    # เลข number KR-167987241 หาว่า เท่ากับ null หรือเปล่า
    Wait Until Page Contains Element    id=notification-form-email-input
    Input Text    id=notification-form-email-input    text=thanawat123
    Input Text    id=notification-form-mobile-input    text=0812345678
    Click Element    id=send-notification-btn


# close browser เมื่อก่อนต้องใส่ เพราะ browser มันเปิดค้างไว้ แต่ตอนนี้ตั้งแต่ version 3 มันจะปิดให้เลย