interface ParserOptions {
    startRule: string;
    tracer: any;
}

interface Parser {
    parse(input: string, options?:ParserOptions): any;
    SyntaxError: any;
}

declare var parser:Parser
export = parser