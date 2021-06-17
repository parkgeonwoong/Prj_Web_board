package tool;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class IO {

	private static final int BUFFER_SIZE = 1024 * 8;
	
	public static void inputStream2OutputStream(InputStream is, OutputStream os) throws IOException {
        int x;
        byte[] buf = new byte[BUFFER_SIZE];
        while ((x = is.read(buf)) != -1) {
            os.write(buf, 0, x);
        }
    }
}
