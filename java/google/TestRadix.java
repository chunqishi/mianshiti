package cls;

import org.junit.Test;
import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import static org.junit.Assert.*;
import cls.Radix;


@RunWith(JUnit4.class)
public class TestRadix {

    @Test
    public void testSortRadix() { 

        System.out.println("\n<--------- test -----------");
        int [] in = {170, 45, 75, 90, 802, 2, 24, 66};

        Radix rdx = new Radix();
        long start = System.currentTimeMillis();
        int [] out = rdx.sortRadix(in, in.length);
        long end = System.currentTimeMillis();
        System.out.println("Time Used: " + (end-start));
        int [] target = {2, 24, 45, 66, 75, 90, 170, 802};

        assertArrayEquals("Failure", out, target);
        System.out.println("-------------------------->");
    }


}
