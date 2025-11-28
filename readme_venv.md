desc: install Robot Framework on venv
python v. = 3.12.7

```สำหรับ ลง ตัว เลือก python v ในตอนแรกก่อน อาจจะใช้ pyenv หรือ uv ก็ได้ ???
```

### create & activate virtual environment
```commandline (command prompt เท่านั้น) at this path: D:\________Z____________Desktop_now\we_love_bug\_learn\E2E-Test
once > python -m venv robot_venv
robot_venv\Scripts\activate.bat
```

### install Robot Framework and SeleniumLibrary
```
pip install robotframework
pip install robotframework-seleniumlibrary
```

pip list ==> เราจะไม่แชร์ไป แต่เราจะโยน requirements.txt ให้แทน
```commandline
pip freeze requirements.txt
```


ใช้งานใหม่ ให้ลงเลยจากที่เรามี requirements.txt -> ถาม chat
```commandline
python -m venv robot_venv
```

### usage by project
cd เข้า path ที่ใช้งาน เช่น Vercel
```commandline
cd UI\your_project
cd UI\SCK_Shopping
```

### robot --help
เช่นจะรัน url dev vs uat ให้มันกำหนดผ่าน cli -v คือ variable
robot -v URL:https://dev.vercel.com demo_login.robot
robot -v URL:https://dev.vercel.com -v BROWSER:firefox demo_login.robot
```


#0. robot -v BROWSER:headlesschrome {filename}
#```
#robot -v BROWSER:headlesschrome sck-practice-after-feedback.robot
#```

#step 1 เริ่มที่เขียน test case ก่อน แล้วค่อย map รวมเป็น keyword ทีหลัง
#step 2 search Wait Until Element Is Visible ที่ตัวไหนที่จะเป็นตัวสุดท้าย และทำการรอที่ตัวนั้น (มี wait แปลว่า ต้องมี action จาก user ที่ทำให้ระบบเกิดการเปลี่ยนแปลง)
