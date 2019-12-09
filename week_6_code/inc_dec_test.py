import week_6_code.inc_dec as inc_dec    # The code to test
import unittest   # The test framework

class Test_TestIncrementDecrement(unittest.TestCase):
    def test_increment(self):
        self.assertEqual(inc_dec.increment(3), 4)

    def test_decrement(self):
        self.assertEqual(inc_dec.decrement(3), 4)
        
    # def test_decrement_almost(self):
    #     self.assertAlmostEquals(inc_dec.decrement(4.00001), 3, 2)

if __name__ == '__main__':
    unittest.main()

