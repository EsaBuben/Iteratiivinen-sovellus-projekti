namespace testidata
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string[] majoitus = { "1139352-4", "1139353-4", "1139354-4", "1139352-5", "Ainon Tupa", "Emman Majoitus", "Maatila majoitus", "Aitta majoitus","030907340", "030907340",
                                  "030907340", "030907340", "info(at)yritys.fi", "info(at)yritys.fi","info(at)yritys.fi","info(at)yritys.fi" };
            System.Console.WriteLine(majoitus[0] + majoitus[4] + majoitus[8] + majoitus[12]);
            System.Console.WriteLine(majoitus[1] + majoitus[5] + majoitus[9] + majoitus[13]);
            System.Console.WriteLine(majoitus[2] + majoitus[6] + majoitus[10] + majoitus[14]);
            System.Console.WriteLine(majoitus[3] + majoitus[7] + majoitus[11] + majoitus[15]);

        }
    }
}
