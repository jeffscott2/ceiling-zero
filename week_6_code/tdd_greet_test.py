from week_6_code.tdd_greet import greet
import unittest   # The test framework

class Test_Greet(unittest.TestCase):
    # def test_input_list_generation(self):
    #     length = 50
    #     input_list = fb.generate_input_list(length)
    #     self.assertEqual(input_list.__len__(), length)
    
    def test_req_1(self):
        self.assertEquals(greet("Bob"), "Hello, Bob.")
        self.assertEquals(greet("Mike"), "Hello, Mike.")
        
    def test_req_2(self):
        self.assertEquals(greet(None), "Hello, my friend.")


    def test_req_3(self):
        self.assertEquals(greet("Jerry"), "Hello, Jerry.")
        self.assertEquals(greet("JERRY"), "HELLO, JERRY.")

    def test_req_4(self):
        self.assertEquals(greet(["Jill","Jane"]), "Hello, Jill and Jane.")

    def test_req_5(self):
        self.assertEquals(greet(["Amy","Brian", "Charlotte"]), "Hello, Amy, Brian, and Charlotte.")


if __name__ == '__main__':
    unittest.main()

