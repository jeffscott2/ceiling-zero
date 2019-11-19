from bs4 import BeautifulSoup

# Install beautiful soup from the command line if you haven't already:
# $ python3 -m pip install beautifulsoup4

def read_file_contents(filename):
    f = open(filename, "r")
    str = f.read()
    f.close()
    return str

html_string = read_file_contents("week_3_code/html_intro.html")
soup = BeautifulSoup(html_string, 'html.parser')

rows = soup.findAll("tr")

for row in rows:
    print(f"row      : {row}")
    print(f"row.text : {row.text}")
    
    cols = row.findAll("td")
    
    for col in cols:
        print(f"col     : {col}")
        print(f"col.text: {col.text}")
    
    print("")