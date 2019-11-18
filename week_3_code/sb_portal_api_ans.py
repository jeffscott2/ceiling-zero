import urllib.request
import json

def main():

    url = "https://opendata.arcgis.com/datasets/0a790a023d95409cb98e43525998ee8a_0.geojson"
    response = urllib.request.urlopen(url)
    resp_str = response.read()
    json_string = resp_str.decode('utf-8')
    json_dict = json.loads(json_string)
    
    #print(json_dict)
    features = json_dict['features']
    for feature in features:
        properties = feature['properties']
        name = properties['Business_Name']
        address = properties['Street_Address']
        print(f"{name} operates at: {address}")


main()
