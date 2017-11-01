public class MyClass {
    public static void main(String args[]) {
        byte b;
        int i = 257;
        double d = 323.142;
        double d2;
        float f = 5.65f;
        char c = 'c';
        short s = 1024;
        b = (byte) i;
        System.out.println(b);
        i = (int) d;
        System.out.println(i);
        b = (byte)d;
        System.out.println(b);
        i = (int)f;
        System.out.println(i);
        i = c;
        System.out.println(i);
        f = c;
        d = c;
        i = b * c;
        System.out.println(i);
        d2 = (f*b) + (i/c) - (d*s);
        System.out.println(d2);
    }
}
