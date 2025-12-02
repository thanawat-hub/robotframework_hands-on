Robot Framework -> set worker ได้แต่ default = 1 
Playwright -> เรียก โดยตรงกับ chrome เลย ไม่ต้องผ่าน driver -> เป็นเรื่อง overhead (ไม่ต้องผ่านหลายตัวกลาง) 
"Overhead" ที่หายไปใน Playwright คือ เวลาที่เสียไปกับการสื่อสารผ่านคนกลาง 


เพราะใน json comment ไม่ได้
โดยคำสั่งพวกนี้ที่อยู่ใน value จะต้องไปดูใน docs ของ playwright
  "scripts": {
    // คำสั่งรันเทส สามารถใช้ npm test ได้เลยเพราะ เป็นคำสั่ง default
    "test": "playwright test",
    // > npm test run test:headed
    "test:headed": "playwright test --headed",
     ตอนใช้ เพราะไม่ใช่ตัวรันปกติ จึงต้องใช้คำว่า npm run report
    "report" : "playwright show-report"
  },

note in https://www.notion.so/Day-30-Playwright-Regression-2bda555c74b3804d8897ea8004bae109?source=copy_link