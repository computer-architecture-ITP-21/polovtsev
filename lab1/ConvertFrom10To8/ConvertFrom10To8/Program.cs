using System;

namespace ConvertFrom10To8
{
    class Program
    {
        static string ConvertFrom10To8(int num)
        {
            string strNum = "";
            int rem = 0;

            //Цикл, в котором осуществляется деление и нахождение остатка
            while (num >= 8)
            {
                rem = num % 8;
                strNum += rem;
                num /= 8;
            }
            strNum += num;

            char[] arr = strNum.ToCharArray();
            Array.Reverse(arr);
            return new string(arr);
        }

        static void Main(string[] args)
        {
            Console.WriteLine("Введите десятичное целое число:");
            int num = Convert.ToInt32(Console.ReadLine());
            string strNum = ConvertFrom10To8(num);
            Console.WriteLine($"Число {num} в восьмеричной системе счисления: {strNum}");
        }
    }
}
