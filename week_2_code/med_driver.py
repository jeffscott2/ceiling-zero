
from week_2_code.csv_helper import CsvHelper

from week_2_code.med_report_boss import ReportForBoss


def main():
    input_file='week_2_code/health_data.csv'
    ch = CsvHelper(input_file)
    csv_rows = ch.get_rows_exclude_header()

    boss = ReportForBoss(csv_rows)
    boss.print_report()

    # print(csv_rows)