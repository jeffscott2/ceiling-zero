import week_6_code.fizz_buzz as fb    # The code to test
import unittest   # The test framework

class Test_FizzBuzz(unittest.TestCase):
    def test_input_list_generation(self):
        length = 50
        input_list = fb.generate_input_list(length)
        self.assertEqual(input_list.__len__(), length)
        # first_element = input_list[0]
        # self.assertEqual(first_element, 1)
        # self.assertEqual(input_list[length-1], length)

    # def test_is_divisible(self):
    #     self.assertTrue(4,2)
    #     self.assertTrue(6,3)
    #     self.assertTrue(6,2)
    #     self.assertFalse(7,3)
    #     self.assertFalse(6,3)
        
    # def test_number_to_test(self):
    #     self.assertEqual(fb.number_to_text(1), "1")
    #     self.assertEqual(fb.number_to_text(2), "2")
    #     self.assertEqual(fb.number_to_text(3), "Fizz")
    #     self.assertEqual(fb.number_to_text(5), "Buzz")
    #     self.assertEqual(fb.number_to_text(10), "Buzz")
    #     self.assertEqual(fb.number_to_text(15), "FizzBuzz")


if __name__ == '__main__':
    unittest.main()

