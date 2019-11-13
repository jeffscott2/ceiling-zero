
class ReportForBoss:
    def __init__(self, rows):
        self.rows = rows


    def print_report(self):
        self.day_counts = self._calculate_incidents_per_day()
        self._print_nice()

    def _calculate_incidents_per_day(self):
        day_counts = {}
        for row in self.rows:
            day = row[0]
            current_count = day_counts.get(day, 0)
            day_counts[day] = current_count + 1
        return day_counts

    def _print_nice(self):
        output_length = len("*                                    *")

        print("**************************************")
        print("******* Incidents Per Day ************")
        print("**************************************")
        print("*                                    *")
        print("*                                    *")
        for day in self.day_counts.keys():
            day_text =  f"{day}: {self.day_counts[day]}"
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