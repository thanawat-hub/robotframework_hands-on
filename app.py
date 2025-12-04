import sys
print("สวัสดีจากใน Docker! (ถ้ารัน docker ตามด้านล่างอะน่ะ)")
print(f"Python Version ที่ใช้คือ: {sys.version}")

# cd
# :/mnt/d/2025/we_love_bug/_learn/E2E-Test$ 
# ===
# how to run on wsl
# docker run -it --rm -v "$(pwd)":/usr/src/app -w /usr/src/app python:3.9-slim python app.py
# ===
# ลงก่อน
# sudo apt-get update
# sudo apt-get install -y docker.io
# ===
# ปกติ Docker จะต้องใช้สิทธิ์ Admin ตลอด ถ้าไม่อยากพิมพ์ sudo นำหน้าทุกครั้ง ให้รันคำสั่งนี้ครับ:
# Bash
# sudo usermod -aG docker $USER
# (คำสั่งนี้จะบอก Linux ว่า "User นี้เป็นคนกันเอง อนุญาตให้ใช้ Docker ได้เลย") แต่ต้อง re Terminal ก่อน

