package abc;

import org.antlr.runtime.ANTLRStringStream;
import org.antlr.runtime.CharStream;
import org.antlr.runtime.CommonTokenStream;
import org.antlr.runtime.RecognitionException;
import org.antlr.runtime.TokenStream;


public class SampleStarter {

	/**
	 * @param args
	 * @throws RecognitionException
	 */
	public static void main (String[] args) throws Exception {
		CharStream input = new ANTLRStringStream("a {b} c {d} e {1}{2}");
		SampleLexer lexer = new SampleLexer(input);
		TokenStream stream = new CommonTokenStream(lexer);
		SampleParser parser = new SampleParser(stream);
		parser.register("");
		String result = parser.rule();
		//result = result.replaceAll("null", ""); // warum null �berall?

		System.out.println("result = '" + result + "'");

	}

}
