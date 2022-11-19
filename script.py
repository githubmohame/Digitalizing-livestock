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
			return driver
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
	x[8].click()
	your_element = WebDriverWait(driver, 12,poll_frequency=2 ).until(element_has_css_class(driver,"btnRegionsDwn")) 
	select= Select(driver.find_element(By.ID,'cmbAddress') )
	list=WebDriverWait(driver, 12,poll_frequency=2 ).until(element_has_css_class2(select,)) 
	counter=0
	while(len(list)>gavernorate):
			if(counter==0):
				list1,f,driver=WebDriverWait(driver, 20,poll_frequency=2 ).until(element_has_css_class2(select,)) 
				#f.select_by_visible_text(list1[gavernorate].text)
				class  fun1(object):
					def __call__(self, driver):
						select= Select(driver.find_element(By.ID,'cmbAddress') )
						list1,f,driver1=WebDriverWait(driver, 20,poll_frequency=2 ).until(element_has_css_class2(select,))
						try:
							name.append(list1[gavernorate].get_attribute("title"))
							select.select_by_index(gavernorate)
						except:
							return
						return name
				WebDriverWait(driver, 12,poll_frequency=2).until(fun1())
			elif(counter==1):
				list1,f,driver1=WebDriverWait(driver, 20,poll_frequency=2 ).until(element_has_css_class2(select,)) 
				if len(list1)<=city:
					print(city)
					city=0
					gavernorate+=1
				list1,f,driver1=WebDriverWait(driver, 20,poll_frequency=2 ).until(element_has_css_class2(select,))
				select= Select(driver.find_element(By.ID,'cmbAddress') )
				def func(a):
					pass
				class  func(object):
					def __call__(self, driver):
						select= Select(driver.find_element(By.ID,'cmbAddress') )
						select.select_by_index(city)
						name.append(list1[city].text)
						return name
				WebDriverWait(driver, 20,poll_frequency=2 ).until(func())
			try:
				your_element = WebDriverWait(driver, 12,poll_frequency=2 ).until(element_has_css_class(driver,"btnRegionsDwn")) 
				counter+=1
				time.sleep(10)
			except:
				while(counter>0):        
					driver = WebDriverWait(driver, 20,poll_frequency=2 ).until(element_has_css_class(driver,"btnRegionsUp"))
					counter-=1
				print(counter)
				counter=0
				name=[]
			city+=1
	print(gavernorate)
solution()