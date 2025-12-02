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

การตั้งชื่อ ไฟล์ test ได้แค่
{your_file_name}.spec.ts
or
{your_file_name}.test.ts
.
how to run file test
เข้ามาที่ใน folder playwright (ที่มี package.json นั้นก่อน)
run แบบ อ่านจาก package.json
```commandline
npm test {your_file_name}.{spec,test}.ts
```
รันทั้งหมด
```commandline
npm test
```
.
# ก่อน push ให้ใส่และเช็คสีเหลืองถ้าเป็น pycharm หลัง push แล้วอยากให้ ใน pycharm update ก็ต้องใช้ git status