
import csv

class CsvHelper:
    def __init__(self, filename):
        self.filename = filename

    def get_rows_exclude_header(self):
        csv_file = open(self.filename)
        csv_row_reader = csv.reader(csv_file, delimiter=',' )
        csv_row_reader.__next__()
        rows = []

        for csv_row in csv_row_reader:
            rows.append(csv_row)

        return rows