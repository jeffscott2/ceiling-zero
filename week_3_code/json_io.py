import json
import io


def write_dict_to_json_file(obj, file):
    str = json.dumps(obj)
    f = open(file, "w")
    f.write(str)
    f.close()

def read_json_file_as_dict(file):
    f = open(file, "r")
    str = f.read()
    f.close()
    dict = json.loads(str)
    return dict