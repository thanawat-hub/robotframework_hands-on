// how to run only this file (one file)
// ```
// npm run test:headed -- login.spec.ts
// ````
import { test, expect } from '@playwright/test';

// has title คือชื่อ test cases
test('Login and Verify', async ({ page }) => {
    await page.goto('https://demo-login-workshop.vercel.app/');

  // ใส่ username และ password
    await page.locator('[id=username_field]').fill("demo"); // -> แบบนี้อ่านเข้าใจง่าย
    await page.locator('#password_field').fill("mode"); // -> แบบนี้ก็ได้ เรียกว่าใช้ dom selector | โดย # แปลว่า id นั้นหละ
    await page.locator('#login_button').click();

  // ตรวจสอบผลการ login -> https://playwright.dev/docs/test-assertions
    // ถ้าไม่ใส่ await มันจะทำไปก่อน page โหลดเสร็จ
    await expect(page.locator('[id=container]')).toContainText('Welcome')

// จะมี step เหมือนกันเลย มอง code เป็น keyword ใน robot framework ก็ได้ -> แล้วจัดกลุบได้โดยใช้ TestStepInfo https://playwright.dev/docs/api/class-teststepinfo
});

