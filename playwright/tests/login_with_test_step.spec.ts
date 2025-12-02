// how to run only this file (one file) if current path is ..\E2E-Test\playwright>
// ``` ใส่ folder ไม่ได้ และ ไม่จำเป็นต้องมี -- ก็ได้
// npm run test:headed login_with_test_step.spec.ts
// ````
import { test, expect } from '@playwright/test';

// has title คือชื่อ test cases
test('Login and Verify', async ({ page }) => {

    await test.step('user open website', async () => {
        await page.goto('/');
    });

    await test.step('ใส่ username และ password', async () => {
        await page.locator('[id=username_field]').fill("demo"); // -> แบบนี้อ่านเข้าใจง่าย
        await page.locator('#password_field').fill("mode"); // -> แบบนี้ก็ได้ เรียกว่าใช้ dom selector | โดย # แปลว่า id นั้นหละ
        await page.locator('#login_button').click();
    });

  // ตรวจสอบผลการ login -> https://playwright.dev/docs/test-assertions
    // ถ้าไม่ใส่ await มันจะทำไปก่อน page โหลดเสร็จ -> ดูได้ใน best-practices https://playwright.dev/docs/best-practices
    await test.step('ตรวจสอบผลการ login', async () => {
        await expect(page.locator('[id=container]')).toContainText('Welcome')
    });

// ต่อไป ก็จะมีวิธีการ pass argument ได้เหมือนกับ Robot Framework เช่นกัน
});

