
from week_2_code.csv_helper import CsvHelper

from week_2_code.med_report_boss import ReportForBoss
from week_2_code.med_report_appt_time import ReportApptTime

# CSV is from:
# https://docs.google.com/spreadsheets/d/1lH0tUJD5hea2PNX8opO6vpb18vUytI_OUpFyWgGtWjM/edit?usp=sharing
def main():
    input_file='week_2_code/med_data.csv'
    ch = CsvHelper(input_file)
    csv_rows = ch.get_rows_exclude_header()

    boss = ReportForBoss(csv_rows)
    boss.print_report()
    
    print("")

    time = ReportApptTime(csv_rows)
    time.print_report()

    # print(csv_rows)

