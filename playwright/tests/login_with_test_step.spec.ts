// how to run only this file (one file) if current path is ..\E2E-Test\playwright>
// ``` ใส่ folder ไม่ได้ และ ไม่จำเป็นต้องมี -- ก็ได้
// npm run test:headed login_with_test_step.spec.ts
// ````
import { test, expect } from '@playwright/test';

// Parameterized Tests -> https://playwright.dev/docs/test-parameterize
const loginData = [
  {
      testName: 'Login succeeded',
      username: 'demo',
      password: 'mode',
      expectedResult: 'Welcome'
  }, // มองว่าเป็น 1 ก้อน test data

  {
      testName: 'ล็อกอินเข้าสู่ระบบไม่สำเร็จกรณีกรอก Password ผิด',
      username: 'demo',
      password: 'wrong_pass',
      expectedResult: 'Login failed'
  },

 {
      testName: 'ล็อกอินเข้าสู่ระบบไม่สำเร็จกรณีกรอก Username และ Password ผิด',
      username: 'wrong_user',
      password: 'wrong_pass',
      expectedResult: 'Login failed'
  },

  {
      testName: 'ล็อกอินเข้าสู่ระบบไม่สำเร็จกรณีไม่กรอก Username แต่กรอก Password',
      username: null,
      password: 'mode',
      expectedResult: 'Login failed'
  },

  {
      testName: 'ล็อกอินเข้าสู่ระบบไม่สำเร็จกรณีกรอก Username ถูก แต่ไม่กรอก Password',
      username: 'demo',
      password: null,
      expectedResult: 'Login failed'
  },

  {
      testName: 'ล็อกอินเข้าสู่ระบบไม่สำเร็จกรณีไม่กรอกทั้ง Username และ Password',
      username: null,
      password: null,
      expectedResult: 'Login failed'
  }
];

loginData.forEach(({ testName, username, password, expectedResult }) => {

    // has title คือชื่อ test cases
    test(`${testName}`, async ({ page }) => {
        //ใส่ `` ครอบ ไม่ใช่ single quote เพราะ กัน กรณีลืมใส่ด้านบน แล้วมันจะรันไม่ได้ ซึ่งจริงๆก็คิดว่าไม่ควรใส่ เพราะจะได้รู้ว่าไม่มีชื่อสำหรับตรงนี้
        // มี $ คือ เหมือน กับ f string ใน python ที่ผ่านค่าเข้ามาใน string
        await test.step('user open website', async () => {
            await page.goto('/');
        });

        await test.step('ใส่ username และ password', async () => {
            username && await page.locator('[id=username_field]').fill(username); // -> แบบนี้อ่านเข้าใจง่าย
            password && await page.locator('#password_field').fill(password); // -> แบบนี้ก็ได้ เรียกว่าใช้ dom selector | โดย # แปลว่า id นั้นหละ
            await page.locator('#login_button').click();
        });

      // ตรวจสอบผลการ login -> https://playwright.dev/docs/test-assertions
        // ถ้าไม่ใส่ await มันจะทำไปก่อน page โหลดเสร็จ -> ดูได้ใน best-practices https://playwright.dev/docs/best-practices
        await test.step('ตรวจสอบผลการ login', async () => {
            await expect(page.locator('[id=container]')).toContainText(expectedResult)
        });

    // ต่อไป ก็หาอ่านจาก docs ตัวที่เหลือได้เลย ตอนนี้ได้รู้ตัวหลักหมดแล้ว
//     ใน robotframework ก็จะมีการ add pabot
//     https://stackoverflow.com/questions/74598011/how-to-add-robotframework-pabot-process
//   อันนี้น่าจะคล้ายๆกัน กับ parallel ใน playwright -> https://playwright.dev/docs/test-parallel
    });

});
