// current path -> /mnt/d/2025/we_love_bug/_learn/E2E-Test/playwright
// ```
// npm run test:headed kerry/kerry.spec.ts
// ```
// ===
import { test, expect } from '@playwright/test';

test('Open Kerry Express and verify title', async ({ page }) => {
    //เข้าหน้าเว็บ
    await page.goto('https://th.kex-express.com/en/track/');

    // ใส่หมายเลขพัสดุ
    await page.locator('input.tracking-input').click();
    await page.locator('textarea.textarea-scroll').fill('SDOF5208664423');
    await page.locator('textarea.textarea-scroll').press('Enter');

    //ตรวจสอบเลขพัสดุ และวันที่ เวลา
    await expect(page.locator('span.con')).toHaveText('SDOF5208664423');
    await expect(page.locator('span.text-1418.light').filter({ hasText: 'Date' })).toContainText('05 Dec 2025');
    await expect(page.locator('span.text-1418.light').filter({ hasText: 'Time' })).toContainText('16:');

    // ทำไมต้องเขียน span.text-1418.light (แทนที่จะเป็น text-1418 light)?
    // นี่คือเรื่องของ CSS Selector Syntax ครับ ซึ่งเป็นมาตรฐานสากลของการเขียนเว็บ ไม่ใช่เฉพาะของ Playwright
    // โค้ดเดิมของคุณ: locator('text-1418 light')
    // ไม่มีจุด (.) นำหน้า: โปรแกรมจะมองว่า text-1418 คือชื่อ Tag HTML (เหมือน div, span, p) ซึ่งจริงๆ แล้วมันไม่มี tag ชื่อนี้
    // มีช่องว่าง (Space): ในภาษา CSS การเว้นวรรคหมายถึง "ลูกหลาน" (Descendant) แปลว่า "จงหา tag <light> ที่ซ่อนอยู่ข้างใน tag <text-1418>"
    // ผลลัพธ์: หาไม่เจอ เพราะโครงสร้างเว็บไม่ได้ซ้อนกันแบบนั้น
    // โค้ดที่ถูกต้อง: locator('span.text-1418.light')
    // span: บอกว่าให้หา tag <span>
    // .text-1418: ที่มี class ชื่อ text-1418 (จุด . แทนคำว่า class)
    // .light: และ มี class ชื่อ light ด้วย (การเขียนติดกันโดยไม่มีเว้นวรรค แปลว่าต้องมี ทั้งสองอย่างในตัวเดียวกัน)
    // อ้างอิง (MDN Web Docs): เรื่อง Class Selectors
    // MDN - CSS Class Selectors https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Selectors/Class_selectors
    // .
    //     .filter({ hasText: 'Time' })?
    // นี่คือฟีเจอร์ของ Playwright เพื่อแก้ปัญหาเมื่อ "Selector เจอหลายตัว" -> docs https://playwright.dev/docs/locators

});