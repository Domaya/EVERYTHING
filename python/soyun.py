import sys
import time
import schedule #터미널에서 pip install schedule로 설치
import subprocess #외부 프로그램 실행을 위한 모듈
import webbrowser
import keyboard #터미널에서 pip install keyboard

def job():
    webbrowser.open('https://us04web.zoom.us/j/5440548817')
    time.sleep(10) #로딩 10초 기다렸다가
    keyboard.write('2320')
    keyboard.press_and_release('Enter') #엔터
    sys.exit() #프로그램 종료

#수업 시작 3분 전이 되면 줌 입장
schedule.every().day.at("09:57").do(job)

while True:
    schedule.run_pending()
    time.sleep(1)
