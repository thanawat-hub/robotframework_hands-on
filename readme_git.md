กรณีที่เผลอ add ตัวอื่นๆ เข้ามาก่อน gitingore

by file
```commandline
git rm --cached .gitignore
```

by all
```commandline
git rm --cached -r .
```

และก็ตาม step
```commandline
git commit -m "first commit add gitignore"
git branch -M main
git remote add origin https://github.com/thanawat-hub/robotframework_hands-on.git
git push -u origin main
```
