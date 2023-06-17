
Target Platform
Ubuntu

## Install using Docker

The supported Dockerfile creates a basic Ubuntu instance with the following:
- Selenium
- BS4 with LXML
- Chromedriver (Headless only since we don't use XVFB to export display)

## Simple code to extract jobs from LinkedIn

```
 from selenium import webdriver
 from bs4 import BeautifulSoup
 jobs_to_search = 'accounting'
 url = F"https://www.linkedin.com/jobs/search/?f_TPR=r604800&geoId=101174742&keywords={jobs_to_search}&location=Canada&sortBy=DD"
 opt = webdriver.ChromeOptions()
 opt.add_argument('headless')
 opt.add_argument('--no-sandbox')
 driver = webdriver.Chrome(options=opt)
 driver.get(url)
 lxml_soup = BeautifulSoup(driver.page_source, 'lxml')
 job_container = lxml_soup.find('ul', class_ = 'jobs-search__results-list')
 company_names = [ job.select_one('img')['alt'] for job in job_container ]
 job_ids = [ job.find('a', href=True)['href'] for job in job_container ]

```
