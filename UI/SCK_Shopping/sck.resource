*** Keywords ***
เข้าหน้าเว็บSCK-Shopping mall และใส่คำค้นหา
    Open Browser    url=${URL_SCK}    browser=${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id=search-product-input     timeout=${TIMEOUT}
    Input Text    id=search-product-input    text=Balance Training Bicycle    clear=True
    Press Keys    id=search-product-input    RETURN

ตรวจสอบผลลัพธ์การค้นหา(ชื่อ)
    Wait Until Element Is Visible    id=product-card-1     timeout=${TIMEOUT}
    Element Should Contain    id=product-card-1    expected=Balance Training Bicycle
#    Element Should Contain    id=product-card-price-1    expected=4,314.60

คลิกเลือกสินค้า
    Click Element    id=product-card-1

ตรวจสอบผลลัพธ์เลือกสินค้าจำนวนสินค้าที่ต้องการ(ชื่อ จำนวน ราคา point stock)
    Element Text Should Be    id=product-detail-product-name    expected=Balance Training Bicycle
    Element Attribute Value Should Be    id=product-detail-quantity-input    attribute=value    expected=1
#    Element Should Contain    id=product-detail-price-thb    expected=4,314.60 -> เปลี่ยนจากแบบนี้เป็นแบบข้างล่าง เพราะ contain มันเสี่ยง อาจจะมีอะไรอยู่ข้างหน้า เช่น 14,314.60 บาท ก็จะแตก
    Element Text Should Be    id=product-detail-price    expected=$4,314.60    #ถ้าอยากใส่ $ด้วย ก็ทำได้ทั้งตัวแปร
#    Element Text Should Be    id=product-detail-price-usd    $${price}    #ก็จะหมายถึง $4314.60 ได้เช่นกัน
    
    Element Should Contain    id=product-detail-point    expected=43
    Element Text Should Not Be    id=product-detail-stock   not_expected=0
    # 61?? อยู่ที่การทำ arrange แล้วเราจะเขียนยึดจากตรงนั้น

คลิกเลือกสินค้าลงตระกร้า
    Click Element    id=product-detail-add-to-cart-btn
#   click add to cart
ตรวจสอบเลขบนตระกร้า
    Wait Until Element Contains    id=header-menu-cart-btn    1     timeout=${TIMEOUT}
    Element Should Contain    id=header-menu-cart-btn    expected=1
#    Element Attribute Value Should Be
# จะเจอ error ก็ต่อเมื่อใช้ attr กับบาง tag element
#Element 'id=header-menu-cart-btn' attribute should have value '1' (str) but its value was 'None' (nonetype).

คลิกตะกร้าสินค้า
    Wait Until Element Contains    id=header-menu-cart-btn    1    timeout=${TIMEOUT}
    Click Element    id=header-menu-cart-btn
#Element 'id=header-menu-cart-btn' attribute should have value '1' (str) but its value was 'None' (nonetype).

ตรวจสอบผลลัพธ์ในตระกร้าสินค้า(ชื่อ จำนวน ราคา point stock)
    Wait Until Element Is Visible    ${POPUP_CART}    timeout=${TIMEOUT}
    Wait Until Element Contains    id=product-1-name    Balance Training Bicycle    timeout=${TIMEOUT}
#    Wait Until Element Contains    id=product-1-quantity-input    1    timeout=${TIMEOUT}
    Wait Until Element Contains    id=product-1-price    4,314.60    timeout=${TIMEOUT}
    Wait Until Element Contains    id=product-1-point    43    timeout=${TIMEOUT}
#    Wait Until Element Contains    id=product-1-stock    not_expected=0    timeout=${TIMEOUT}
    # comment -> ตัวแปรใหญ่ ย่อย
    Element Should Contain    ${POPUP_CART}    expected=Balance Training Bicycle
    Element Should Contain    ${POPUP_CART}    expected=1
    Element Should Contain    ${POPUP_CART}    expected=4,314.60
    Element Should Contain    ${POPUP_CART}    expected=43
    Element Text Should Not Be    ${POPUP_CART}   not_expected=0 # มันควรเหลือมากกว่า จำนวน quantity ที่เลือกลงตระกร้า -> แต่จะทำยังไง

ตรวจสอบผลลัพธ์ในตระกร้า จะต้องมี ${product_name} จำนวน ราคา point stock
    Wait Until Element Is Visible    ${POPUP_CART}    timeout=${TIMEOUT}
# ตอนทำ เจอว่า ตอนทำไป wait ไป check ไป ซึ่งทำให้ โค้ดเป็นแบบนี้ แต่เราเช็คทีเดียวเลยทุกตัว เพื่อ? เราเช็คแค่ตัวที่ loading ของหน้านั้นเสร็จ ก็คือ element ล่างๆ -> concept: กดแล้วเกิด action (ที่ทำให้ค่าเปลี่ยนแปลง) ถึงจะต้อง wait เช่นพวก js
    # จริงๆ มีแค่อันนี้ อันเดียวก็พอ เพื่อให้รู้ว่าเปิดมามี
    # ต้องดูว่า ที่เราจะเช็ค มันอยู่ใน scope ไหน ตัวย่อย หรือตัวหลัก
#    Wait Until Element Contains    id=product-1-name    ${product_name}    timeout=${TIMEOUT}
#    Wait Until Element Contains    id=product-1-quantity-input    1    timeout=${TIMEOUT}
#    Wait Until Element Contains    id=product-1-price    4,314.60    timeout=${TIMEOUT}
#    Wait Until Element Contains    id=product-1-point    43    timeout=${TIMEOUT}
#    Wait Until Element Contains    id=product-1-stock    not_expected=0    timeout=${TIMEOUT}
    # comment -> การตั้ง ตัวแปรใหญ่ ตัวแปรย่อยใน ส่วนๆ , ตัวแปร product_name (embedded argument), set timeout ทีเดียว, การสื่อสารชื่อที่ถูกต้อง เช่น POPUP_CART เรารู้ได้ยังไงว่ามันเรียกว่า POPUP

    Element Should Contain    ${POPUP_CART}    expected=Balance Training Bicycle
    Element Should Contain    ${POPUP_CART}    expected=1
    Element Should Contain    ${POPUP_CART}    expected=4,314.60
    Element Should Contain    ${POPUP_CART}    expected=43
    Element Text Should Not Be    ${POPUP_CART}   not_expected=0 # มันควรเหลือมากกว่า จำนวน quantity ที่เลือกลงตระกร้า -> แต่จะทำยังไง

คลิกการชำระเงิน(checkout)
    Click Element    id=shopping-cart-checkout-btn

ตรวจสอบผลลัพธ์ในหน้าข้อมูลการจัดส่งคำสั่งซื้อ
    Element Text Should Be    id=product-1-name    expected=Balance Training Bicycle
    Element Text Should Be    id=product-1-quantity-input    expected=1
    Element Should Contain     id=product-1-price    expected=4,314.60
    Element Should Contain     id=product-1-point    expected=43
    Element Text Should Not Be    id=product-1-stock   not_expected=0 # มันควรเหลือมากกว่า จำนวน quantity ที่เลือกลงตระกร้า -> แต่จะทำยังไง

#ConfirmOrderShippingInformation
ยืนยันข้อมูลการจัดส่งคำสั่งซื้อ
    Input Text    id=shipping-form-first-name-input   text=Thanawat    clear=True
    Input Text    id=shipping-form-last-name-input   text=Boon    clear=True
    Input Text    id=shipping-form-address-input   text=205 เพชรเกษม    clear=True

    Click Element    id=shipping-form-province-select
#    Select From List By Label    id=shipping-form-province-select    labels=กรุงเทพมหานคร
    # ผิด เพราะมันเป็น การไปหาคำว่า labels=กรุงเทพมหานคร ไม่ใช่แค่ กรุงเทพมหานคร ->
    Select From List By Label    id=shipping-form-province-select   กระบี่    กรุงเทพมหานคร
    #  ถ้าใส่หลายๆตัวก็เอาตัวสุดท้าย
    sleep    5

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
    Input Password    id=payment-credit-form-cvv-input    password=${SECURITY_CODE}    clear=True
#    check Summary in this page
    Wait Until Element Contains     id=order-summary-subtotal-price    text=4,314.60
    Element Should Contain    id=order-summary-subtotal-price    expected=4,314.60
    Wait Until Element Contains    id=order-summary-receive-point-price    text=43
    Element Should Contain    id=order-summary-receive-point-price    expected=43
    #ตรวจ เนื่องจากเป็น kerry ค่าจัดส่งจะต้องเป็น 50.00
    Wait Until Element Contains    id=order-summary-shipping-fee-price   text=50.00
    Element Should Contain    id=order-summary-shipping-fee-price   expected=50.00
    Wait Until Element Contains    id=order-summary-total-payment-price    text=4,364.60
    Element Should Contain    id=order-summary-total-payment-price    expected=4,364.60
    # click ยืนยันการสั่งซื้อ
    Click Element    id=payment-now-btn

กรอกรหัสรหัสผ่านครั้งเดียว(OTP)
    # ToDo ควรเช็คหน้า Payment Gateway ยังไง  -> ย้อนไปที่ env ที่ใช้เทส ซึ่ง env นั้นอาจจะไม่ได้ต่อระบบ gateway จริง ?
    # sol: ควรต้องหาวิธีจำลองพฤติกรรมนี้ โดยอาจจะใช้ service mock หรือ stub มาช่วย
#    Element Should Contain    ไม่มีid ให้ตรวจ จำนวนเงินและวันที่
    Wait Until Page Contains Element    id=otp-input    timeout=${TIMEOUT}
    Input Text    id=otp-input    text=123456    clear=True
    Click Button    PAY NOW
    #    หรือใช้แบบนี้ก็ได้ กรณีมี text ด้านใน จากใน docs อันนี้มันอ่านจาก => buttons are searched using id, name, and value. ซึ่งจากหน้าบ้านมันเป็น value #    Click Element    xpath=//button[normalize-space()='PAY NOW']

กรอกอีเมลเบอร์โทรเพื่อรับข่าวสารโปรโมชั่น
    # เช็ค date today ?
    # เลข number KR-167987241 หาว่า เท่ากับ null หรือเปล่า
    Wait Until Page Contains Element    id=notification-form-email-input    timeout=${TIMEOUT}
    Input Text    id=notification-form-email-input    text=thanawat123
    Input Text    id=notification-form-mobile-input    text=0812345678
    Click Element    id=send-notification-btn

ล้างแอพให้กลับสู่สถานะเริ่มต้น
    # 1. Delete cookies to log out or clear session
    Delete All Cookies
    Close Browser