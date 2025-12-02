// how to run this file?
// npx playwright test tests/google.test.ts
import { test, expect } from '@playwright/test';

// has title คือชื่อ test cases
test('Open Google And Verify Title', async ({ page }) => {
  // เข้าหน้าเว็บ
  await page.goto('https://playwright.dev/');

  // ใส่คำค้นหา

  // ตรวจสอบผลการค้นหา

});
