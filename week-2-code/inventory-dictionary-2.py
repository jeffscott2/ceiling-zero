
class InventoryTracker:
    
    def __init__(self):
        self.building_inventory = {}
        self.log = []
        self.day = 1
    
    def add_inventory(self, building_key, count):
        self.building_inventory[building_key] = self._get_current_inventory_level(building_key) + count
        self.add_log_entry(f"Building {building_key} added {count}")

    def remove_inventory(self, building_key, count):
        self.building_inventory[building_key] = self._get_current_inventory_level(building_key) - count
        self.add_log_entry(f"Building {building_key} removed {count}")

    def _get_current_inventory_level(self, building_key):
        default_count = 0
        return self.building_inventory.get(building_key, default_count)

    def print_inventory_by_building(self):
        for key in self.building_inventory.keys():
            print(f"Building {key}: {self.building_inventory[key]}")
    
    def print_inventory_total(self):
        total_inventory = sum(self.building_inventory.values())
        print(f"Total Inventory: {total_inventory}")

    def add_log_entry(self, message):
        self.log.append(message)



it = InventoryTracker()

it.add_inventory(1,3)
it.add_inventory(1,3)
it.add_inventory(2,1)
it.remove_inventory(1,1)
it.print_inventory_total()
it.print_inventory_by_building()
# it.print_log()
