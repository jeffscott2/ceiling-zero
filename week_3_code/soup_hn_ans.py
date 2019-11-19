from bs4 import BeautifulSoup

def read_file_contents(filename):
    f = open(filename, "r")
    str = f.read()
    f.close()
    return str

html_string = read_file_contents("week_3_code/HackerNews.html")

soup = BeautifulSoup(html_string, 'html.parser')

links = soup.findAll(attrs={"class":"storylink"})

for link in links:
    print(link.text)