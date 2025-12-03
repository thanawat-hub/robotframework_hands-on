import { test, expect } from '@playwright/test';

// has title คือชื่อ test cases
test('Open Google And Verify Title', async ({ page }) => {
  // เข้าหน้าเว็บ -> docs:https://playwright.dev/docs/pages แล้วไปดู method ที่จะใช้ต่างๆ ใน API -> https://playwright.dev/docs/api/class-page
    await page.goto('https://www.google.com/');

  // ใส่คำค้นหา
//   ดูว่า element ไหนที่จะใช้ locator ในการหา -> https://playwright.dev/docs/locators
//   แล้ว inspect ดูที่หน้า google (ระวังมันติด Im not robot)
    const searchInputText = await page.getByRole('combobox');

    searchInputText.fill('ร้านอาหาร ญี่ปุ่นใกล้ฉัน');
    searchInputText.press('Enter');
  // ตรวจสอบผลการค้นหา -> https://playwright.dev/docs/test-assertions
  // เราจะหาจากหน้า page แต่ locator ไหนของ page นี้ ก็จะเป็น
    await expect(page.getByText('เท็นชิโนะ')).
    toBeVisible();

});
