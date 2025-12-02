import { test, expect } from '@playwright/test';

// has title คือชื่อ test cases
test('Login and Verify', async ({ page }) => {
    await page.goto('https://demo-login-workshop.vercel.app/');

  // ใส่ username และ password

  // ตรวจสอบผลการ login -> https://playwright.dev/docs/test-assertions

});
