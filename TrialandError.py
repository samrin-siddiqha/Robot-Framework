import os
import sys
import time

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

driver = webdriver.Chrome(
    executable_path='C:/Program Files/Python39/Scripts/chromedriver.exe'
)
driver.get('https://www.google.com/')
driver.maximize_window()
# element = WebDriverWait(driver, 60).until(
#             EC.presence_of_element_located((By.XPATH, '//select[@title="select dropdown for TV"]'))
#         )
# time.sleep(1)
first_element = driver.find_element(By.XPATH, '//input[@title="Search"]')
first_element.send_keys("wikipedia")
first_element.submit()
sec_element = driver.find_element(By.XPATH, '//h3[@class="LC20lb MBeuO DKV0Md"]').click()
third_element = driver.find_element(By.XPATH, '//input[@class="vector-search-box-input"]')
third_element.send_keys('Harry Potter')
third_element.submit()
# fourth_element = driver.find_element(By.PARTIAL_LINK_TEXT, 'Author')
fourth_element = driver.find_element(By.XPATH, '//th[@class="infobox-label"]/following-sibling::td[@class="infobox-data"]').text
try:
    assert fourth_element == 'J. K. Rowling'
    print("Author name is matched")
except AssertionError:
    print(f'Assertion failed. Actual Author name is {fourth_element}')
driver.quit()



