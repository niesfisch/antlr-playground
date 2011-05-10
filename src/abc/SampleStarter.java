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
		CharStream input = new ANTLRStringStream("a {ba} a");
		SampleLexer lexer = new SampleLexer(input);
		TokenStream stream = new CommonTokenStream(lexer);
		SampleParser parser = new SampleParser(stream);
		String result = parser.rule();
		result = result.replaceAll("null", ""); // warum null überall?

		System.out.println("result = '" + result + "'");

	}

}
