
class InventoryTracker:
    
    def __init__(self):
        self.buildings = {}
        self.log = []
        self.day = 1
    
    def add_inventory(self, building_key, count):
        self.buildings[building_key] = self._get_current_inventory_level(building_key) + count
        self.add_log_entry(f"Building {building_key} added {count}")

    def remove_inventory(self, building_key, count):
        self.buildings[building_key] = self._get_current_inventory_level(building_key) - count
        self.add_log_entry(f"Building {building_key} removed {count}")

    def _get_current_inventory_level(self, building_key):
        default_count = 0
        return self.buildings.get(building_key, default_count)

    def print_inventory_by_building(self):
        for key in self.buildings.keys():
            print(f"Building {key}: {self.buildings[key]}")
    
    def print_inventory_total(self):
        total_inventory = sum(self.buildings.values())
        print(f"Total Inventory: {total_inventory}")

    def add_log_entry(self, message):
        self.log.append(message)



i = InventoryTracker()

i.add_inventory(1,3)
i.add_inventory(1,3)
i.add_inventory(2,1)
i.remove_inventory(1,1)
i.add_inventory('the garage',1)
i.add_inventory('the shed',7)
i.print_inventory_by_building()
i.print_inventory_total()
# i.print_log()