/**
 * No Package.
 * problems for most efficient way to sort integers.
 *
 * The efficiency is max{data[i]} / BASE * len
 *
 *
 **/

package cls;

public class Radix {
    public static final int BASE = 10;
    public static final int MAX = 20;

    public int [] sortRadix(int[] data, int len ) {
        int max = data[0];
        int [] b = new int[MAX]; 
        int [] bucket = new int[BASE];
        int crdx = 1;
        for (int i = 1; i < len; i++ ) {
            if (max < data[i]) {
                max = data[i];
            }
        }
        
        while (max / crdx > 0) {

            for (int i = 0; i < BASE; i++) {
                bucket[i] = 0;
            }
            for (int i = 0; i < len; i++) {
                bucket[(data[i]/crdx)%BASE] ++;
            }
            for (int i = 1; i < BASE; i++) {
                bucket[i] += bucket[i-1];
               // System.out.println(bucket[i]);
            }
            // -- bucket, in order to keep the sequence, we have to use i--
            for (int i = len - 1; i >= 0; i--) {
                int idx = --bucket[(data[i]/crdx) % BASE];
                b[idx] = data[i];
            }

            for (int i = 0; i < len; i++) {
                data[i] = b[i];
               //  System.out.print("\t"+data[i]);
            }
            crdx *= BASE;
           // System.out.println("\n>>>>-----------<<<<");
        }

        return data;
    }

    public static void main(String [] args) {
        
    
    }

}


