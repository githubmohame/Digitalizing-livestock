import time
from selenium.webdriver.common.action_chains import ActionChains
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import StaleElementReferenceException
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support import expected_conditions as EC
from selenium import webdriver
from bs4 import BeautifulSoup
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
import pandas as pd  
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support.ui import Select
class element_has_css_class(object):
	def __init__(self, driver,name):
		self.driver= driver
		self.name= name
	def __call__(self, driver):
		try:
			select3=self.driver.find_element(By.ID,(self.name))
			select3.click()
			return self.driver
		except:
			pass
class element_has_css_class2(object):
	def __init__(self, select):
		self.select= select
	def __call__(self, driver):
		try:
			self.select.options
			list=[i for i in self.select.options ] 
			return list,self.select,driver
		except:
			pass
def solution():
	name=[]
	gavernorate=0
	city=0
	array=[]
	driver = webdriver.Chrome(ChromeDriverManager().install()) 
	driver.get("https://alzahraa.mans.edu.eg/studentApplications")
	x=driver.find_elements(By.TAG_NAME,("a"))
	driver.implicitly_wait(10)
	x[8].click()
	WebDriverWait(driver, 12,poll_frequency=2 ).until(element_has_css_class(driver,"btnRegionsDwn")) 
	counter=0
	select= Select(driver.find_element(By.ID,'cmbAddress') )
	list=select.options
	while(len(list)>gavernorate):
			class  fun1(object):
				def __call__(self, driver):
					select= Select(driver.find_element(By.ID,'cmbAddress') )
					list1,f,driver1=WebDriverWait(driver, 12,poll_frequency=2 ).until(element_has_css_class2(select,))
					try:
						name.append(list1[gavernorate].get_attribute("title"))
						select.select_by_index(gavernorate)
					except:
						return
					return name
			WebDriverWait(driver, 12,poll_frequency=2).until(fun1())
			time.sleep(4)
			list2,f,driver1=WebDriverWait(driver, 12,poll_frequency=2 ).until(element_has_css_class2(select,))
			time.sleep(4)
			WebDriverWait(driver, 12,poll_frequency=2 ).until(element_has_css_class(driver,"btnRegionsDwn")) 
			time.sleep(4)
			counter+=1
			class  func(object):
				def __call__(self, driver):
					select= Select(driver.find_element(By.ID,'cmbAddress') )
					select.select_by_index(city)
					list1=[i.text for i in select.options]
					name.append(list1[city])
					return name
			time.sleep(2)
			WebDriverWait(driver, 20,poll_frequency=2 ).until(func())
			city+=1
			try:
				WebDriverWait(driver, 12,poll_frequency=2 ).until(element_has_css_class(driver,"btnRegionsDwn")) 
				time.sleep(4)
				counter+=1
			except:
				pass
			print(counter)
			while(counter>0):        
				WebDriverWait(driver, 6,poll_frequency=2 ).until(element_has_css_class(driver,"btnRegionsUp"))
				time.sleep(4)
				print(counter)
				counter-=1
			print(counter)
			if(name in array):
				print('Error')
				print(name)
			array.append(name)
			print(counter)
			name=[] 
			print('done')
			time.sleep(12)
solution()