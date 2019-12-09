import week_6_code.tdd_prime as p    # The code to test
import unittest   # The test framework

class Test_Prime(unittest.TestCase):
    # def test_input_list_generation(self):
    #     length = 50
    #     input_list = fb.generate_input_list(length)
    #     self.assertEqual(input_list.__len__(), length)
    def test(self):

        self.assertFalse(p.is_prime(4))
        self.assertTrue(p.is_prime(5))
        self.assertFalse(p.is_prime(9))
        
        self.assertFalse(p.is_prime(15))
        self.assertTrue(p.is_prime(17))
        
        # edge cases
        self.assertFalse(p.is_prime(-1))
        self.assertFalse(p.is_prime(0))
        self.assertFalse(p.is_prime(1))
        

if __name__ == '__main__':
    unittest.main()

