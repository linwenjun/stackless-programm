public class Program {
    public static void main(String[] args) {
        String in = args[0];
        String result = "";

        if(in.equals("a")) {
            result = "c";
        }

        if(in.equals("b")) {
            result = "d";
        }

        System.out.print(result);
    }
}
