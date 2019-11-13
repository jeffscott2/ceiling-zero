class ReportApptTime:
    def __init__(self, rows):
        self.rows = rows


    def print_report(self):
        self.day_appt_time_sum = self._calculate_appt_time_per_day()
        self._print_nice()

    def _calculate_appt_time_per_day(self):
        day_time_sum = {}
        for row in self.rows:
            day = row[0]
            appt_time = int(row[3])
            current_count = day_time_sum.get(day, 0)
            day_time_sum[day] = current_count + appt_time
        return day_time_sum

    def _print_nice(self):
        output_length = len("*                                    *")

        print("**************************************")
        print("******* Appt Time Per Day ************")
        print("**************************************")
        print("*                                    *")
        print("*                                    *")
        for day in self.day_appt_time_sum.keys():
            day_text =  f"{day}: {self.day_appt_time_sum[day]} Mins"
            self._print_day_with_filler(output_length, day_text)
            
        print("*                                    *")
        print("*                                    *")
        print("*                                    *")
        print("**************************************")
    
    def _print_day_with_filler(self, output_length, day_text):
        day_text_length = len(day_text)
        # Subtract 3 because of the leading '* ' and trailing '*'
        filler_space = output_length - day_text_length - 3
        print ("* " + day_text + " " * filler_space + "*")